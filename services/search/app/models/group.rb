class Group
  
  attr_accessor :id, :name, :private, :description

  def initialize(id='', name='', private=false, description='')
    @id, @name, @private, @description = id, name, private, description
  end 
end
