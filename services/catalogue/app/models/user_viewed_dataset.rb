class UserViewedDataset < ActiveRecord::Base

  def self.find_all_by_user_id_order_by_last_updated_with_limit(user_id)
    find :all, :order => 'updated_at DESC', :limit => 10, :conditions => [ 'user_id = ?', user_id ]
  end

  def as_json(options={})    
    json = { 
      :dataset => { :uuid => self.uuid, :date => self.updated_at }
    }
  end

end
