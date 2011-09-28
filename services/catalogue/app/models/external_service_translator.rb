require 'net/http'
require 'active_support/core_ext'

class ExternalServiceTranslator
  attr_accessor :server_address, :timeout
  
  def initialize(server_address=nil, timeout=500)
    @server_address = server_address
    @timeout = timeout
  end
  
  def data(uuid, advanced_search_params)
    meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)

    uri = meta_content.source_uri

    service_id = service_id(uri)

    requests = []
    layers = JSON.parse(http_get(uri))['layerlist']
    if layers.is_a? Array
      layers.each do |layer|
        requests.push(build_request(service_id, layer, advanced_search_params))
      end
    else 
      requests.push(build_request(service_id, layers, advanced_search_params))
    end

    data = {}
    requests.each do |request|
      
      response = JSON.parse(http_post(post_uri(uri), request))
      status = nil
      #Hack for hydat
      if response.is_a?(Array)
        response = response
      else
        status = response['status']
      end
      
      case status
      when nil
        #Hack for hydat      
        if response.is_a?(Array)
          response_hash = Hashie::Mash.new(:result => response)
        else
          response_hash = Hashie::Mash.new(response)
        end
        data[request[:layerid]] = response_hash      
      when !status.scan(/no data found/i).empty?
        raise ArgumentError, "external_service: No data found for time period and bounding box"
      else
        raise ArgumentError, "external_service: #{response.body}"
      end
    end
    if data.empty?
      raise ArgumentError, "external_service: No data could be retrieved"
    end
    
    data
  end
    
  def build_request(service_id, layer, advanced_search_params)
    date_start = advanced_search_params[:start]
    date_end = advanced_search_params[:end]
    north = advanced_search_params[:north].to_i
    east = advanced_search_params[:east].to_i
    south = advanced_search_params[:south].to_i
    west = advanced_search_params[:west].to_i
    
    if !date_start
      date_start = (Time.parse(layer['time']['endtime']) - 72.hours).utc.iso8601.to_s
      date_end = layer['time']['endtime']
    end

    { 
      :request => 'getdata', 
      :serviceid => service_id, 
      :layerid => layer['id'], 
      :time => { :begintime => date_start, :endtime => date_end}, 
      :bbox => {
        :upperright => { :latitude => north, :longitude => east },
        :bottomleft => { :latitude => south, :longitude => west }
      }
    }
  end
  
  def coordinates(uuid)
    nil
  end

  private 
            
  def http_get(uri)
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout    
    response = http.start {|http| http.get(url.to_s) }
    
    response.value
    response.body
  end
  
  def http_post(uri, request)
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, request.to_json, { 'Content-Type' => 'application/json'}) }
    
    response.value
    response.body
  end

  def post_uri(uri)
    result = uri.match(/(?<base>[\w\W]*)\/service/)
    if result
      # Hack for hydat data
      if !result[:base].scan(/136.159.79.145/).empty?
        "#{result[:base]}/"
      else
        result[:base]
      end
    end
  end
  
  def service_id(uri)
    result = uri.match(/.*\/service\/(?<id>.*)/)
    if result
      result[:id]
    end
  end
  
end 
