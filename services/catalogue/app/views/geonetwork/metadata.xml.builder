#xml.instruct!

xml.Metadata('xmlns:geonet' => 'http://www.fao.org/geonetwork') do
  xml.mdFileID(@dataset.uuid)

  xml.mdDateSt(@dataset.created_at.iso8601.gsub!('Z',''))

  xml.dataIdInfo do
    xml.idCitation do
      xml.resTitle(@dataset.name)
    end
    
    if @dataset.feature.is_data_source_external? && @dataset.feature.properties
      xml.idAbs("#{@dataset.name}. #{@dataset.feature.properties.join(', ')}")
    else
      xml.idAbs(@dataset.name)
    end

    xml.idPurp(@dataset.description)
    if !@keywords.nil?
      @keywords.each do |k|
        xml.descKeys do
          xml.keyword(k.to_s)
        end
      end
    end
    if @bounding_box && !@bounding_box.nil?
      xml.geoBox do
        xml.northBL(@bounding_box[:north])
        xml.eastBL(@bounding_box[:east])
        xml.southBL(@bounding_box[:south])
        xml.westBL(@bounding_box[:west])
      end
    end
    if @temporal_extent
      xml.dataExt do
        xml.tempEle do
          xml.TempExtent do
            xml.exTemp do
              xml.TM_GeometricPrimitive do
                xml.TM_Period do
                  xml.begin(@temporal_extent[:begin])
                  xml.end(@temporal_extent[:end])
                end
              end
            end
          end
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
  
  message = {}

=begin  
  relations = []  
  @related_datasets.each do |d|
    if d.uuid != @dataset.uuid
      relations.push(d.uuid)
    end
  end

  message = {:relations => relations}
=end
  
  if !@dataset.owner.nil?    
    message.update({:owner => {:group_id => @dataset.owner.group_id, :owner_id => @dataset.owner.user_id, :source => @dataset.owner.source }})
  end

  if !@dataset.feature_period.nil?
    message.update({:period => @dataset.feature_period})
  end

  if !@dataset.author.nil?
    message.update({:author => {:name => "#{@dataset.author.first_name} #{@dataset.author.last_name}", :email => @dataset.author.email}})
  end

  if !@dataset.feature.nil? && !@dataset.feature.latitude_longitude.nil?
    message.update({:coordinates => "#{@dataset.feature.latitude_longitude}"})
  end
  
  if @dataset.feature.properties && !@dataset.feature.properties.empty?
    message.update({:properties => @dataset.feature.properties.join(',')})
  end
  
  if !@review_summary.nil?
    message.update({:review_summary => @review_summary})
  end

  xml.additionalInfo(message.to_json)
  
end
