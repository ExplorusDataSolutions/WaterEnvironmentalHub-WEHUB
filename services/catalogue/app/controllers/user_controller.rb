class UserController < ApplicationController
  respond_to :json, :xml

  def saved
    @datasets = UserDatasetCollection.new
    if request.post?
      begin
        if params[:uuids]
          uuids = JSON.parse(params[:uuids])
          uuids.each do |uuid|
            if params[:modifier] == 'remove'
              dataset = UserDatasetCollection.find_by_user_id_and_uuid(params[:user_id], uuid) 
              dataset.destroy
              @datasets = nil
            else
              @datasets = UserDatasetCollection.create(:user_id => params[:user_id], :uuid => uuid)
            end
          end
        end
      rescue
        @datasets = nil
      end
    else
      @datasets = UserDatasetCollection.find_all_by_user_id(params[:user_id])
    end
    if @datasets.nil?
      render :nothing => true
    else 
      respond_with(@datasets)
    end
  end

  def recently_viewed
    @datasets = UserViewedDataset.new 
    if params[:user_id]
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
    end
    respond_with(@datasets) 
  end

  def datasets
    if params[:user_ids]
      @datasets = []
      params[:user_ids].split(',').each do |id| 
        @datasets = datasets_by_ownerships(Owner.find(:all, :conditions => ['user_id = ?', id]))
      end
    elsif params[:group_ids]
      @datasets = []
      params[:group_ids].split(',').each do |id|
        @datasets = datasets_by_ownerships(Owner.find(:all, :conditions => ['group_id = ?', id]))
      end
    end

    respond_with(@datasets)
  end
  
  def reviews
    @reviews = UserReview.find_all_by_user_id(params[:id])
    
    uuids = []
    @reviews.each do |review|
      uuids.push(review.uuid)
    end
    
    respond_with(uuids)    
  end

  def search
    @datasets = []
    keywords = params[:keywords]
    if keywords
      if params[:user_ids]
        params[:user_ids].split(',').each do |id| 
          @datasets |= datasets_by_ownerships(Owner.find(:all, :conditions => ['user_id = ?', id]))
        end
      end
      if params[:group_ids]
        params[:group_ids].split(',').each do |id|
          @datasets |= datasets_by_ownerships(Owner.find(:all, :conditions => ['group_id = ?', id]))
        end
      end

      if keywords.scan(/^all$/i).any?
        @results = @datasets
      else
        @results = []
        @datasets.each do |dataset|
          regexed_keywords = keywords.gsub(',','|').gsub(' ','|')
          if dataset.name.scan(/#{regexed_keywords}/i).any? || dataset.description.scan(/#{regexed_keywords}/i).any?
            @results.push(dataset)
          else
            if !dataset.feature.keywords.nil? && dataset.feature.keywords.join(' ').scan(/#{regexed_keywords}/i).any?
              @results.push(dataset)        
            end
          end
        end
      end
    end

    respond_with(@results)
  end

  private 

  def datasets_by_ownerships(ownerships)
    datasets = []
    if !ownerships.empty?
      ownerships.each do |owner|
        dataset = Dataset.find_by_owner_id(owner.id)
        if !dataset.nil?
            datasets << dataset
        end
      end
    end
    datasets
  end

end
