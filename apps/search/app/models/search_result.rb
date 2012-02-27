class SearchResult
  attr_accessor :id, :uuid, :date, :description, :period, :name, :owner, :author, :properties, :keywords, :coordinates, :review_summary

  def initialize(uuid)
    @id = @uuid = uuid
  end
  
  def keywords
    @properties
  end

end
