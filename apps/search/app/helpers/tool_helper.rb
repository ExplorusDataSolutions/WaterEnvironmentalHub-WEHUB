module ToolHelper

  def add_param_ids_array(params)
    if params[:id]
      params[:ids] = params[:id]
      params.delete(:id)
    end
    params
  end

  def tool_compatibilities(uuid)
    response = []
    
    begin
      feature_csv = catalogue_instance.api_feature_raw({:id => uuid, :output => 'csv', :page => { :start => 0, :size => 1 }})
      response.push('table') if (!feature_csv.nil? && !feature_csv.empty?)
    rescue
    end

    begin    
      dataset = catalogue_instance.dataset(uuid)
      if dataset && dataset.coordinates
        coords = dataset.coordinates.split(',')
        response.push('map') if (coords.length == 2 && coords[0].to_i.abs <= 90 && coords[1].to_i.abs <= 180)
      end
    rescue
    end

    begin    
      feature = catalogue_instance.api_feature({:id => uuid, :format => 'json'})
      response.push('graph') if (!feature.nil? && !feature.features.empty?)
    rescue
    end
    
    response
  end
  
end
