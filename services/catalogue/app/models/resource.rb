class Resource
  attr_accessor :uri, :title, :type
  
  def initialize(uri, title, type)
    @uri = uri
    @title = title
    @type = type
  end
end
