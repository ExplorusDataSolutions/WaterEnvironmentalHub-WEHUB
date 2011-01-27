#$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
#require 'rubygems'
#require 'weary'

class GeoNetworkRepository
  def find(query)
    weary = Repository.new
#    weary.show('mwunsch','weary').perform do |response|
#      response.body
#    end
    weary.find(query)
  end
end

class Repository
  
#  def show(user, repo)
#    Weary.get "http://github.com/api/v2/yaml/repos/show/#{user}/#{repo}"
#  end
  
  def find(query)
    url = URI.parse('http://174.129.10.37:8080/geonetwork/srv/en/rss.search')
    request = Net::HTTP::Post.new(url.path)
    request.body = "<?xml version='1.0' encoding='UTF-8'?><request><georss>simplepoint</georss><any>africa</any></request>"    
    request.content_type = "text/xml"
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    response.body
  end
      
end

