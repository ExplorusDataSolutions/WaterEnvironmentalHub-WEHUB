class SearchResult
  attr_accessor :id, :uuid, :date, :description, :period, :name, :owner, :author, :properties

  def initialize(uuid)
    @id = @uuid = uuid
  end

end
