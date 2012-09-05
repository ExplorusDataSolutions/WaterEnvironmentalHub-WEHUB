class FeatureController < ApplicationController

  include FeatureHelper 

  respond_to :json, :xml
  
  before_filter :verify_logged_in
    
  def edit  
    dataset = catalogue_instance.dataset(params[:id])
    properties = dataset.properties.split(',')
    properties.map! { |p| p.strip }
    
    @feature_fields_vocabulary = catalogue_instance.vocabulator_feature(params[:id])

    @properties = []
    properties.each_with_index do |property,i|
      number_of_properties = (@feature_fields_vocabulary[property] && @feature_fields_vocabulary[property].keys) ? @feature_fields_vocabulary[property].keys.length : 0
      @properties.insert(number_of_properties, { :field_position => i, :name => property, :vocabulary_matches => number_of_properties })
    end
    @properties.sort! { |x,y| y[:vocabulary_matches] <=> x[:vocabulary_matches] }

    @sample_types = Rails.cache.fetch("vocabulary_sample_types", :expires_in => 15.minutes) do
      catalogue_instance.vocabulator_sample_types.sort! { |x,y| x.name.downcase <=> y.name.downcase }      
    end

    @units = Rails.cache.fetch("vocabulary_units", :expires_in => 15.minutes) do 
      catalogue_instance.vocabulator_units.sort! { |x,y| x.description.downcase <=> y.description.downcase }
    end

    @variable_names = Rails.cache.fetch("vocabulary_variable_names", :expires_in => 15.minutes) do
      catalogue_instance.vocabulator_variable_names.sort! { |x,y| x.name.downcase <=> y.name.downcase }
    end

  end
  
  def update
    catalogue_instance.feature_update(properties_params(params), vocabulary_params(params), current_user.id, params[:id])
    
    if request.xhr?
      render :json => { :callback => (url_for :controller => 'dataset', :action => 'show', :anchor => 'mine', :id => params[:id]) } and return
    else
      redirect_to :controller => 'dataset', :action => 'show', :anchor => 'mine', :id => params[:id] and return
    end
  end
  
end
