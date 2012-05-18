module SearchHelper

  def constants
    Hashie::Mash.new({ :text =>
      { 
        :search => "search by keywords",
        :properties => "search by properties"
      }
    })
  end
  
  def param_default(param, default_text)
    (param && !param.nil? && !param.empty?) && param == default_text
  end
  
end
