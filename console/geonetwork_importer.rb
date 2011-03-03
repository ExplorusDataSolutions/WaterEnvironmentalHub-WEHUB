require 'net/http'

class GeoNetworkImporter
  
  def metadata(uuid)
    metadata_uri = "http://localhost:3000/geonetwork/metadata/#{uuid}.xml"
    puts "Getting #{metadata_uri}"
    http_get(metadata_uri)
  end
  
  def upload_mef(uuid)
    
#    result = metadata(uuid)

    geonetwork_uri = "http://localhost:8080/geonetwork/srv/en/xml.user.login"
    puts "Authenticating with GeoNetwork"    
    url = URI.parse(geonetwork_uri)
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><username>development</username><password>development</password></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
    
    cookie = response['set-cookie']
    puts response.body
    
    #geonetwork_uri = "http://10.112.225.22:8888/geonetwork/srv/en/metadata.insert"
    geonetwork_uri = "http://localhost:8080/geonetwork/srv/en/mef.import"
    puts "Posting to GeoNetwork"    
    url = URI.parse(geonetwork_uri)

    boundary = '----RubyMultipartClient' + rand(1000000).to_s + 'ZZZZZ'
    #file = 'C:\Program Files\geonetwork\data\tmp\iso-19115.mef'
    file = 'C:\projects\WEHub\console\iso-19115-1.mef'
    post_body = []
        
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"insert_mode\"\r\n"
    post_body << "\r\n"    
    post_body << "1\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"file_type\"\r\n"
    post_body << "\r\n"    
    post_body << "mef\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"data\"\r\n"
    post_body << "\r\n"    
    post_body << "\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"mefFile\"; filename=\"#{File.basename(file)}\"\r\n"
    post_body << "Content-Type: application/octet-stream\r\n"
    post_body << "\r\n" 

	content = open(file,"rb") do |f|
		f.read()
	end
    post_body << content
    post_body << "\r\n"
    post_body << "--#{boundary}\r\n"  

    post_body << "Content-Disposition: form-data; name=\"template\"\r\n"
    post_body << "\r\n"    
    post_body << "n\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"title\"\r\n"
    post_body << "\r\n"    
    post_body << "\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"uuidAction\"\r\n"
    post_body << "\r\n"    
    post_body << "overwrite\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"styleSheet\"\r\n"
    post_body << "\r\n"    
    post_body << "_none_\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"group\"\r\n"
    post_body << "\r\n"    
    post_body << "2\r\n"
    post_body << "--#{boundary}\r\n"

    post_body << "Content-Disposition: form-data; name=\"category\"\r\n"
    post_body << "\r\n"    
    post_body << "_none_\r\n"
    post_body << "--#{boundary}--\r\n"

    request = Net::HTTP::Post.new(url.path)      
    request.body = post_body.join
    
    request.content_type = "multipart/form-data, boundary=#{boundary}"    
    request['cookie'] = cookie
    
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}

    puts response.body

=begin
    geonetwork_uri = "http://174.129.10.37:8080/geonetwork/srv/en/xml.metadata.get"
    puts "Authenticating with GeoNetwork"    
    url = URI.parse(geonetwork_uri)
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><uuid>#{uuid}</uuid></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
    
    puts response
    
    geonetwork_uri = "http://174.129.10.37:8080/geonetwork/srv/en/xml.user.login"
    puts "Authenticating with GeoNetwork"    
    url = URI.parse(geonetwork_uri)
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><username>development</username><password>development</password></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
    
    cookie = response['set-cookie']
    puts response.body
    
    geonetwork_uri = "http://174.129.10.37:8080/geonetwork/srv/en/metadata.update"
    puts "Posting to GeoNetwork"    
    url = URI.parse(geonetwork_uri)
    request = Net::HTTP::Post.new(url.path)
    
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><group>1</group><category>_none_</category><styleSheet>_none_</styleSheet><data><![CDATA[#{result}]]></data></request>"    
    request['cookie'] = cookie
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    puts response.body
    
=end    
  end
  
  def http_get(uri)
    url = URI.parse(uri)
    request = Net::HTTP::Get.new(url.to_s)    
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    response.body
  end
  
end

test = GeoNetworkImporter.new
test.upload_mef('fe4460ca-6dec-4b65-93fe-9b5d6e31e6e8')