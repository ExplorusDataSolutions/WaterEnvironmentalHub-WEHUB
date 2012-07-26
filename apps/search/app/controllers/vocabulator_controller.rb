class VocabulatorController < ApplicationController

  def terms
    @sample_types = catalogue_instance.vocabulator_sample_types
   
    @speciations = catalogue_instance.vocabulator_speciations

    @variable_names = catalogue_instance.vocabulator_variable_names

    render :partial => 'terms', :layout => false
  end

end
