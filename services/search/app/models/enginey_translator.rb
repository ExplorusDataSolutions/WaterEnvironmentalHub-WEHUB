require 'net/http'
require 'active_support/core_ext'

class EngineYTranslator

  def initialize(server_address = 'localhost:3002')
    @server_address = server_address
    @cookies = nil
    @user = nil
  end

  def sign_in(username, password)
    url_param = sign_in_uri

    timeout = 500
    url = URI.parse(url_param)
    http = Net::HTTP.new(url.host, url.port)
    http.read_timeout = timeout
    http.open_timeout = timeout
    response = http.start {|http| http.post(url.to_s, "{ 'login': '#{username}', 'password': '#{password}', 'remember_me': '1' }", { 'Content-Type' => 'application/json'}) }

    check_response(response)    

    @cookies = response['set-cookie']
    @user = user_from_enginey(response.body)
  end

  def sign_out
    get(sign_out_uri)
    @cookies = nil
    @user = nil
  end
  
  private

  def sign_in_uri
    "http://#{@server_address}/sessions/create/?format=json"
  end

  def sign_out_uri
    "http://#{@server_address}/sessions/destroy"
  end

  def user_from_enginey(response)
    enginey_user = JSON.parse(response)

    User.new(enginey_user['first_name'], enginey_user['last_name'], enginey_user['login'], enginey_user['email'], enginey_user['id'])
  end

  def get(uri)
    url = URI.parse(uri)
    request = Net::HTTP::Get.new(url.to_s)    
    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }

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

