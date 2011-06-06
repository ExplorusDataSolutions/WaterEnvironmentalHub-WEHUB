class DatasetsController < ApplicationController

  def create
    @breadcrumb     = ['WE Community','Datasets']
    @main_menu      = 'we_community'
  end  

  def show
    @breadcrumb     = ['WE Community','Datasets']
    @main_menu      = 'we_community'

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
