require 'net/http'
require 'active_support/core_ext'

class GeoCensTranslator
  attr_accessor :server_address, :timeout
  
  def initialize(server_address = '50.19.106.48:8080', timeout=300)
    @server_address = server_address
    @timeout = timeout
  end

  def data(uuid)

    meta_content = FeatureMetaContent.find_by_dataset_uuid(uuid)

    uri = meta_content.source_uri
    layers = JSON.parse(http_get(uri))['layerlist']
    
    splits = uri.split('/')    
    service_id = Integer(splits[splits.count-1])

    requests = []
    layers.each do |layer|
      date = layer['time']['endtime']
      requests.push({ 
        :request => 'getdata', 
        :serviceid => service_id, 
        :layerid => layer['id'], 
        :time => { :begintime => (Time.parse(date) - 72.hours).utc.iso8601.to_s, :endtime => date}, 
        :bbox => { 
          :upperright => { :latitude => layer['bbox']['upperright']['latitude'], :longitude => layer['bbox']['upperright']['longitude'] },
          :bottomleft => { :latitude => layer['bbox']['bottomleft']['latitude'], :longitude => layer['bbox']['bottomleft']['longitude'] }
        }
      })
    end

    data = {}
    requests.each do |request|
      response = JSON.parse(http_post(request))
      if response['status'].nil?
        response_hash = Hashie::Mash.new(response)
        data[response_hash.layerid] = response_hash
      end
    end
    
    data
  end
  
  def coordinates(uuid)
    nil
  end
          
  def http_get(uri)
    url = URI.parse(uri)    
    puts "Getting #{url}"
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout    
    response = http.start {|http| http.get(url.to_s) }
    
    response.value
    response.body
  end
  
  def http_post(request)
    timeout = 500
    url = URI.parse("http://wehub.geocens.ca:8182/wehub")
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout

    response = http.start {|http| http.post(url.to_s, request.to_json, { 'Content-Type' => 'application/json'}) }
    
    response.value
    response.body
  end

end 

#puts GeoCensTranslator.new.data('01586b34-b2f9-11e0-aea8-0050ba2647ec')
