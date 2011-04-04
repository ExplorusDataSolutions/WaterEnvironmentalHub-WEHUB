require 'rexml/document'
require 'net/http'

class CatalogueTranslator
  attr_accessor :url
  
  def initialize(url = "http://localhost:3000/items")
    @url = url    
  end
  
  def item_uri(id)
    "#{url}/show/#{id}"
  end
  
  def download_uri(params)
    "#{url}/download/?id=#{params[:ids]}&format=#{params[:format]}"
  end
  
  def find_by_id(id)
    get(item_uri(id))
  end
  
  def get(uri)
    url = URI.parse(uri)
    request = Net::HTTP::Get.new(url.to_s)    
    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }
    
    response.body    
  end
  
  def create_uri
    "#{url}/create"
  end
end