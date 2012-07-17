class VocabulatorController < ApplicationController
  
  respond_to :json, :xml
  
  def sample_types
    if request.post?
      VocabulatorSampleType.destroy_all
      
      VocabulatorSampleType.create(params[:sample_types])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = VocabulatorSampleType.find(:all)

    respond_with(@results)
  end
  
  def speciations
    if request.post?
      VocabulatorSpeciation.destroy_all
      
      VocabulatorSpeciation.create(params[:speciations])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = VocabulatorSpeciation.find(:all)

    respond_with(@results)
  end
  
  def units
    if request.post?
      VocabulatorUnits.destroy_all
      
      VocabulatorUnits.create(params[:units])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = VocabulatorUnits.find(:all)

    respond_with(@results)

  end
  
  def variable_names
    if request.post?
      VocabulatorVariableName.destroy_all
      
      VocabulatorVariableName.create(params[:variable_names])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = VocabulatorVariableName.find(:all)

    respond_with(@results)
  end
  
end
