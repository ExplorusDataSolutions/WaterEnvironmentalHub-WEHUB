require 'net/http'
require 'active_support/core_ext'
require 'rexml/document'

class EngineYTranslator

  def initialize(server_address='http://localhost:3002', storage={})
    @server_address = server_address
    @storage = storage
    @user = nil
  end

  def storage
    @storage[:enginey_cookies]
  end

  def storage=(value)
    @storage[:enginey_cookies] = value
  end

  def sign_in(username, password)
    url_param = sign_in_uri

    timeout = 500
    url = URI.parse(url_param)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, { 
      :login => "#{username}", 
      :password => "#{password}", 
      :remember_me => "1", 
      :format => "json" 
    }.to_json, { 'Content-Type' => 'application/json'}) }

    response.value    

    self.storage = response['set-cookie']
    @user = user_from_enginey(response.body)
  end

  def register(user)
    url_param = register_uri

    timeout = 500
    url = URI.parse(url_param)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, {
      :user => {
        :login => user[:login],
        :first_name => user[:first_name],
        :last_name => user[:last_name],
        :email => user[:email],
        :password => user[:password],
        :password_confirmation => user[:password_confirmation]
      },
      :format => "json"
    }.to_json, { 'Content-Type' => 'application/json'}) }


    response.value    

    self.storage = response['set-cookie']
    @user = user_from_enginey(response.body)  
  end

  def sign_out
    get(sign_out_uri)
    self.storage = nil
    @user = nil
  end

  def logged_in?
    post_json(signed_in_uri)
  end
  
  def friends(user_id)
    xml_to_mash(get("#{friends_uri}/index?user_id=#{user_id}&format=xml"))['users']
  end
    
  def friend_add(friend_id)
    post_json("#{friends_uri}/create", { :friend_id => friend_id })
    post_json("#{friends_uri}/update", { :id => friend_id })
  end
  
  def friend_remove(user_id, friend_id)
    begin
      post_json("#{friends_uri}/destroy", { :user_id => user_id, :id => friend_id })
    rescue
    end
  end

  def users
    xml_to_mash(get("#{profile_uri}?format=xml"))['users']
  end
  
  def profile(user_id)
    xml_to_mash(get("#{profile_uri}/#{user_id}?format=xml"))['user']
  end
  
  def profile_update(user_id, params)
    timeout = 500
    url = URI.parse("#{profile_uri}/update?format=json")
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, {
      :id => user_id,
      :user => params[:user],
      :format => "json"
    }.to_json, { 'Content-Type' => 'application/json'}) }
    
  end

  def user_groups(user_id)
    groups = xml_to_mash(get("#{profile_uri}/#{user_id}/groups?format=xml"))['groups']
    groups.sort_by! { |group| group.name } unless groups.nil?
    groups
  end

  def groups_all
    groups = xml_to_mash(get("#{groups_uri}/?format=xml"))['groups']
    groups.sort_by! { |group| group.name } unless groups.nil?
    groups
  end

  def group_create(params)
    json_to_mash(post_json("#{groups_uri}/create?", params))
  end

  def group_update(params)
    params.merge!(:id => params[:group][:id])
    json_to_mash(post_json("#{groups_uri}/update", params))
  end

  def group(group_id)
    group = xml_to_mash(get("#{groups_uri}/#{group_id}?format=xml"))
    group['group'] unless group.nil?
  end
  
  def group_members(group_id)
    members = xml_to_mash(get("#{groups_uri}/user_data?group_id=#{group_id}&format=xml"))
    members['hash']['items'] unless members.nil?
  end
  
  def membership_create(params)
    post_json("#{memberships_uri}/create", params)
  end

  def membership_delete(params)
    user_ids = []
    params[:members].each { |k,v| user_ids.push(k) }    
    post_json("#{memberships_uri}/destroy", { :user_ids => user_ids, :group_id => params[:group][:id] })
  end

  def membership_promote(params)
    user_ids = []
    params[:members].each { |k,v| user_ids.push(k) }    
    post_json("#{memberships_uri}/update", { :user_ids => user_ids, :group_id => params[:group][:id], :task => 'promote' })
  end
  
  def membership_authorize(params)
    user_ids = []
    params[:members].each { |k,v| user_ids.push(k) }    
    post_json("#{memberships_uri}/authorize", { :user_ids => user_ids, :group_id => params[:group][:id] })
  end

  def verify_api_key(api_key)
    get("#{api_uri}?id=#{api_key}")
  end
  
  def create_api_key
    post_json("#{api_uri}s/create", {})
  end
  
  private
  
  def friends_uri
    "#{@server_address}/friends"
  end

  def profile_uri
    "#{@server_address}/users"
  end
  
  def register_uri
    "#{@server_address}/users/create"
  end

  def signed_in_uri
    "#{@server_address}/sessions/logged_in"
  end

  def groups_uri
    "#{@server_address}/groups"
  end

  def memberships_uri
    "#{@server_address}/memberships"
  end
  
  def sign_in_uri
    "#{@server_address}/sessions/create"
  end

  def sign_out_uri
    "#{@server_address}/sessions/destroy"
  end
  
  def api_uri
    "#{@server_address}/api_key"  
  end

  def user_from_enginey(response)
    enginey_user = JSON.parse(response)
    
    User.new(:first_name => enginey_user['first_name'], :last_name => enginey_user['last_name'], :login => enginey_user['login'], :email => enginey_user['email'], :id => enginey_user['id'], :api_key => enginey_user['api_key'])
  end

  def get(uri)
    url = URI.parse(uri)
    request = Net::HTTP::Get.new(url.to_s)    
    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }

    check_response(response)
    response.body
  end

  def post_json(uri, json_hash={})
    json_hash.merge!(:format => "json")
    url = URI.parse(uri)
    request = Net::HTTP::Post.new(url.path)
    request.body = json_hash.to_json
    request.content_type = 'application/json'
    request['cookie'] = self.storage
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    response.value
    response.body
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

  def json_to_mash(value)
    Hashie::Mash.new(JSON.parse(value))
  end

end
