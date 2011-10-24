class DatasetsController < ApplicationController

  before_filter :verify_logged_in

  caches_action :show, :cache_path => :datasets_key.to_proc, :expires_in => 30.minutes
    
  def create
    @breadcrumb = ['Community', 'Datasets']
    @main_menu = 'we_community'
    expire_fragment datasets_key
  end  

  def datasets_key
    "datasets/user/#{current_user.id}"
  end
  
  def show
    @breadcrumb = ['Community', 'Datasets']
    @main_menu = 'we_community'

    @my_datasets = my_datasets
    @friend_datasets = friend_datasets
    @group_datasets = group_datasets
  end

  private 

  def friend_datasets
    friend_ids = []
    friends = socialnetwork_instance.friends(current_user.id)
    friends.each { |friend| friend_ids.push(friend.id) } unless friends.nil?
    if !friend_ids.empty?
      catalogue_instance.find_datasets_by_user(friend_ids.join(','))
    end
  end

  def group_datasets
    group_ids = []
    groups = socialnetwork_instance.user_groups(current_user.id)
    groups.each { |group| group_ids.push(group.id) } unless groups.nil?
    if !group_ids.empty?
      catalogue_instance.find_datasets_by_group(group_ids.join(','))
    end
  end

  def my_datasets
    catalogue_instance.find_datasets_by_user(current_user.id)
  end

end
