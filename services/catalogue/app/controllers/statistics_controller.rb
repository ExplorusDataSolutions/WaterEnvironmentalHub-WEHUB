class StatisticsController < ApplicationController

  respond_to :json, :xml

  def datasets_by_type
    base_count = ActiveRecord::Base.connection.execute("SELECT COUNT(id) FROM datasets WHERE feature_type_id = 1 OR feature_type_id = 2")
    observation_count = ActiveRecord::Base.connection.execute("SELECT COUNT(id) FROM datasets WHERE feature_type_id = 3 OR feature_type_id = 4")

    respond_with({ :observation => observation_count[0]['count'].to_i, :base => base_count[0]['count'].to_i })
  end
  
  def last_uploaded
    datasets = Dataset.find(:all, :order => 'updated_at DESC', :limit => 2)
    
    results = []
    datasets.each do |dataset| 
      results.push({ :uuid => dataset.uuid, :name => dataset.name, :description => dataset.description })
    end
    
    respond_with(:datasets => results)
  end
  
end
