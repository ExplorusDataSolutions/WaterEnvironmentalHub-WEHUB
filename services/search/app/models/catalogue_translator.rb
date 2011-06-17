require 'rexml/document'
require 'net/http'
require 'active_support/core_ext'

class CatalogueTranslator
  attr_accessor :url
  
  def initialize(url = "http://localhost:3000")
    @url = url    
  end
  
  def item_uri(id)
    "#{url}/items/?id=#{id}&format=xml"
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

  def dataset(id)
    xml_to_mash(get(item_uri(id)))['dataset']
  end

  def find_recently_viewed(user_id)
    get("#{user_recently_viewed_uri}?user_id=#{user_id}")
  end

  def find_saved(user_id)
    get("#{user_saved_uri}?user_id=#{user_id}")
  end
  
  def find_datasets_by_user(user_ids)
    datasets = xml_to_mash(get("#{user_datasets_uri}?user_ids=#{user_ids}&format=xml"))['datasets'] 
    datasets.sort_by! { |dataset| dataset.date }.reverse! unless datasets.nil?
    datasets
  end

  def find_datasets_by_group(group_ids)
    datasets = xml_to_mash(get("#{user_datasets_uri}?group_ids=#{group_ids}&format=xml"))['datasets']
    datasets.sort_by! { |dataset| dataset.date }.reverse! unless datasets.nil?
    datasets
  end

  def get(uri)
    Net::HTTP::get(URI.parse(uri))
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
  
  def user_datasets_uri
    "#{url}/user/datasets"
  end

  def xml_to_mash(value)
    Hashie::Mash.new(Hash.from_xml(value))
  end

  def json_to_mash(value)
    Hashie::Mash.new(JSON.parse(value))
  end

end
