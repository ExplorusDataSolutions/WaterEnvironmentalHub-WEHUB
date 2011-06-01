class UserController < ApplicationController
  respond_to :json, :xml

  def saved
    @datasets = UserDatasetCollection.new
    if request.post?
      begin
        @datasets = UserDatasetCollection.create(:user_id => params[:user_id], :uuid => params[:uuid])
      rescue
        @datasets = nil
      end
    else
      @datasets = UserDatasetCollection.find_all_by_user_id(params[:user_id])
    end
     respond_with(@datasets) 
  end

  def recently_viewed
    @datasets = UserViewedDataset.new 
    if request.post?
      @datasets = UserViewedDataset.find_by_user_id_and_uuid(params[:user_id], params[:uuid])
      if @datasets.nil?
        @datasets = UserViewedDataset.create(:user_id => params[:user_id], :uuid => params[:uuid])
      else
        @datasets.touch
        @datasets.save
      end
    else
      @datasets = UserViewedDataset.find_all_by_user_id_order_by_last_updated_with_limit(params[:user_id])
    end
     respond_with(@datasets) 
  end

  def datasets
    if params[:user_ids]
      @datasets = []
      params[:user_ids].split(',').each do |id| 
        owner = Owner.find_by_user_id(id)
        if owner
          @datasets.concat(Dataset.find(:all, :conditions => ['owner_id = ?', owner.id])) 
        end
      end
    elsif params[:group_ids]
      @datasets = []
      params[:group_ids].split(',').each do |id|
        owner = Owner.find_by_group_id(id) 
        if owner
          @datasets.concat(Dataset.find(:all, :conditions => ['owner_id = ?', owner.id]))
        end
      end
    end

    respond_with(@datasets)
  end
end
