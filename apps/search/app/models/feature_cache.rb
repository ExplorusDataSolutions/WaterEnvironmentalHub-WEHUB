require 'csv'

class FeatureCache

  include UuidHelper
  
  attr_accessor :format, :cache, :uuid 
  
  def initialize(cache="")
    @cache = cache
  end

  def filename(uuid)
    "#{cache}/#{uuid}.properties.csv"
  end  
  
  def data(format, uuid, properties=nil)
    if properties
      properties = properties.split(',')
    end
    if !is_uuid(uuid)
      raise ArgumentError, "UUID is not valid"
    end

    begin  
      if format == 'csv'
          File.open(filename(uuid), "r").read    
      elsif format == 'json'
        build_geojson_from_csv(filename(uuid), properties)
      else
        return nil
      end
    rescue
      return nil
    end
  end
  
  def build_geojson_from_csv(file, properties)
    features = []
    CSV.open(file, 'r', { :headers => true }).each do |row|
      if !row.header_row?
        properties_to_return = {}
        if properties
          properties.each do |property|
            properties_to_return.merge!({ property => row[property] })
          end
        else
          properties_to_return = row.to_hash
        end
        features.push({ 
                :type => "Feature",
                :properties => properties_to_return
              })
      end
    end  
    { :type => "FeatureCollection", :features => features }.to_json
  end

end
