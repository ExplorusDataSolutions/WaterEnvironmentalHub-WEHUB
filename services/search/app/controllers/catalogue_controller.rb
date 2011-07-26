class CatalogueController < ApplicationController

  def index
    @main_menu = 'home'
  end

  def search
  end

  def details   
    @dataset = catalogue_instance.dataset(params[:id])
    
    @breadcrumb = ['Water Data Catalogue', 'Detail View']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def comment    
    @breadcrumb = ['Water Data Catalogue', 'Detail View']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def browse
    @breadcrumb = ['Water Data Catalogue', 'Browse']
    
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end

    @search = search_instance.do_query(query, nil, nil)
  
    base_data = @search.base_data
    base_data.sort! { |a,b| a.name.downcase <=> b.name.downcase }

    groups = find_groups(base_data)
    groups.delete('GeoBase National Road Network Alberta Road')

    @base_data = group(base_data, groups)
  
    observation_data = @search.observation_data
    observation_data.sort! { |a,b| a.name.downcase <=> b.name.downcase }

    groups = find_groups(observation_data)
    groups.delete('AB')
    groups.delete('Canadian')

    @observation_data = group(observation_data, groups)
  end
  
  def my_collection
    @breadcrumb = ['My Collection']
    @main_menu = 'we_catalogue'
  end

  def find_groups(results)
    groups = []
    results.each_with_index do |result, i|
      if i != 0
        last_terms = results[i-1].name

        digits = last_terms.scan(/ \d+/)
        if !digits.empty?
          last_terms = last_terms[0,last_terms.index(digits[0])]
        end
        result_name = result.name
        common_terms = result_name.scan(/#{last_terms.match(/[\w ]*/)[0].strip.gsub(' ','|')}/)
        if common_terms.count > 0
          if result_name.strip.index(common_terms.join(' ').strip) == 0
            groups.push(common_terms.join(' ').strip)
          end
        end
      end
    end
    
    groups.uniq!
    groups
  end
 
  def group(results, groups)
    grouped_results = {}

    used_ids = []     
    groups.each_with_index do |group, i|
      results.each do |r| 
        if r && r.name.strip.scan(/#{group}/i).count != 0 && r.name.strip.index(/#{group}/i) == 0
          if grouped_results[group].nil?
            grouped_results[group] = []
          end
          if !used_ids.include?(r.uuid)
            grouped_results[group].push(r)
            used_ids.push(r.uuid)
          end
        end
      end
    end

    grouped_results['non_grouped'] = []    
    results.each do |r|
      if !used_ids.include?(r.uuid)
        grouped_results['non_grouped'].push(r)
      end
    end

    grouped_results
  end
  
end
