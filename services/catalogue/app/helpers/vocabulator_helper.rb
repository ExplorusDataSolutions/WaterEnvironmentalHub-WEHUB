module VocabulatorHelper

  def vocabulary(feature_fields, dataset_uuid)
    results = {}
    
    dataset_terms = execute(["SELECT feature_field_position, term_id, term_source FROM feature_vocabulary WHERE dataset_uuid = ?", dataset_uuid])

    dataset_terms.each do |term|
      result = execute("SELECT * FROM vocabulator_#{term['term_source']} WHERE id = #{term['term_id']}")[0]
      if result.key?('abbreviation')
        result['description'] = result['abbreviation']
      end
      
      field_name = feature_fields[term['feature_field_position'].to_i]

      if !results[field_name]
        results[field_name] = {}
      end
      if !results[field_name][term['term_source']]
        results[field_name][term['term_source']] = []
      end

      results[field_name][term['term_source']].push({ 'id' => result['id'], 'name' => result['name'], 'description' => result['description'] })
    end

    results
  end
  
  def related_uuids(term_id)
    results = execute(["SELECT DISTINCT dataset_uuid FROM feature_vocabulary WHERE term_id = ?", term_id]);
    results.collect { |r| r["dataset_uuid"] } unless !results
  end

  def vocabulary_summary(dataset_uuid)
    results = []
    
    dataset_terms = execute(["SELECT term_id, term_source FROM feature_vocabulary WHERE dataset_uuid = ?", dataset_uuid])

    all_terms = []    
    if Rails.cache.exist?("vocabulary_all_terms_group_by")
      all_terms = Rails.cache.fetch("vocabulary_all_terms_group_by")
    else
      all_terms = execute("SELECT term_id, term_source, COUNT(*) FROM feature_vocabulary GROUP BY term_id, term_source ORDER BY COUNT(*) DESC").to_a
      Rails.cache.write("vocabulary_all_terms_group_by", all_terms) unless !all_terms
    end

    dataset_terms_with_count = []
    dataset_terms.each do |d_term|
      dataset_terms_with_count.push(all_terms.find { |s_term| (d_term['term_id'] == s_term['term_id'] && d_term['term_source'] == s_term['term_source']) })
    end    
    dataset_terms_with_count.compact!
    dataset_terms_with_count.uniq!
    
    dataset_terms_with_count.each do |term|
      result = execute("SELECT * FROM vocabulator_#{term['term_source']} WHERE id = #{term['term_id']}")[0]
      if result.key?('abbreviation')
        result['description'] = result['abbreviation']
      end
      result.merge!({'count' => term['count']})

      results.push(result)
    end
    
    results
  end 
  
  def delete_feature_vocabulary(dataset_uuid)
    FeatureVocabulary.where(:dataset_uuid => dataset_uuid).delete_all
  end
  
  def save_feature_vocabulary(feature_vocabulary, dataset_uuid)
    if feature_vocabulary && !feature_vocabulary.empty?
      feature_vocabulary.each do |v| 
        FeatureVocabulary.where("dataset_uuid = ? AND feature_field_position = ? AND term_source = ?", dataset_uuid, v[:feature_field_position].to_i, v[:term_source]).delete_all
        FeatureVocabulary.create(v.merge!({ :dataset_uuid => dataset_uuid}))
      end
    end
    Rails.cache.delete("vocabulary_all_terms_group_by")
  end
  
  def save_vocabulary_unit_and_variable_terms(properties, dataset_uuid)
    units = VocabulatorUnits.find(:all)
    units.map! { |t| { 'id' => t.id, 'name' => t.name, 'description' => t.abbreviation } }

    variable_names = VocabulatorVariableName.find(:all)
    variable_names.map! { |v| { 'id' => v.id, 'name' => v.name, 'description' => v.description } }

    vocabulary = []
    properties.each_with_index do |field, i|
      vocabulary = vocabulary | feature_vocabulary(find_unit_terms(units, field), i, 'units')
      vocabulary = vocabulary | feature_vocabulary(find_closest_terms(variable_names, field), i, 'variable_names')
    end

    save_feature_vocabulary(vocabulary, dataset_uuid)
  end
  
  def vocabulary_keywords(dataset_uuid)
    keywords = []
    
    terms = vocabulary_summary(dataset_uuid)
    terms.each do |term|
      keywords.push(term['name']) if term['name'] && !term['name'].empty?
    end unless terms.empty?
    
    keywords
  end
  
  def find_unit_terms(terms, value)
    value = strip_to_words(value)
    
    results = []
    terms.each do |term|
      found = false
      # description holds the unit symbol
      desc = term['description']      
      if value.match(/^#{desc} | #{desc} | #{desc}$|\(#{desc}\)|_#{desc}|_#{desc}_/)      
        results.push(term)
        found = true
      elsif term['name'].match(/ #{value} /i)
        results.push(term)
        found = true        
      end
      if !found
        desc = desc.scan(/\w/).join()
        desc.strip!
        if desc.length > 1 && value.match(/^#{desc} | #{desc} | #{desc}$|\(#{desc}\)|_#{desc}|_#{desc}_|^#{desc}$/i)
          results.push(term)
        end
      end
    end
    
    if results 
      results.sort! { |x,y| x['description'].length <=> y['description'].length }
    end
    results
  end

  def find_wildcard_terms(terms, value)
    value = strip_to_words(value)
    
    results = []
    terms.each do |term|
      term.values.each do |t|
        if t.is_a?(String) && t.match(/#{value.gsub(/ /,'|')}/i)              
          results.push(term)
          return results
        end
      end
    end
  
    results
  end

  def find_closest_terms(terms, value)
    value = strip_to_words(value)
    
    results = []
    terms.each do |term|
      term.values.each do |t|
        if t.is_a?(String)
          found = false
          pieces = strip_to_words(t).split(' ')
          if pieces.length < 7 && pieces.length > 1
            pieces.permutation.to_a.each do |permutation|
              if value.match(/#{strip_to_words(permutation.join(' '))}/i)
                results.push(term)
                found = true
              end
            end
            if !found
              pieces.combination(pieces.length-1).to_a.each do |combination|
                if combination.length > 1 && value.match(/#{strip_to_words(combination.join(' '))}/i)
                  results.push(term)
                  found = true
                end
              end
            end            
          end
        end
      end
    end
    
    results
  end
  
  def feature_vocabulary(matches, index, source)
    results = []
    if !matches.nil? && !matches.empty?
      item = matches[0]
      results.push({:feature_field_position => index, :term_id => item['id'], :term_source => source})
    end
    results
  end

  def strip_to_words(value)
    value = value.gsub(/[-_,\.\+()]/,' ')
    value = value.gsub(/ +/,' ')
    value = value.gsub(/ \\/,'\\')    
    value = value.strip
    value  
  end
  
end
