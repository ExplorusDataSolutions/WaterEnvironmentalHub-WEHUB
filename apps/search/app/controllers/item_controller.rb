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
  
  def create
  end
    
  def upload
    uploaded_file = params[:filename]
    
    filename = sanitize_filename(uploaded_file.original_filename)

    filename_and_path = Rails.root.join('public', 'uploads', filename)
    File.open(filename_and_path, 'wb') do |file|
      file.write(uploaded_file.read)
    end

    params[:filename] = filename_and_path

    response = {}
    begin
      response = catalogue_instance.create(params)
      
      if response && response.key?(:uuid)        
        response.merge!({ :callback => (url_for :controller => 'datasets', :show => 'action', :anchor => 'mine', :id => response[:uuid]) })
        response.delete(:uuid)
      end
    rescue Exception => e
      response.merge!({:upload_exception => e})
    end

    respond_with(response, :location => nil)
  end
  
  def sanitize_filename(filename)
    filename.strip.tap do |name|
      # NOTE: File.basename doesn't work right with Windows paths on Unix
      # get only the filename, not the whole path
      name.sub! /\A.*(\\|\/)/, ''
      # Finally, replace all non alphanumeric, underscore
      # or periods with underscore
      name.gsub! /[^\w\.\-]/, '_'
    end
  end

  
end
