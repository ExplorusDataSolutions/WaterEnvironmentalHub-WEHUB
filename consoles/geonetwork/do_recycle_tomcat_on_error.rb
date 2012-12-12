require 'net/http'

def authenticate(username, password, server_address)
  url = URI.parse("http://#{server_address}/geonetwork/srv/en/xml.user.login")
  request = Net::HTTP::Post.new(url.path)
  request.body = "<?xml version='1.0' encoding='UTF-8'?><request><username>#{username}</username><password>#{password}</password></request>"    
  request.content_type = "text/xml"
  response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
    
  case response
  when Net::HTTPSuccess, Net::HTTPRedirection
    puts "GeoNetwork is working"
  else
    if response.body && response.body.match(/ERROR: out of shared memory/)
      raise "GeoNetwork is broken"
    end
    response.error!  
  end
    
end

begin
  authenticate('development','development','localhost:8080')
rescue Exception => e
  puts "GeoNetwork is broken. Error #{e}"
  puts %x[sudo /etc/init.d/tomcat6 restart]
end
