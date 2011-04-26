class User 
  include ActiveModel::Validations
  include ActiveModel::Conversion  
  extend ActiveModel::Naming

  attr_accessor :first_name, :last_name, :display_name, :login, :password, :email, :id

  def initialize(first_name='', last_name='', login='', email='', id='')
    @first_name, @last_name, @login, @email, @id = first_name, last_name, login, email, id
    @display_name = "#{first_name.capitalize} #{last_name.capitalize}"
  end
  
end
