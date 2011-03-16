#xml.instruct!

xml.Metadata('xmlns:geonet' => 'http://www.fao.org/geonetwork') do
  xml.mdFileID(@dataset.uuid)

  xml.dataIdInfo do
    xml.idCitation do
      xml.resTitle(@dataset.name)
    end
    xml.idAbs(@dataset.name)
    xml.idPurp(@dataset.description)
    @keywords.each do |k|
      xml.descKeys do
        xml.keyword(k.to_s)
      end
    end
  end

  xml.refSysInfo do
    xml.MdCoRefSys do
      xml.projection do
        xml.indentCode('geographic')   
      end
      xml.ellipsoid do
        xml.identCode('WGS 1984')
      end
    end
  end

  relations = []  
  @related_datasets.each do |d|
    if d.uuid != @dataset.uuid
      relations.push(d.uuid)
    end
  end
  #Todo: switch between 'user generated' and 'base data' datasets
  message = {:relations => relations}.to_json
  xml.additionalInfo(message)
  
end
