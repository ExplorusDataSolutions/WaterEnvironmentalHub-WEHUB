class ItemController < ApplicationController

  respond_to :json, :xml

  protect_from_forgery :except => :do_create
  
  def id
    render :json => catalogue_instance.find_by_id(params[:id])
  end
  
  def download
    begin
      if params[:filename]
        send_data catalogue_instance.download(params), :filename => params[:filename], :type => "application/zip"
      else
        render :json => catalogue_instance.download(params)
      end
    rescue Exception => e
      render :status => :service_unavailable, :text => e
    end
  end
      
end
