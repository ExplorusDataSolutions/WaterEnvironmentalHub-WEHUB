require 'csv_builder_postgresql.rb'

class FeatureFormatFactory
  attr_accessor :feature_type, :feature
  
  def find(feature_type, feature, params)
    @feature = feature
    @feature_type = feature_type
    
    data = feature.data(params)

    case feature_type 
    when 'json'
      data = data.to_json
    when 'xml'
      data = JSON.parse(data.to_json).to_xml
    when 'csv'
      csv_builder = CsvBuilderPostgreSQL.new("#{Rails.root}/tmp/csvs")
      data = csv_builder.data(feature, params)
    else
      raise ArgumentError, "Feature type of #{feature_type} is not implemented"
    end

    { :filename => "#{feature.filename}.#{feature_type}", :data => data }
  end
  
end
