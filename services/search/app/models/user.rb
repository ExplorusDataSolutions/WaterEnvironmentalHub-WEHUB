class User
  attr_accessor :first_name, :last_name, :display_name, :login, :email, :id

  def initialize(first_name, last_name, login, email, id)
    @first_name, @last_name, @login, @email, @id = first_name, last_name, login, email, id
    @display_name = "#{first_name.capitalize} #{last_name.capitalize}"
  end
  
end
