xml.instruct!

xml.info(:version => 1) do
  xml.general do
    # uuid required to retain uuid in GeoNetwork
    xml.uuid(@dataset.uuid)
    # siteId req'd when uuid present, this is an arbitrary meaningless uuid    
    xml.siteId('ee3d3049-5d83-4750-98d4-f60911922b94')
    
    xml.createDate(@dataset.created_at)
    xml.createDate(@dataset.updated_at)
    xml.schema('iso19115')
    xml.isTemplate('false')
    xml.format('full')
  end
  xml.categories do
    xml.category(:name => 'datasets')
  end
  xml.privileges do
    xml.group(:name => 'all') do
      xml.operation(:name => 'view')
    end
    xml.group(:name => @dataset.feature_type.name) do
      xml.operation(:name => 'view')
    end
  end
end