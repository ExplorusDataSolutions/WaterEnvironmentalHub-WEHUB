class ProjectionController < ApplicationController

  def reproject
    reprojection = { 
      :epsg=> '4326', 
      :filename => { :path => 'BathymetryHarbours.shp.zip' },
      :ip_address => '127.0.0.1'
    }
    render :json => catalogue_instance.reproject(reprojection)
  end
  
end
