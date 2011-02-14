require 'zip/zip'

class ItemsController < ApplicationController
  
  def show
    render :json => Dataset.find_by_uuid(params[:id]).first
  end
  
  def download
    uuids = []
    if params[:id].match(/,/) != nil
      uuids = params[:id].split(/,/)
    else 
      uuids.push(params[:id])
    end
      
    results = {}
    uuids.each do |uuid|
      results.store(uuid, Dataset.download(uuid).to_json)
    end
    
    filename = "#{Time.now.to_s.gsub(/ /,'_').gsub(/:/,'').gsub(/-/,'').gsub(/_/,'')}.zip"    
    
    Zip::ZipFile.open(filename, Zip::ZipFile::CREATE) do |zip|
      zip.get_output_stream("README") { |f| f.puts "Thanks for visiting WEHub" }
      results.each do |key, value|
        zip.get_output_stream(key) { |f| f.puts value}  
      end      
    end    
    
    send_file filename, :type => "application/zip", :x_sendfile => true
  end
  
end
