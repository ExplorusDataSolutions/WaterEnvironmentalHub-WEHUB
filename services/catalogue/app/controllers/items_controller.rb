require 'zip/zip'

class ItemsController < ApplicationController
  
  def show
    render :json => Dataset.find_by_uuid(params[:id]).first
  end
  
  def download
    
=begin    
    filename = "#{Time.now.to_s.gsub(/ /,'_').gsub(/:/,'').gsub(/-/,'').gsub(/_/,'')}.zip"    
    
    Zip::ZipFile.open(filename, Zip::ZipFile::CREATE) do |zip|
      zip.get_output_stream("README") { |f| f.puts "Thanks for visiting WEHub" }
      
    end
    
    send_file filename, :type => "application/zip", :x_sendfile => true
=end
    
    render :json => Dataset.download(params[:id])
  end
  
end
