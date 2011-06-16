class AboutController < ApplicationController
  
  def index
    @breadcrumb = ['About']
    @main_menu = 'we_catalogue'
  end

  def contact_us
    @breadcrumb = ['Contact us']
    @main_menu = 'we_catalogue'
  end

  def terms_of_service
    @breadcrumb = ['Terms of service']
    @main_menu = 'we_catalogue'
  end

  def legal_notice
    @breadcrumb = ['Legal notice']
    @main_menu = 'we_catalogue'
  end

  def privacy
    @breadcrumb = ['Privacy']
    @main_menu = 'we_catalogue'
  end

end
