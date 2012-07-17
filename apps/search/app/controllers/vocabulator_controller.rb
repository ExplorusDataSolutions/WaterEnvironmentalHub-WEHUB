class VocabulatorController < ApplicationController

  respond_to :xml, :json, :html

  def terms
    @terms = []
    @terms = catalogue_instance.vocabulator_sample_types
   
    @terms = @terms + catalogue_instance.vocabulator_speciations

    @terms = @terms + catalogue_instance.vocabulator_variable_names

    respond_with @terms do |format|
      format.html { render :layout => false }
    end

  end

end
