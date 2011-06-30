require 'net/http'
require 'active_support/core_ext'

class GroupImporter
  
  attr_accessor :catalogue_server_address, :geoserver_server_address, :timeout, :username, :password, :cookies
  
  def initialize(catalogue_server_address='localhost:3000', geoserver_server_address='50.19.106.48:9090', timeout=300, username='development', password='development')
    @geoserver_server_address = geoserver_server_address
    @catalogue_server_address = catalogue_server_address
    @timeout = timeout
    @username = username
    @password = password
  end
  
  def group_info(name)
    http_get("http://#{catalogue_server_address}/geonetwork/group/#{name}.xml")
  end
  
  def group_list
    http_get("http://#{catalogue_server_address}/geonetwork/group-import-list.xml")
  end
  
  def group_list_geonetwork
    url = URI.parse("http://#{geoserver_server_address}/geonetwork/srv/en/xml.group.list")
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request />"
    request.content_type = "text/xml"
    request['cookie'] = cookies
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    group_list = {}
    doc = REXML::Document.new(response.body)
    doc.elements.each('response/record') do |record|
      group_list.store(record.elements['name'].text, record.elements['id'].text)
    end
    
    group_list
  end
    
  def import_all    
    groups = []

    group_ids_from_catalogue = Hash.from_xml(group_list)['hash']
    
    
    group_ids_from_geonetwork = group_list_geonetwork
    
    group_ids_from_catalogue.each do |key, value|
      if (group_ids_from_geonetwork.count == 0 || group_ids_from_geonetwork.key?(key))
        groups.push(group_info(key))
      end
    end
    
    puts groups
    
    authenticate
    groups.each do |group|
      import_group(group)
    end    
  end

  def import_group(group)
    puts "Uploading group to GeoNetwork"

    url = URI.parse("http://#{geoserver_server_address}/geonetwork/srv/en/group.update")
    request = Net::HTTP::Post.new(url.path)
    request.body = group
    request.content_type = "text/xml"
    request['cookie'] = cookies
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      puts response.body
      puts "Success!"
    else
      puts response.body
      #response.error!
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
