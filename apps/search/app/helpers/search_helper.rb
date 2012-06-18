module SearchHelper

  def constants
    Hashie::Mash.new({ :text =>
      { 
        :search => "search by keywords",
        :properties => "search by properties",
        :date_start => "search from date",
        :date_end => "search to date"
      }
    })
  end
  
  def param_default(param, default_text)
    param == default_text
  end
  
  def param_provided(param)
    !(param.nil? || param.empty?)
  end
  
  def build_query(params)
    query = {}
    if param_provided(params[:query]) && !param_default(params[:query], constants.text.search)
      query.store(:keywords, params[:query])
    end
    if param_provided(params[:properties]) && !param_default(params[:properties], constants.text.properties)
      query.store(:properties, params[:properties])
    end
    query    
  end
  
end
