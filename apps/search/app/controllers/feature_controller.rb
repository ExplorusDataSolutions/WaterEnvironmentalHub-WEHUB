class FeatureController < ApplicationController

  include FeatureHelper 

  respond_to :json, :xml
    
  def edit
    dataset = catalogue_instance.dataset(params[:id])
    @properties = dataset.properties.split(',')
    
    # removing occurances of / otherwise json serialization breaks
    @properties.map! { |p| p.gsub('/','').strip }
    
    @feature_fields_vocabulary = catalogue_instance.vocabulator_feature(params[:id])

    @sample_types = catalogue_instance.vocabulator_sample_types
    @sample_types.sort! { |x,y| x.name.downcase <=> y.name.downcase }
    @speciations = catalogue_instance.vocabulator_speciations
    @speciations.sort! { |x,y| x.name.downcase <=> y.name.downcase }
    @units = catalogue_instance.vocabulator_units
    @units.sort! { |x,y| x.description.downcase <=> y.description.downcase }
    @variable_names = catalogue_instance.vocabulator_variable_names
    @variable_names.sort! { |x,y| x.name.downcase <=> y.name.downcase }
  end
  
  def update
    catalogue_instance.feature_update(properties_params(params), vocabulary_params(params), current_user.id, params[:id])

    redirect_to :controller => 'dataset', :action => 'show', :anchor => 'mine', :id => params[:id]
  end
  
end
