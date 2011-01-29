class SearchResult
  attr_accessor :description, :title, :resources, :thumbnail, :source, :publication_date, :query
  
  def initialize(description, title, resources, thumbnail, source, publication_date)
    @description = description
    @title = title
    @resources = resources
    @thumbnail = thumbnail
    @source = source
    @publication_date = publication_date
  end
end