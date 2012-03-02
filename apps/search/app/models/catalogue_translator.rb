require 'rexml/document'
require 'net/http'
require 'active_support/core_ext'
require 'hashie'

class CatalogueTranslator
  attr_accessor :url, :cache
  
  def initialize(url="http://localhost:3000", cache={})
    @url = url
    @cache = cache
  end
  
  def item_uri(id)
    "#{url}/items/?id=#{id}&format=xml"
  end
 
  def download_uri(params)
    if params[:filename]
      "#{url}/items/download/?filename=#{params[:filename]}"
    else
      date_start = params[:start]      
      date_end = params[:end]
      period = ''
      if date_start && date_end
        if !date_start.empty?
          date_start = Time.parse(date_start).utc.iso8601.split('T')[0]
        end
        
        if !date_end.empty?
          date_end = Time.parse(date_end).utc.iso8601.split('T')[0]
        end

        period = "&start=#{date_start}&end=#{date_end}"
      end
      
      bounding_box = ''
      north = params[:north]
      east = params[:east]
      south = params[:south]
      west = params[:west]
      if north && east && south && west
        bounding_box = "&north=#{north}&east=#{east}&south=#{south}&west=#{west}"
      end
      
      layer = ''
      if params[:layer]
        layer = "&layer=#{params[:layer]}"
      end
      
      "#{url}/items/download/?ids=#{params[:ids]}&format=#{params[:format]}#{bounding_box}#{period}#{layer}"
    end
  end
  
  def download(params)
    get(download_uri(params))
  end
  
  def create(params)
    json_to_mash(post_json("#{url}/items/create", params))
  end
  
  def add_recently_viewed(user_id, dataset_uuid)
    response = post_json(user_recently_viewed_uri, { 
      :user_id => "#{user_id}", 
      :uuid => "#{dataset_uuid}"
    })
    cache.delete(recently_viewed_key(user_id)) unless response.nil?
    response
  end

  def user_collections(user_id, dataset_uuids, modifier)
    response = post_json(user_saved_uri, { :user_id => "#{user_id}", 
      :uuids => "#{dataset_uuids}",
      :modifier => "#{modifier}"
    })
    cache.delete(saved_key(user_id)) unless response.nil?    
    response
  end

  def dataset(id)
    xml_to_mash(get(item_uri(id)))['dataset']
  end

  def recently_viewed_key(user_id)
    "#{user_id}_user_recently_viewed"
  end
  
  def find_recently_viewed(user_id)
    cache.fetch(recently_viewed_key(user_id), :expires_in => 3.hour) do
      get("#{user_recently_viewed_uri}?user_id=#{user_id}")
    end
  end
  
  def saved_key(user_id)
    "#{user_id}_user_saved"
  end
  
  def find_saved(user_id)
    cache.fetch(saved_key(user_id), :expires_in => 3.hour) do
      get("#{user_saved_uri}?user_id=#{user_id}")
    end
  end
  
  def find_reviews(uuid, page=1, page_size=5)
    xml_to_mash(get("#{user_reviews_uri}?id=#{uuid}&page=#{page}&page_size=#{page_size}&format=xml"))['user_reviews']
  end
  
  def find_user_reviews(user_id)
    xml_to_mash(get("#{url}/user/reviews?id=#{user_id}&format=xml"))
  end
  
  def create_review(params)
    response = post_json("#{user_reviews_uri}?format=json", :review => params)
    json_to_mash(response)['user_review'] unless response.nil?
  end
  
  def find_review_summary(uuid)
    #Todo: fix 500 error being thrown from catalogue service when reviews don't exist
    begin
      response = get("#{url}/reviews/summary?id=#{uuid}&format=json")
      json_to_mash(response) unless response.nil?
    rescue
    end
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

  def find_datasets_by_keyword(keywords, user_id, group_ids)
    if !group_ids.nil?
      group_ids = group_ids.join(',')
    end
    datasets = xml_to_mash(get("#{user_search_datasets_uri}?keywords=#{keywords}&user_ids=#{user_id}&group_ids=#{group_ids}&format=xml"))['datasets']
    datasets
  end

  def api_feature_types
    feature_types = xml_to_mash(get("#{api_uri}/feature_types?format=xml"))['feature_types']
  end
  
  def api_is_feature_external(dataset_id)
    feature_types = get("#{api_uri}/is_feature_external?id=#{dataset_id}&format=json")
  end

  def api_datasets_by_feature_type_id(feature_type_id)
    datasets = xml_to_mash(get("#{api_uri}/datasets?feature_type_id=#{feature_type_id}&format=xml"))['datasets']
  end
  
  def api_datasets(params)
    datasets = xml_to_mash(get("#{api_uri}/datasets?#{clean(params).to_query}"))['datasets']
  end

  def api_shared_properties(params)
    params = CGI.unescape(clean(params, 'json').to_query)
    result = get("#{api_uri}/shared_properties?#{params}")
    json_to_mash(result)
  end
  
  def api_feature_fields_by_type(params)
    json_to_mash(get("#{api_uri}/feature_fields_by_type?#{clean(params, 'json').to_query}"))
  end
  
  def api_dataset_raw(dataset_id, format)
    get("#{api_uri}/dataset?id=#{dataset_id}&format=#{format}")
  end

  def api_feature_raw(params)
    get("#{api_uri}/feature?#{params.to_query}")
  end
  
  def api_feature(params)
    json_to_mash(get("#{api_uri}/feature?#{clean(params, 'json').to_query}&output=json"))
  end

  def datasets_by_type
    json_to_mash(get("#{statistics_uri}/datasets_by_type?format=json"))
  end

  def datasets_last_uploaded
    json_to_mash(get("#{statistics_uri}/last_uploaded?format=json"))['datasets']
  end
  
  def clean(params, format='xml')
    params.delete(:controller)
    params.delete(:action)
    params[:format] = format
    params.delete(:utf8)
    params.delete(:authenticity_token)
    params
  end
  
  def get(uri)
    timeout = 500

    url = URI.parse(uri)    
    puts "Getting #{url}"
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout    
    response = http.start {|http| http.get(url.request_uri) }

    response.value
    response.body
  end

  def statistics_uri
    "#{url}/statistics"
  end
  
  def api_uri
    "#{url}/api"
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

  def user_search_datasets_uri
    "#{url}/user/search"
  end
  
  def user_reviews_uri
    "#{url}/reviews"
  end

  def post_json(uri, json_hash={})
    json_hash.delete(:utf8)
    json_hash.delete(:authenticity_token)
    json_hash.merge!(:format => "json")
    timeout = 500
    url = URI.parse(uri)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout    
    response = http.start {|http| http.post(url.to_s, json_hash.to_json, { 'Content-Type' => 'application/json'}) }
    
    response.value
    response.body
  end  

  def xml_to_mash(value)
    Hashie::Mash.new(Hash.from_xml(value))
  end

  def json_to_mash(value)
    Hashie::Mash.new(JSON.parse(value))
  end

end

