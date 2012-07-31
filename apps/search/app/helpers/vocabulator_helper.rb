module VocabulatorHelper

  def vocabulary_params(params)
    if params.key?(:vocabulary)
      vocabulary_params = []
      params[:vocabulary].each do |term|
        vocabulary_params.push({ :term_source => term[0], :term_id => term[1].values[0].to_s }) unless !term.is_a?(Array)
      end 
    
      params[:vocabulary] = vocabulary_params
    end

    params
  end 

end
