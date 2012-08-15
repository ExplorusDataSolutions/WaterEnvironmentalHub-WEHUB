class FeatureController < ApplicationController

  include FeatureHelper 

  respond_to :json, :xml
    
  def edit
    dataset = catalogue_instance.dataset(params[:id])
    @properties = dataset.properties.split(',')
    
    # removing occurances of / otherwise json serialization breaks
    @properties.map! { |p| p.gsub('/','').strip }
    
    @feature_fields_vocabulary = catalogue_instance.vocabulator_feature(params[:id])

    @sample_types = Rails.cache.fetch("vocabulary_sample_types") do
      catalogue_instance.vocabulator_sample_types.sort! { |x,y| x.name.downcase <=> y.name.downcase }      
    end

    @speciations = Rails.cache.fetch("vocabulary_speciations") do
      catalogue_instance.vocabulator_speciations.sort! { |x,y| x.name.downcase <=> y.name.downcase }
    end

    @units = Rails.cache.fetch("vocabulary_units") do 
      catalogue_instance.vocabulator_units.sort! { |x,y| x.description.downcase <=> y.description.downcase }
    end

    @variable_names = Rails.cache.fetch("vocabulary_variable_names") do
      catalogue_instance.vocabulator_variable_names.sort! { |x,y| x.name.downcase <=> y.name.downcase }
    end
    
  end
  
  def update
    catalogue_instance.feature_update(properties_params(params), vocabulary_params(params), current_user.id, params[:id])

    redirect_to :controller => 'dataset', :action => 'show', :anchor => 'mine', :id => params[:id]
  end
  
end
