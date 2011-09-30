class AboutController < ApplicationController
  
  def index
    @breadcrumb = ['Learn About Us']
    @main_menu = 'about'
  end

  def contact_us
    @breadcrumb = ['Engage us']
    @main_menu = 'we_catalogue'
  end

  def terms_of_service
    @breadcrumb = ['Terms of service']
    @main_menu = 'we_catalogue'
  end

  def privacy
    @breadcrumb = ['Privacy']
    @main_menu = 'we_catalogue'
  end

  def community
    @breadcrumb = ['Community']
    @main_menu = 'we_catalogue'
  end

  def project
    @breadcrumb = ['Learn About Us', 'The Project']
    @main_menu = 'about'
    render :index
  end
  
  def partners
    @breadcrumb = ['Learn About Us', 'The Partners']
    @main_menu = 'about'  
  end

  def community
    @breadcrumb = ['Learn About Us', 'The Community']
    @main_menu = 'about'  
  end
  
  def news
    @breadcrumb = ['Learn About Us', 'Our Newsroom']
    @main_menu = 'about'  
    render 'media/news'
  end
  
  def events
    @breadcrumb = ['Use Our Resources', 'Events']
    @main_menu = 'resources'
  end

  def calendar
    @breadcrumb = ['Use Our Resources', 'Calendar']
    @main_menu = 'resources'
  end

  def blog
    @breadcrumb = ['Use Our Resources', 'Blog']
    @main_menu = 'resources'
  end

  def links
    @breadcrumb = ['Use Our Resources', 'Links']
    @main_menu = 'resources'
  end

end
