require 'net/http'

class Importer
  attr_accessor :cookies, :server_address, :temp_directory, :username, :password, :boundary
  
  def initialize(temp_directory='tmp/mefs', server_address='174.129.10.37:8080', username='development', password='development')
    @server_address = server_address
    @temp_directory = temp_directory
    @username = username
    @password = password
    @boundary = '----RubyMultipartClient' + rand(1000000).to_s + 'ZZZZZ'
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
  
  def build_post(file)  
    post_body = []        
    post_body << "--#{@boundary}\r\n"

    form_values = { :insert_mode => '1', 
                    :file_type => 'mef', 
                    :data => '', 
                    :template => 'n', 
                    :title => '', 
                    :uuidAction => 'overwrite', 
                    :styleSheet => '_none_', 
                    :group => '2', 
                    :category => '_none'}
                    
    form_values.each do |key, value|
      post_body << "Content-Disposition: form-data; name=\"#{key}\"\r\n"
      post_body << "\r\n"    
      post_body << "#{value}\r\n"
      post_body << "--#{@boundary}\r\n"      
    end
      
    post_body << "Content-Disposition: form-data; name=\"mefFile\"; filename=\"#{File.basename(file)}\"\r\n"
    post_body << "Content-Type: application/octet-stream\r\n"
    post_body << "\r\n" 
  	content = open(file,"rb") do |f|
  		f.read()
  	end
  	post_body << content
  	post_body << "\r\n"
    post_body << "--#{@boundary}--\r\n"    
    
    post_body
  end
  
  def upload_mef(file)
    puts "Uploading MEF to GeoNetwork"    

    url = URI.parse("http://#{server_address}/geonetwork/srv/en/mef.import")
    request = Net::HTTP::Post.new(url.path)
    puts build_post(file).join
    request.body = build_post(file).join
    request.content_type = "multipart/form-data, boundary=#{@boundary}"    
    request['cookie'] = @cookies    
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}

    puts response.body
  end
  
  def upload_all
    authenticate
    
    mef_files = Dir.glob("#{Dir.getwd}/#{temp_directory}/*.mef")
    puts "#{mef_files} to be uploaded"
    mef_files.each do |file|
      upload_mef(file)
    end
  end
end