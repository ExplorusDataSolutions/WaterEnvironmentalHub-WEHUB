class StatisticsController < ApplicationController

  respond_to :json, :xml

  def datasets_by_type
    base_count = ActiveRecord::Base.connection.execute("SELECT COUNT(id) FROM datasets WHERE feature_type_id = 1 OR feature_type_id = 2")
    all_count = ActiveRecord::Base.connection.execute("SELECT COUNT(id) FROM datasets")
    
    respond_with({ :observation => (count_as_i(all_count) - count_as_i(base_count)), :base => count_as_i(base_count) })
  end
  
  def last_uploaded
    datasets = Dataset.find(:all, :order => 'updated_at DESC', :limit => 2)
    
    results = []
    datasets.each do |dataset| 
      results.push({ :uuid => dataset.uuid, :name => dataset.name, :description => dataset.description })
    end
    
    respond_with(:datasets => results)
  end
  
  private
  
  def count_as_i(query)
    query[0]['count'].to_i
  end
  
end
