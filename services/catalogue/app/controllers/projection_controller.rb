class ProjectionController < ApplicationController

  include DatabaseHelper
  include DatasetHelper
  include GisHelper
  
  def reproject 
    errors = []

    epsg = epsg_params(params)[:epsg]
    if !epsg
      errors.push("epsg: The EPSG code can't be blank")
    else
      if !is_valid_epsg?(epsg)
        errors.push("epsg: The EPSG code is invalid")      
      end
    end
    
    filename = params[:filename]
    if !filename
      errors.push("filename: Filename can't be blank")
    else
      filename = File.basename(filename)
    end

    ip_address = params[:ip_address].match(/[\d.]*/)[0].gsub('.','_')
    tablename = "temp_reprojection_table_#{ip_address}"
    
    if false #errors.empty?    
      directory = '/projects/WEHub/apps/search/public/uploads'

      begin
        #run this everytime
        translator = ShapeTranslator.new(filename, tablename, epsg, directory, "#{Rails.root}/tmp/shape_scripts")
        execute(translator.shape_sql)
      rescue Exception => e
        errors.push("ShapeTranslator: Shape file could not be translated")
      end
    end
    
    if errors.empty?    
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
      
      render :json => response and return
    end

    render :json => { :errors => errors } and return
  end
  
end
