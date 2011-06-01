class DatasetsController < ApplicationController

  def upload
    @breadcrumb     = ['WE Community','Datasets']
    @main_menu      = 'we_community'
  end  

  def index
    @breadcrumb     = ['WE Community','Datasets']
    @main_menu      = 'we_community'

    @my_datasets = catalogue_instance.find_datasets_by_user(current_user.id)

    friend_ids = []
    friends = socialnetwork_instance.friends(current_user.id)
    friends.each { |friend| friend_ids.push(friend.id) }
    if !friends.empty?
      @friend_datasets = catalogue_instance.find_datasets_by_user(friend_ids.join(','))
    end

    group_ids = []
    groups = socialnetwork_instance.user_groups(current_user.id)
    groups.each { |group| group_ids.push(group.id) }

    @group_datasets = catalogue_instance.find_datasets_by_group(group_ids.join(','))
  end

  def shared
    @breadcrumb     = ['WE Community','Datasets']
    @main_menu      = 'we_community'
  end

end
