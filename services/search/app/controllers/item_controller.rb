class ItemController < ApplicationController
  protect_from_forgery :except => :do_create
  
  def id
    render :json => catalogue_instance.find_by_id(params[:id])
  end
  
  def download
    redirect_to catalogue_instance.download_uri(params)
  end
  
  def create
  end
  
  def do_create
    debugger
#    render :text => request.body.to_json
#    render :text => request.host
    url = URI.parse(catalogue_instance.create_uri)
    pass_request = Net::HTTP::Post.new(url.path)
    pass_request.body = request.body
    puts request.content_type
    pass_request.content_type = request.content_type

    response = Net::HTTP.start(url.host, url.port) {|http| http.request(request)}

  end
    
end
