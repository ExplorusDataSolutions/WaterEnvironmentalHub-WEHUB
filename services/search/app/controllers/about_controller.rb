class AboutController < ApplicationController
  
  def index
    @breadcrumb = ['About']
    @main_menu = 'we_catalogue'
  end

  def contact_us
    @breadcrumb = ['About', 'Contact us']
    @main_menu = 'we_catalogue'
  end

end
