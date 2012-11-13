class ProjectionController < ApplicationController

  include DatabaseHelper
  include DatasetHelper  
  
  def reproject
  
    epsg = epsg_params(params)
    
    filename = params[:filename][:path]
    ip_address = params[:ip_address].match(/[\d.]*/)[0].gsub('.','_')
    tablename = "temp_reprojection_table_#{ip_address}"
    directory = '/projects/WEHub/apps/search/public/uploads'

    begin
#      translator = ShapeTranslator.new(filename, tablename, epsg, directory, "#{Rails.root}/tmp/spreadsheets")
      
#      execute(translator.shape_sql)
      
    rescue Exception => e
      debugger
    end
    
    result = execute("SELECT ST_AsGeoJSON(the_geom) AS geometry FROM #{tablename}")[0]

    response = { :data => { :type => 'FeatureCollection', :features => [{ :geometry => JSON.parse(result['geometry']) }] }}
        
    postgis_box = execute("SELECT box2d(st_extent(the_geom)) FROM #{tablename}")[0].select{ |column| column =~ /box2d/ }.first[1].match(/BOX\((.*)\)/)
    if postgis_box
      postgis_box = postgis_box[1]
      response.merge!({
        :bbox => { 
          :north => postgis_box.split(',')[1].split(' ')[1], 
          :east => postgis_box.split(',')[1].split(' ')[0],
          :south => postgis_box.split(' ')[1].split(',')[0],
          :west => postgis_box.split(' ')[0]
        }
      })
    end

    render :json => response
  end
  
end
