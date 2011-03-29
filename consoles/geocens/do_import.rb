require 'active_support/core_ext'
require 'net/http'

def http_get(url_param)
  url = URI.parse(url_param)
  http = Net::HTTP.new(url.host, url.port)
  response = http.start {|http| http.get(url.to_s) }
  
  check_response(response)
  
  response.body
end

def check_response(response)
  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
  else
    response.error!  
  end
end


def get_geocens_data(url_param, service_id, layer_id)
  geocens_request = { 
    :request => "getdata", 
    :serviceid => service_id, 
    :layerid => layer_id, 
    :time => { 
      :begintime => "2000-12-08T15:00:00.0 -0700",
      :endtime => "2010-12-08T15:00:00.0 -0700" 
    },
    :bbox => {
      :upperright => {
          :latitude => "90",
          :longitude => "180" 
      },
      :bottomleft => {
          :latitude => "-90" ,
          :longitude => "-180" 
      }
    }
  }
  url = URI.parse(url_param)
  request = Net::HTTP::Post.new(url.path)
  request.body = geocens_request.to_json
  request.content_type = "application/json"
  response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
  
  check_response(response)
  
  if !response.body.empty?
    data = (JSON.parse(response.body))['data']
    if !data.nil? && !data.empty?
      puts "Success! Service id: #{service_id}, Layer id: #{layer_id}"
    end
  end
end

service_list = (JSON.parse(http_get('http://wehub.geocens.ca:8182/wehub/services')))['servicelist']
service_list.each do |service|
  1..10.times do |layer|
    get_geocens_data("http://wehub.geocens.ca:8182/wehub", service['id'], layer)
  end
end
