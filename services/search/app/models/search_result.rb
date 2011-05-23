class SearchResult
  attr_accessor :description, :title, :publication_date, :id, :relations, :author, :start_date, :end_date, :features, :observed_properties
  
  def initialize(description, title, publication_date, id)
    @author = @start_date = @end_date = @observed_properties = ''
    @features = []
    if description == nil
      @description = ''
    elsif description.length < 255
      @description = description
    else
      @description = description[0, 255] + '...'
    end
    
    @title = title
    @publication_date = publication_date
    @id = id
  end
  
  def as_json(options={})
    json = { 
      :id => self.id, :title => self.title, :description => self.description, :publication_date => self.publication_date.to_s
    }
  end
    
end
