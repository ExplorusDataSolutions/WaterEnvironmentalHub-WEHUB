class User 
  include ActiveModel::Validations
  include ActiveModel::Conversion  
  extend ActiveModel::Naming

  attr_accessor :first_name, :last_name, :display_name, :login, :password, :password_confirmation, :email, :id

  validates_presence_of :first_name, :last_name, :login, :password, :password_confirmation, :email

  def initialize(params)
    if !params.nil? 
      @first_name = params[:first_name]
      @last_name = params[:last_name]
      @login = params[:login]
      @email = params[:email]
      @password = params[:password]
      @password_confirmation = params[:password_confirmation]
      @id = params[:id]
    end
  end

  def display_name
    if !first_name.nil? && !last_name.nil?
      "#{first_name.capitalize} #{last_name.capitalize}"
    elsif !first_name.nil?
      "#{first_name.capitalize}"
    elsif !last_name.nil?
      "#{last_name.capitalize}"
    else
      "#{login.capitalize}"
    end
  end
  
end
