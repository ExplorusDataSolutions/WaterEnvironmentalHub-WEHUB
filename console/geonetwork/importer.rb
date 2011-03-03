require 'net/http'

class Importer
  attr_accessor :cookies, :server_address, :temp_directory, :username, :password
  
  def initialize(temp_directory='tmp/mefs', server_address='174.129.10.37:8080', username='development', password='development')
    @server_address = server_address
    @temp_directory = temp_directory
    @username = username
    @password = password
  end  

  def authenticate()
    puts "Authenticating with GeoNetwork"    
    
    url = URI.parse("http://#{server_address}/geonetwork/srv/en/xml.user.login")
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><username>#{@username}</username><password>#{@password}</password></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
    
    #ToDo: insert response code logic here
    @cookies = response['set-cookie']
    
    puts response.body
  end
  
  def upload_mef(file)
=begin
    ToDo: DRY this method up
=end    
    puts "Uploading MEF to GeoNetwork"    
    
    boundary = '----RubyMultipartClient' + rand(1000000).to_s + 'ZZZZZ'
    
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

    url = URI.parse("http://#{server_address}/geonetwork/srv/en/mef.import")
    request = Net::HTTP::Post.new(url.path)      
    request.body = post_body.join  
    request.content_type = "multipart/form-data, boundary=#{boundary}"    
    request['cookie'] = @cookies    
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}

    puts response.body
  end
  
  def upload_all
    authenticate
    
    mef_files = Dir.glob("#{Dir.getwd}/#{temp_directory}/*.mef")
    mef_files.each do |file|
      upload_mef(file)
    end
  end
end