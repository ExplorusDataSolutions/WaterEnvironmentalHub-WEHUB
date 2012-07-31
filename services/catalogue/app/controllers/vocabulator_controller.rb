class VocabulatorController < ApplicationController
  
  respond_to :json, :xml
  
  include DatabaseHelper
  include VocabulatorHelper
  
  def sample_types
    if request.post?
      begin
        VocabulatorSampleType.create(params[:sample_types])
      rescue ActiveRecord::RecordNotUnique
      end

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorSampleType.find(:all))

    respond_with(:results => @results)
  end
  
  def speciations
    if request.post?
      begin
        VocabulatorSpeciation.create(params[:speciations])
      rescue
      end

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorSpeciation.find(:all))

    respond_with(:results => @results)
  end
  
  def units
    if request.post?
      begin
        VocabulatorUnits.create(params[:units])
      rescue
      end

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorUnits.find(:all))

    respond_with(:results => @results)
  end
  
  def variable_names
    if request.post?
      begin
        VocabulatorVariableName.create(params[:variable_names])
      rescue ActiveRecord::RecordNotUnique
      end

      respond_with({:status => 'success'}, :location => nil) and return
    end

    @results = filter_by_name(VocabulatorVariableName.find(:all))

    respond_with(:results => @results)
  end
  
  def dataset
    @results = vocabulary(params[:id])
    
    @results.each do |item| 
      item.delete('created_at')
      item.delete('updated_at') 
    end
    
    @results.sort! { |x,y| y['count'].to_i <=> x['count'].to_i  }

    respond_with(:results => @results)
  end

  def filter_by_name(terms)
    terms.find_all { |term| term && term.name && term.name.scan(/no result|no sample|unknown|not applicable/i).empty? }
  end  

end
