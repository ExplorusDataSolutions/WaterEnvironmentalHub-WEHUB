class MediaController < ApplicationController

  def news
    @breadcrumb = ['News Room', 'News']
  end
  
  def press
    @breadcrumb = ['News Room', 'Press Release']
  end

  def index
    @breadcrumb = ['News Room', 'In the Media']
  end

  def kit
    @breadcrumb = ['News Room', 'Media Kit']
  end

end
