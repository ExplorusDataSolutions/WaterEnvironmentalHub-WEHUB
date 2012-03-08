module GisHelper
  
  def latitude_longitude_from_bbox(bounding_box)
    latitude = '0'
    longitude = '0'

    if bounding_box
      if bounding_box.is_a? Hash
        bounding_box =  "#{bounding_box[:west]} #{bounding_box[:south]}, #{bounding_box[:east]} #{bounding_box[:north]}"
      end
      centroid = "centroid('MULTIPOINT(#{bounding_box})')"
      
      result = execute("SELECT x(#{centroid}), y(#{centroid})")[0]
      if result
        latitude = result.select{ |column| column =~ /^y$/i }.first[1]
        longitude = result.select{ |column| column =~ /^x$/i }.first[1]
      end
    end
    
    "#{latitude},#{longitude}"
  end  
  
  def coordinates_to_params_from_bounding_box(params)
    if params[:bounding_box]
      params.merge!(:coordinates => latitude_longitude_from_bbox(params[:bounding_box]))
    end
    params
  end
  
  def bounding_box_from_string(bbox)
    if bbox
      { 
        :north => bbox.split(' ')[1].split(',')[0],
        :east => bbox.split(' ')[0],
        :south => bbox.split(',')[1].split(' ')[1],
        :west => bbox.split(',')[1].split(' ')[0]
      }
    end
  end
  
end
