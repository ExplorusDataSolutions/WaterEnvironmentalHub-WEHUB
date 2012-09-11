class FeatureController < ApplicationController

  include FeatureHelper 

  respond_to :json, :xml
  
  before_filter :verify_logged_in
  
  caches_page :sample_types, :units, :variable_names
    
  def edit
    @breadcrumb = ['Community', 'Datasets', 'Edit Feature']
    @main_menu = 'we_community'  
  
    properties = properties(params[:id])
    
    @feature_fields_vocabulary = catalogue_instance.vocabulator_feature(params[:id])

    @properties = []
    properties.each_with_index do |property,i|
      number_of_properties = (@feature_fields_vocabulary[property] && @feature_fields_vocabulary[property].keys) ? @feature_fields_vocabulary[property].keys.length : 0
      @properties.insert(number_of_properties, { :field_position => i, :name => property, :vocabulary_matches => number_of_properties })
    end
    @properties.sort! { |x,y| y[:vocabulary_matches] <=> x[:vocabulary_matches] }
  end
  
  def update
    catalogue_instance.feature_update(params[:properties], vocabulary_params(params), current_user.id, params[:id])
    
    if request.xhr?
      render :json => { :callback => url_for(:controller => 'feature', :action => 'edit', :anchor => 'my-feature', :id => params[:id]) } and return
    else
      redirect_to :controller => 'dataset', :action => 'show', :anchor => 'mine', :id => params[:id] and return
    end
  end
  
  def edit_fields
    @units = Rails.cache.fetch("vocabulary_units") do
      catalogue_instance.vocabulator_units.sort! { |x,y| x.description.downcase <=> y.description.downcase }
    end
    @sample_types = Rails.cache.fetch("vocabulary_sample_types") do
      catalogue_instance.vocabulator_sample_types.sort! { |x,y| x.name.downcase <=> y.name.downcase }      
    end
    @variable_names = Rails.cache.fetch("vocabulary_variable_names") do
      catalogue_instance.vocabulator_variable_names.sort! { |x,y| x.name.downcase <=> y.name.downcase }
    end

    @feature_fields_vocabulary = catalogue_instance.vocabulator_feature(params[:id])
    
    properties = properties(params[:id])
    @property = { :field_position => params[:field_position].to_i, :name => properties[params[:field_position].to_i] }
    
    render :layout => false
  end
  
  def properties(id)
    dataset = catalogue_instance.dataset(id)
    properties = dataset.properties.split(',')
    properties.map! { |p| p.strip }
  end
  
end
