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
    @results = vocabulary_summary(params[:id])
    
    @results.each do |item| 
      item.delete('created_at')
      item.delete('updated_at') 
    end
    
    @results.sort! { |x,y| y['count'].to_i <=> x['count'].to_i  }

    respond_with(:results => @results)
  end
  
  def vocabularize
    uuid = params[:id]
    
    dataset = Dataset.find_by_uuid(params[:id])    
    feature_fields = dataset.feature.feature_fields

    if !feature_fields || feature_fields.empty?
      respond_with(:status => false, :message => "Feature feilds do not exist") and return
    end

    units = VocabulatorUnits.find(:all)
    variable_names = VocabulatorVariableName.find(:all)
    sample_types = VocabulatorSampleType.find(:all)

    @results = []
    feature_fields.each_with_index do |field, i|    

      @results = @results | feature_vocabulary(find_unit_terms(to_hash(units), field), i, 'units')
      @results = @results | feature_vocabulary(find_closest_terms(to_hash(variable_names), field), i, 'variable_names')
      @results = @results | feature_vocabulary(find_closest_terms(to_hash(sample_types), field), i, 'sample_types')
    end
    
    if @results.empty?
      respond_with(:status => false, :message => "Vocabulary terms could not be found for feature fields: #{feature_fields.join(',')}") and return
    end
    
    save_feature_vocabulary(@results, uuid) unless @results.empty?

    respond_with(:status => true)
  end
  
  def feature
    @dataset = Dataset.find_by_uuid(params[:id])
    
    @results = vocabulary(@dataset.feature.feature_fields, params[:id])
    
    respond_with(:results => @results)     
  end

  private
  
  def filter_by_name(terms)
    terms.find_all { |term| term && term.name && term.name.scan(/no result|no sample|unknown|not applicable/i).empty? }
  end  
  
  def to_hash(active_record)  
    result = JSON.parse(active_record.to_json(:except => [:created_at, :updated_at]))
    if result.is_a?(Array) && result[0].key?('type')
      result.each do |item|
        item.delete('type')
      end
    end
    result
  end
  
end
