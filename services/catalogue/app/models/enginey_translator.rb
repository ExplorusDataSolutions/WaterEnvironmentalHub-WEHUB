require 'net/http'
require 'active_support/core_ext'
require 'rexml/document'

class EngineYTranslator
  attr_accessor :cache

  def initialize(server_address='http://localhost:3002', cache={})
    @server_address = server_address
    @cache = cache
    @user = nil
  end

  def groups_cache_key
    "groups_cache_key"
  end
  
  def groups_all
    groups = []

    if cache.exist?(groups_cache_key)
      groups = cache.fetch(groups_cache_key)
    else    
      groups = xml_to_mash(get("#{groups_uri}/?format=xml"))['groups']
      groups.sort_by! { |group| group.name } unless groups.nil?
      cache.write(groups_cache_key, groups) unless !groups || groups.empty?
    end
    
    groups
  end
  
  def public_group?(group_id)  
    groups_all.each do |group|
      if group.id == group_id && !group.private
        return true
      end
    end
    return false
  end
  
  private
  
  def groups_uri
    "#{@server_address}/groups"
  end

  def get(uri)
    begin
      url = URI.parse(uri)
      request = Net::HTTP::Get.new(url.to_s)    
      response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }

      check_response(response)
      response.body
    rescue
      nil
    end
  end

  def check_response(response)
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
    else
      response.error!  
    end
  end

  def xml_to_mash(value)
    Hashie::Mash.new(Hash.from_xml(value))
  end

end
