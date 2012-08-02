module VocabulatorHelper

  def vocabulary(dataset_uuid)
    results = []
    
    dataset_terms = execute(["SELECT term_id, term_source FROM feature_vocabulary WHERE dataset_uuid = ?", dataset_uuid])

    all_terms = []    
    if Rails.cache.exist?("vocabulary_all_terms")
      all_terms = Rails.cache.fetch("vocabulary_all_terms")
    else
      all_terms = execute("SELECT term_id, term_source, COUNT(*) FROM feature_vocabulary GROUP BY term_id, term_source ORDER BY COUNT(*) DESC").to_a
      Rails.cache.write("vocabulary_all_terms", all_terms) unless !all_terms
    end

    dataset_terms_with_count = []
    dataset_terms.each do |d_term|
      dataset_terms_with_count.push(all_terms.find { |s_term| (d_term['term_id'] == s_term['term_id'] && d_term['term_source'] == s_term['term_source']) })
    end    
    dataset_terms_with_count.compact!
    
    dataset_terms_with_count.each do |term|
      result = execute("SELECT * FROM vocabulator_#{term['term_source']} WHERE id = #{term['term_id']}")[0]
      result.merge!({'count' => term['count']})

      results.push(result)
    end
    
    results
  end
  
  def vocabulary_keywords(dataset_uuid)
    keywords = []
    
    terms = vocabulary(dataset_uuid)
    terms.each do |term|
      keywords.push(term['name']) if term['name'] && !term['name'].empty?
    end unless terms.empty?
    
    keywords
  end

end
