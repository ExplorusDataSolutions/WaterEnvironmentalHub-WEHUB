module CatalogueHelper

  def find_groups(names)
    names.sort! { |a,b| a.downcase <=> b.downcase }
    groups = []
    names.each_with_index do |name, i|
      if i != 0
        previous_name = names[i-1]
        
        if has_bracket(name)
          if are_bracket_contents_numeric(name)            
            name_to_scan = name
          else
            if has_hyphen_as_delimiter(name) && bracket_is_before_hyphen(name) && !has_hyphen_inside_bracket(name)
              name_to_scan = name[0,name.index(hyphen_delimiter_regex)]
            else
              name_to_scan = name[0,name.index(/\(/)]
            end
          end
        elsif has_number_as_delimiter(name) && !has_hyphen_as_delimiter(name)
          name_to_scan = name[0,name.index(/\d/)]
        elsif has_hyphen_as_delimiter(name)
          name_to_scan = name[0,name.index(hyphen_delimiter_regex)]
        else
            name_to_scan = name
        end
        
        if has_hyphen_in_name(previous_name) 
          if has_hyphen_as_delimiter(previous_name)
            previous_terms = previous_name[0,previous_name.index(hyphen_delimiter_regex)].strip.gsub(' ','|')
          else
            previous_terms = previous_name.match(/[\w'.\- ]*/)[0].strip.gsub(' ','|')
          end
        else
          previous_terms = previous_name.match(/[\w'.\/ ]*/)[0].strip.gsub(' ','|')
        end
        
        common_terms = name_to_scan.scan(/#{escape_for_regex(previous_terms)}/)
#puts " name_to_scan: #{name_to_scan} \n previous_name: #{previous_name} \n previous_terms: #{previous_terms} \n common_terms: #{common_terms}"        
        if common_terms.count > 0
          if name.strip.index(common_terms.join(' ').strip) == 0
            groups.push(common_terms.join(' ').strip)
          end
          groups.push(common_terms[0].strip)
        end
      end
    end

    groups.uniq!
    
    groups
  end

  def clean_groups(groups)
    groups.each_with_index do |name, i|
      result = name.match(/(?<term> of| and| the| for| of the|:)$/i)
      if result
        groups[i] = name.gsub(/#{result[:term]}$/i,'').strip
      end
    end
    
    groups.delete_if { |x| !x.match(/^(\d*)$/).nil? }
    groups.delete_if { |x| x.length <= 2 }
    groups.uniq!
   
    groups
  end

  @count = 0
  
  def group(results, groups, sort=true, recurse=0)
    if sort
      groups.sort! { |a,b| a.downcase <=> b.downcase }
      groups.reverse!
    end
    
    grouped_results = {}
    grouped_results['non_grouped'] = []    

    used_ids = [] 
    groups.each_with_index do |group, i|
      results.each do |r| 
        regexed_group = escape_for_regex(group)
        if r && r.name.strip.scan(/#{regexed_group}/i).count != 0 && r.name.strip.index(/#{regexed_group}/i) == 0 
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
    
    results_to_be_grouped_again = []
    regrouped_groups = []

    if recurse == 0
      grouped_results.each do |key, value|
        if value.is_a?(Array) && value.count == 1
          results_to_be_grouped_again.push(value[0])
          regrouped_groups.push(key)
          grouped_results.delete(key)
        end
      end

      if results_to_be_grouped_again.count > 1
        regrouped_groups.sort! { |a,b| a.downcase <=> b.downcase }
        regrouped_results = group(results_to_be_grouped_again, regrouped_groups, false, recurse + 1)
        regrouped_results.delete_if { |k,v| v.count == 0 }
        grouped_results.merge!(regrouped_results) { |key, old, new| new + old }
      elsif results_to_be_grouped_again.count == 1
        regrouped_groups = groups  - regrouped_groups
        regrouped_results = group(results_to_be_grouped_again, regrouped_groups, true, recurse + 1)
        regrouped_results.delete_if { |k,v| v.count == 0 }
        grouped_results.merge!(regrouped_results) { |key, old, new| new + old }   
      end    
    end

    # add the ungrouped items to their own bucket
    results.each do |r|
      if !used_ids.include?(r.uuid)
        grouped_results['non_grouped'].push(r)
      end
    end
    
    # sort groups
    grouped_results = Hash[grouped_results.sort]
    # sort entries within groups
    grouped_results.each do |key, value|
      if value.is_a?(Array) 
        grouped_results[key] = value.sort! { |a,b| a.name.downcase <=> b.name.downcase }
      end
    end
    
    grouped_results
  end    
  
  def build_groups(results)
    names = []
    results.sort! { |a,b| a.name.downcase <=> b.name.downcase }
    results.each { |b| names.push(b.name) }
    
    groups = find_groups(names)
    groups = clean_groups(groups)
    groups = group(results, groups)
    groups
  end
  
  def has_hyphen_inside_bracket(name)
    bracket_contents = name.scan(/\(.*\)/)
    if !bracket_contents.empty?
      !bracket_contents[0].match(hyphen_delimiter_regex).nil?
    end
  end
  
  def has_number_as_delimiter(name)
    !name.index(/\d/).nil?
  end
  
  def hyphen_delimiter_regex
    / \- |\- | \-/
  end

  def bracket_is_before_hyphen(name)
    name.index(hyphen_delimiter_regex) > name.index(/\(/)
  end
  
  def escape_for_regex(name)
    name.gsub('(','\(').gsub(')','\)').gsub('-','\-')
  end
  
  def has_hyphen_as_delimiter(name)
    !name.match(hyphen_delimiter_regex).nil?
  end
  
  def has_hyphen_in_name(name)
    !name.scan(/\-/).empty?
  end
  
  def has_bracket(name)
    !name.scan(/\(.*\)/).empty?
  end
  
  def are_bracket_contents_numeric(name)
    bracket_contents = name.scan(/\(.*\)/)
    if !bracket_contents.empty?
      is_all_numeric(bracket_contents[0].match(/\((.*)\)/)[1])
    end
  end
  
  def is_all_numeric(name)
    number_contents = name.scan(/\d./)
    if !number_contents.empty?
      number_contents.join(' ') == name
    end
  end
  
  def box_colours(i)
    colours = ['red', 'green', 'blue', 'orange', 'purple', 'turquoise', 'tan', 'navy', 'brown', 'gray', 'coral', 'fuchsia', 'yellow', 'blueviolet', 'aliceblue', 'cadetblue', 'darkgoldenrod', 'darkolivegreen', 'darkred', 'darksalmon', 'darkslateblue', 'firebrick', 'greenyellow', 'hotpink', 'lightblue', 'plum', 'royalblue' ,'skyblue', 'yellowgreen', 'deeppink', 'indigo', 'darkkhaki', 'cornsilk', 'cornflowerblue', 'cadetblue', 'crimson', 'darkgrey', 'deeppink', 'azure', 'bisque', 'black', 'darkorange']
    colours[i]
  end
  
  def more_markup(content, length=125)
    if content.length > length
      "#{content[0..length]}<span class='more'>... <a href='#more'>more</a></span><span class='more-content' style='display: none;'>#{content[length+1..-1]}</span>"
    else
      content
    end
  end
end
