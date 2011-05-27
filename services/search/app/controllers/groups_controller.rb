class GroupsController < ApplicationController

  def edit
    if request.post?
      begin
        socialnetwork_instance.group_update(params)
      rescue
      end
    end

    @breadcrumb     = ['Groups','Edit']
    @main_menu      = 'we_community'

    @group = socialnetwork_instance.group(params[:id])
    @members = socialnetwork_instance.group_members(params[:id])
    if !@members.nil? && !@members.empty?
      @members_auth = @members.select { |k,v| k[:authorized] == true } 
      @members_no_auth = @members.select { |k,v| k[:authorized] != true }
    end
  end
  
  # This should be in its own controller
  def members
    if request.post?
      if params.key? :authorize
        socialnetwork_instance.membership_authorize(params)
      elsif params.key? :delete
        socialnetwork_instance.membership_delete(params)
      elsif params.key? :promote
        socialnetwork_instance.membership_promote(params)
      end
      redirect_to :action => 'edit', :id => params[:group][:id]
    end
  end
  
  def mine
    if request.post?
      group = socialnetwork_instance.group_create(params)
      socialnetwork_instance.membership_create({ :user_id => current_user.id, :group_id => group.id })
    end

    @breadcrumb     = ['WE Community','Groups']
    @main_menu      = 'we_community'
    @groups = socialnetwork_instance.user_groups(current_user.id)
  end

end
