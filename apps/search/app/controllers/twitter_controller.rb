class TwitterController < ApplicationController
  
  caches_action :index, :expires_in => 1.hour
  
  def index
    user_id = '300355990' #id for waterhub
    
    url = URI.parse("https://api.twitter.com/1/statuses/user_timeline.json?user_id=#{user_id}")
    request = Net::HTTP::Get.new(url.to_s)
    response = Net::HTTP.start(url.host, url.port) { |http| http.request(request) }

    render :json => response.body
  end

end
