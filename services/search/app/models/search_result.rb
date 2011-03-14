class SearchResult
  attr_accessor :description, :title, :resources, :thumbnail, :source, :publication_date, :id
  
  def initialize(description, title, resources, thumbnail, source, publication_date, id)
    if description == nil
      @description = ''
    elsif description.length < 255
      @description = description
    else
      @description = description[0, 255] + '...'
    end
    
    @title = title
    @resources = resources
    @thumbnail = thumbnail
    @source = source
    @publication_date = publication_date
    @id = id
  end
end