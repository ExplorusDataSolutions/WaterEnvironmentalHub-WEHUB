require 'net/http'
require 'active_support/core_ext'

class ExternalServiceTranslator

  include GisHelper
  
  attr_accessor :timeout
  
  def initialize(timeout=500)
    @timeout = timeout
  end
  
  def data(uuid, params)
    meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)

    uri = meta_content.source_uri

    service_id = service_id(uri)

    requests = []

    layers = params[:layer] ? meta_content.layers.select { |l| l.layer_id == params[:layer] } : meta_content.layers    
    layers = meta_content.layers if layers.empty?
    
    layers.each do |layer|
      requests.push(build_request(service_id, layer, params))
    end unless !layers
    
    data = {}
    errors = []

    requests.each do |request|

      puts "external_service_translator: #{post_uri(uri)} \n\t request: #{request}"            
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
        errors.push("700: No data found for time period and bounding box")
      else
        errors.push("500: #{status.nil? ? response : status}")
      end
    end
    
    if data.empty?
      if errors.empty?
        raise ArgumentError, "600: No data could be retrieved"
      else
        raise ArgumentError, errors.uniq.join(',  ')
      end
    end
    
    data
  end
    
  def build_request(service_id, layer, params)
    date_start = params[:start]
    date_end = params[:end]

    if (params[:north] == "")
      params.merge!(bounding_box_from_string(layer.bounding_box))
    end

    north = params[:north].to_i
    east = params[:east].to_i
    south = params[:south].to_i
    west = params[:west].to_i
    
    if !date_start || date_start.empty?
      date_start = (Time.parse(layer.feature_period.split(' - ')[1]) - 72.hours).utc.iso8601.to_s
      date_end = Time.parse(layer.feature_period.split(' - ')[1]).utc.iso8601.to_s
    end
    
    if north == 0 || east == 0 || south == 0 || west == 0    
      bbox = bounding_box_from_string(layer.bounding_box)
      north = bbox[:north].to_i
      east = bbox[:east].to_i
      south = bbox[:south].to_i
      west = bbox[:west].to_i
    end

    { 
      :request => 'getdata', 
      :serviceid => service_id, 
      :layerid => layer.layer_id, 
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
      # Hack for hydat data and alberta water data
      if !result[:base].scan(/136.159.79.145/).empty? || !result[:base].scan(/www.albertawater.com/).empty?
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
