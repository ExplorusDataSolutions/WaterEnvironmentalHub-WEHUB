class ProjectionController < ApplicationController

  include DatasetHelper
   
  def reproject
    uploaded_file = params[:filename]
    
    filename = sanitize_filename(uploaded_file.original_filename)

    filename_and_path = Rails.root.join('public', 'uploads', filename)
    if !File.exists?(filename_and_path)
      if File.ctime(filename_and_path) < 1.day.ago    
        File.open(filename_and_path, 'wb') do |file|
          file.write(uploaded_file.read)
        end
      end
    end

    reprojection = { 
      :epsg=> params[:projection][:epsg], 
      :filename => filename_and_path,
      :ip_address => request.remote_ip
    }
       
    render :json => catalogue_instance.reproject(reprojection)
  end
  
end
