class VocabulatorController < ApplicationController
  
  respond_to :json, :xml
  
  def sample_types
    results = []
    
    if request.post?
      VocabulatorSampleType.destroy_all
      results = VocabulatorSampleType.create(params[:sample_types])
    else
      results = VocabulatorSampleType.find(:all)
    end
    
    respond_with(:sample_types => results)
  end
  
  def speciations
  end
  
  def units
  end
  
  def variable_names
  end
  
end
