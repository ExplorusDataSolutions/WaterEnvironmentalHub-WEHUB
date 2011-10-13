class CatalogueController < ApplicationController

  def index
    @main_menu = 'home'
    
    @search = search_instance.do_query('all', nil, nil, nil)
  end

  def participate
    @breadcrumb = ['Discover Our Data', 'How To Participate']
    @main_menu = 'we_catalogue'
    
    render 'about/participate'  
  end
  
  def search
  end

  def details   
    @dataset = catalogue_instance.dataset(params[:id])
    
    @breadcrumb = ['Discover Our Data', 'This Dataset']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def comment    
    @breadcrumb = ['Water Data Catalogue', 'Detail View']
    @main_menu = 'we_catalogue'
    
    @rating = (4*138)/5; 
  end
  
  def browse
    @breadcrumb = ['Discover Our Data', 'Browse']
    @main_menu = 'we_catalogue'
    
    query = 'all'
    if params[:query] != nil
      query = params[:query]
    end

    @search = search_instance.do_query(query, nil, nil)
    results = @search.results
    
    page = params[:page]
    if page
      page = Integer(page)-1
      @search.results = results[(page*page_size)..(page*page_size+page_size-1)]
      @current = page+1
    else
      @search.results = results[0..page_size-1]
      @current = 1
    end
    
    @pages = Integer(results.count / page_size)    
  
    base_data = @search.base_data.dup
    base_data.sort! { |a,b| a.name.downcase <=> b.name.downcase }

    groups = find_groups(base_data)
    groups.delete('GeoBase National Road Network Alberta Road')

    @base_data = group(base_data, groups)
  
    observation_data = @search.observation_data.dup
    observation_data.sort! { |a,b| a.name.downcase <=> b.name.downcase }

    groups = find_groups(observation_data)

    groups.delete('AB')
    groups.delete('Canadian')
        
    @observation_data = group(observation_data, groups)
  end
  
  def page_size
    10
  end
  
  def user_collection
    @breadcrumb = ['My Collection']
    @main_menu = 'we_catalogue'
    
    @results = search_results_from_datasets(catalogue_instance.find_saved(current_user.id))
        
    @pages = 1
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
        
        round_brackets = last_terms.scan(/\(|\)/)
        common_terms = []
        if !round_brackets.empty?
          regex = ''
          scan_terms = last_terms.match(/([\w\d ]*)(\([\w\d:, ]*\))/)
          if scan_terms
            if scan_terms[1] && scan_terms[2]
              bracket_contents = scan_terms[2].match(/\((.*)\)/)[1]
              if bracket_contents.to_i != 0 || !bracket_contents.scan(/shapefile/i).empty?
                if result_name.strip.index(scan_terms[1].strip) == 0
                  groups.push(scan_terms[1].strip)
                end
                if result_name.strip.index("#{scan_terms[1]}#{scan_terms[2]}") == 0
                  groups.push("#{scan_terms[1]}#{scan_terms[2]}")
                end
              else
                if result_name.strip.index("#{scan_terms[1]}#{scan_terms[2]}") == 0
                  groups.push("#{scan_terms[1]}#{scan_terms[2]}")
                end
                if result_name.strip.index(scan_terms[1].strip) == 0
                  groups.push(scan_terms[1].strip)
                end
              end
            end
          end
        else
          common_terms = result_name.scan(/#{last_terms.match(/[\w' ]*/)[0].strip.gsub(' ','|')}/)
        end
        
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
        regexed_group = group.gsub('(','\(').gsub(')','\)').gsub('-','\-')
        if r && r.name.strip.scan(/#{regexed_group}/i).count != 0 && r.name.strip.index(/#{regexed_group}/) == 0 
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
