require 'net/http'
require 'active_support/core_ext'

class GroupImporter
  
  attr_accessor :catalogue_server_address, :geoserver_server_address, :timeout, :username, :password, :cookies
  
  def initialize(catalogue_server_address='localhost:3000', geoserver_server_address='174.129.10.37:8080', timeout=300, username='development', password='development')
    @geoserver_server_address = geoserver_server_address
    @catalogue_server_address = catalogue_server_address
    @server_address = server_address
    @timeout = timeout
    @username = username
    @password = password
  end
  
  def group(id)
    http_get("http://#{catalogue_server_address}/geonetwork/group/#{id}.xml")
  end
  
  def group_list
    http_get("http://#{catalogue_server_address}/geonetwork/group-import-list.xml")
  end
  
  def import_all    
    groups = []

    group_ids = Hash.from_xml(group_list)['strings']
    
    group_ids.each do |id|
      groups.push(group(id))
    end
    
    authenticate    
    groups.each do |group|
      import_group(group)
    end    
  end

  def import_group(group)
    puts "Uploading #{group} to GeoNetwork"

    url = URI.parse("http://#{geoserver_server_address}/geonetwork/srv/en/group.update")
    request = Net::HTTP::Post.new(url.path)
    request.body = group
    request.content_type = "text/xml"
    request['cookie'] = cookies    
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      puts "Success!"
    else
      puts response.body
      response.error!
    end

  end
  
  def http_get(uri)
    puts "Getting #{uri}"

    url = URI.parse(uri)    
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.get(url.to_s) }
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      puts "Success!"
    else
      response.error!  
    end

    response.body

  end
  
  def authenticate
    puts "Authenticating user #{username} with GeoNetwork"    
    
    url = URI.parse("http://#{geoserver_server_address}/geonetwork/srv/en/xml.user.login")  
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><username>#{username}</username><password>#{password}</password></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request) }
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      puts "Success!"
      @cookies = response['set-cookie']
    else
      response.error!  
    end    
  end
end

test = GroupImporter.new
test.import_all