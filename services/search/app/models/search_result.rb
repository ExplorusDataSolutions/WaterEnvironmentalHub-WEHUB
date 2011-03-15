class SearchResult
  attr_accessor :description, :title, :publication_date, :id
  
  def initialize(description, title, publication_date, id)
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
  
  def to_s
    puts "search_result:\n id: #{id}\n title: #{title}\n description: #{description}\n publication_date: #{publication_date}" 
  end
end