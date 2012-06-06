module DatasetHelper

  def is_owner(dataset, params)
    dataset.owner.user_id == params[:user_id]
  end
  
  def build_author(params)

    first = ''
    last = ''
    email = params[:email]
    if params.key?('name')
      name = params[:name]
      if name.strip.scan(' ').count > 0
        names = name.split(' ')
        (0..names.count-2).each do |i|
          first << "#{names[i]} "
        end
        first.chop!
        last = names[names.count-1]
      else
        last = name
      end
    end

    return {:first_name => first.strip, :last_name => last.strip, :email => email.strip}
  end
  
  def create_author(params)
    Author.create(build_author(params))
  end

  def create_owner(owner)
    owner.delete_if {|key, value| key == "group_id" && (value == "0" || value == "" || value == "Loading...") }
    Owner.create(owner)
  end
  
  def dataset_params(params)
    dataset_params = params[:dataset]

    dataset_params[:feature_period] = feature_period(dataset_params)

    dataset_params[:feature_type] =  FeatureType.find_by_name(dataset_params[:feature_type])
    dataset_params[:feature_source] = FeatureSource.find_by_name('catalogue')
    dataset_params[:author] = create_author(dataset_params[:author])
    dataset_params[:creative_commons_license] = creative_commons_license(dataset_params[:creative_commons_license])
    dataset_params[:description] = sanitize_markup(dataset_params[:description])
    
    permissions = dataset_params[:permissions]
    if permissions      
      dataset_params[:owner] = create_owner(permissions[:owner])
      dataset_params.delete(:permissions)
    end
    
    dataset_params
  end

  def creative_commons_license(params)
    (params.nil? || params.empty? || params == 'none') ? nil : CreativeCommonsLicense.find_by_name(params)
  end
  
  def feature_period(params)
    result = ''
    if params.key?('feature_period')
      result = params[:feature_period]
    else
      result = "#{params[:feature_period_start]} - #{params[:feature_period_end]}"
    end

    params.delete_if {|key, value| key == 'feature_period_start' || key == 'feature_period_end' }
    
    result    
  end
  
  
  def sanitize_markup(dirty)
    acceptable_tags = ['p','em','strong']
    acceptable_tags.each do |tag|
      2.times do |index|
        if index == 0
          dirty.gsub!("<#{tag}>", "_#{tag}_")
        else
          dirty.gsub!("</#{tag}>", "_/#{tag}_")                  
        end
      end
    end
    dirty.gsub!("<br>", "_br_")
    dirty.gsub!("<br />", "_br_")
    
    cleaned = Nokogiri::HTML(dirty).search('text()').to_s
    acceptable_tags.each do |tag|
      2.times do |index|
        if index == 0
          cleaned.gsub!("_#{tag}_", "<#{tag}>")
        else
          cleaned.gsub!("_/#{tag}_", "</#{tag}>")
        end
      end
    end
    
    cleaned.gsub!("_br_", "<br/>")

    cleaned
  end

end
