class VocabulatorController < ApplicationController
  
  respond_to :json, :xml
  
  def sample_types
    if request.post?
      VocabulatorSampleType.create(params[:sample_types])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorSampleType.find(:all))

    respond_with(:results => @results)
  end
  
  def speciations
    if request.post?
      VocabulatorSpeciation.create(params[:speciations])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorSpeciation.find(:all))

    respond_with(:results => @results)
  end
  
  def units
    if request.post?
      VocabulatorUnits.create(params[:units])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorUnits.find(:all))

    respond_with(:results => @results)
  end
  
  def variable_names
    if request.post?
      VocabulatorVariableName.create(params[:variable_names])

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorVariableName.find(:all))

    respond_with(:results => @results)
  end

  def filter_by_name(terms)
    terms.find_all { |term| term.name.scan(/no result|no sample|unknown|not applicable/i).empty? }
  end  

end
