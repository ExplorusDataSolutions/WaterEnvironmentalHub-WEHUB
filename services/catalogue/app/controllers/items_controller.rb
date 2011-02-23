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
    
    result = ''
    results = {}
    uuids.each do |uuid|
      result = Dataset.download(uuid)
      results.store(result[:tablename], result[:data].to_json)
    end
    
    filename = "tmp/zip/#{Time.now.to_s.gsub(/ /,'_').gsub(/:/,'').gsub(/-/,'').gsub(/_/,'').gsub(/\+0000/,'').gsup(/0700/,'')}.zip"
    
    Zip::ZipFile.open(filename, Zip::ZipFile::CREATE) do |zip|
      zip.get_output_stream("README") { |f| f.puts "Thanks for visiting WEHub" }
      results.each do |key, value|
        zip.get_output_stream("#{key}.json") { |f| f.puts value}  
      end      
    end    
        
    send_file filename, :type => "application/zip"
    #send_file filename, :type => "application/zip", :x_sendfile => true
  end
  
  def shape
    uuid = "BAS_AB_CVEC_BUILDING_PY_R01_"
    filename = "tmp/zip/fragments/#{uuid}"
    database_user = "catalogue"
    database_table = "catalogue"
    database_pwd = "t3s3raDeV"
    database_name = "catalogue_development"
    
    result = %x[pgsql2shp -f #{filename} -u #{database_user} -P #{database_pwd} -r #{database_name} #{uuid}]
    render :text => result

    if result[/Output shape: Polygon/] != nil
      shapefiles = []
      ['dbf', 'shp', 'shx'].each do |extension|
        shapefiles.push("#{uuid}.#{extension}")
      end
    end
    render :json => shapefiles

  end
end
