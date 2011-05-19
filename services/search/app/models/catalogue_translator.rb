require 'rexml/document'
require 'net/http'
require 'active_support/core_ext'

class CatalogueTranslator
  attr_accessor :url
  
  def initialize(url = "http://localhost:3000")
    @url = url    
  end
  
  def item_uri(id)
    "#{url}/items/show/#{id}"
  end
  
  def download_uri(params)
    "#{url}/items/download/?id=#{params[:ids]}&format=#{params[:format]}"
  end
  
  def add_recently_viewed(user_id, dataset_uuid)
    timeout = 500
    url = URI.parse(user_recently_viewed_uri)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, { 
      :user_id => "#{user_id}", 
      :uuid => "#{dataset_uuid}",
      :format => "json" 
    }.to_json, { 'Content-Type' => 'application/json'}) }

    response.value
    response.body
  end

  def find_by_id(id)
    get(item_uri(id))
  end

  def find_recently_viewed(user_id)
    get("#{user_recently_viewed_uri}?user_id=#{user_id}")
  end

  def find_saved(user_id)
    get("#{user_saved_uri}?user_id=#{user_id}")
  end
  
  def get(uri)
    url = URI.parse(uri)
    request = Net::HTTP::Get.new(url.to_s)    
    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }
    
    response.body    
  end
  
  def create_uri
    "#{url}/items/create"
  end

  def user_saved_uri
    "#{url}/user/saved"
  end 

  def user_recently_viewed_uri
    "#{url}/user/recently_viewed"
  end 

end
