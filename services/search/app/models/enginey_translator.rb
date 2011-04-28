require 'net/http'
require 'active_support/core_ext'

class EngineYTranslator

  def initialize(storage={}, server_address = 'localhost:3002')
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
    response = http.start {|http| http.post(url.to_s, "{ 'login': '#{username}', 'password': '#{password}', 'remember_me': '1', 'format': 'json' }", { 'Content-Type' => 'application/json'}) }

    check_response(response)    

    self.storage = response['set-cookie']
    @user = user_from_enginey(response.body)
  end

  def sign_out
    get(sign_out_uri)
    self.storage = nil
    @user = nil
  end

  def groups(user_id)

    groups_from_enginey(post_json(groups_uri, "{ 'user_id': '#{user_id}', 'format': 'json' }"))
  end
  
  private

  def groups_uri
    "http://#{@server_address}/groups/index"
  end

  def sign_in_uri
    "http://#{@server_address}/sessions/create"
  end

  def sign_out_uri
    "http://#{@server_address}/sessions/destroy"
  end

  def user_from_enginey(response)
    enginey_user = JSON.parse(response)

    User.new(enginey_user['first_name'], enginey_user['last_name'], enginey_user['login'], enginey_user['email'], enginey_user['id'])
  end

  def groups_from_enginey(response)
    enginey_groups = JSON.parse(response)

    groups = []
    enginey_groups.each do |item|
      groups.push(Group.new(item['id'], item['name'], item['private'], item['description']))
    end

    groups
  end

  def get(uri)
    url = URI.parse(uri)
    request = Net::HTTP::Get.new(url.to_s)    
    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }

    check_response(response)

    response.body
  end

  def post_json(uri, body)
    url = URI.parse(uri)
    request = Net::HTTP::Post.new(url.path)
    request.body = body
    request.content_type = 'application/json'
    request['cookie'] = self.storage
    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}
    
    check_response(response)

    response.body
  end

  def check_response(response)
    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
    else
      response.error!  
    end
  end
end
