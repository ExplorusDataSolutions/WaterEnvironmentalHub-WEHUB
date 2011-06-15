#xml.instruct!

xml.Metadata('xmlns:geonet' => 'http://www.fao.org/geonetwork') do
  xml.mdFileID(@dataset.uuid)

  xml.dataIdInfo do
    xml.idCitation do
      xml.resTitle(@dataset.name)
    end
    xml.idAbs(@dataset.name)
    xml.idPurp(@dataset.description)
    if !@keywords.nil?
      @keywords.each do |k|
        xml.descKeys do
          xml.keyword(k.to_s)
        end
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

  message = {:relations => relations}
  
  if !@dataset.owner.nil?    
    message.update({:owner => {:group_id => @dataset.owner.group_id, :owner_id => @dataset.owner.user_id, :source => @dataset.owner.source }})
  end

  if !@dataset.feature_period.nil?
    message.update({:period => @dataset.feature_period})
  end

  if !@dataset.author.nil?
    message.update({:author => {:name => "#{@dataset.author.first_name} #{@dataset.author.last_name}", :email => @dataset.author.email}})
  end

  xml.additionalInfo(message.to_json)
  
end
