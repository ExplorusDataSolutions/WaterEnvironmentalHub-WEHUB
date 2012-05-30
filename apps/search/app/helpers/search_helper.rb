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
  
end
