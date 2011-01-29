class SearchResult
  attr_accessor :description, :title, :resources, :thumbnail, :source, :publication_date
  
  def initialize(description, title, resources, thumbnail, source, publication_date)
    @description = description
    @title = title
    @resources = resources
    @thumbnail = thumbnail
    @source = source
    @publication_date = publication_date
  end
end

class Resources
  attr_accessor :uri, :title, :type
  
  def initialize(uri, title, type)
    @uri = uri
    @title = title
    @type = type
  end
end
