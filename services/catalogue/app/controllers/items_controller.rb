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
    
    shape_factory = ShapeFactory.new
    
    uuids.each do |uuid|      
      case 
=begin        
        when format_type == 'json'
          result = Feature.data(uuid)
          results.store("#{result[:tablename]}.json", result[:data].to_json)
        when format_type == 'csv'          
=end          
        when format_type == 'shape'
          begin
            dataset = Dataset.find_by_uuid(uuid).first
            shape_files = shape_factory.find(dataset.feature)
                  
            shape_files.each do |filename|
              file_data = IO.read("#{shape_factory.shape_directory}/#{filename}")
              results.store(filename, file_data)
            end
          rescue            
          end
      end
    end
    
    filename = "tmp/zips/#{Time.now.to_s.gsub(/ /,'_').gsub(/:/,'').gsub(/-/,'').gsub(/_/,'').gsub(/\+0000/,'').gsub(/0700/,'')}.zip"
    
    if results.count != 0
      Zip::ZipFile.open(filename, Zip::ZipFile::CREATE) do |zip|
        zip.get_output_stream("README") { |f| f.puts "Thanks for visiting WEHub" }
        results.each do |key, value|
          zip.get_output_stream("#{key}") { |f| f.puts value}  
        end      
      end
    end
    
    send_file filename, :type => "application/zip"
  end

end
