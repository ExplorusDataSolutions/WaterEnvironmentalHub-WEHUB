require 'zip/zip'

class ItemsController < ApplicationController
  
  def show
    render :json => Dataset.find_by_uuid(params[:id]).first, :callback => params[:callback]
  end
  
  def download
    uuids = []
    if params[:id].match(/,/) != nil
      uuids = params[:id].split(/,/)
    else 
      uuids.push(params[:id])
    end
    
    format_type = 'json'
    if params[:format] != nil
      format_type = params[:format].downcase
    end
    
    result = ''
    results = {}
    uuids.each do |uuid|      
      case 
        when format_type == 'json'
          result = Dataset.data(uuid)
          results.store("#{result[:tablename]}.json", result[:data].to_json)
        when format_type == 'csv'          
        when format_type == 'shape'
          factory = ShapeFactory.new
          id = Dataset.find_observation_id(uuid)          
          shape_files = factory.find_by_id(id)
          shape_files.each do |file|
            result = factory.data(file)
            results.store(file, result)
          end
      end
      
    end
    
    filename = "tmp/zips/#{Time.now.to_s.gsub(/ /,'_').gsub(/:/,'').gsub(/-/,'').gsub(/_/,'').gsub(/\+0000/,'').gsub(/0700/,'')}.zip"
    
    Zip::ZipFile.open(filename, Zip::ZipFile::CREATE) do |zip|
      zip.get_output_stream("README") { |f| f.puts "Thanks for visiting WEHub" }
      results.each do |key, value|
        zip.get_output_stream("#{key}") { |f| f.puts value}  
      end      
    end    
        
    send_file filename, :type => "application/zip"
  end

end
