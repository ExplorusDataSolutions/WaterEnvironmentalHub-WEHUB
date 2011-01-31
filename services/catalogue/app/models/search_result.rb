class SearchResult
  attr_accessor :description, :title, :resources, :thumbnail, :source, :publication_date, :id
  
  def initialize(description, title, resources, thumbnail, source, publication_date, id)
    @description = description
    @title = title
    @resources = resources
    @thumbnail = thumbnail
    @source = source
    @publication_date = publication_date
    @id = id
  end
end