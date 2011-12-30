class UserReview < ActiveRecord::Base
  def self.find_all_by_uuid_order_by_date_with_limit(uuid)
    find :all, :order => 'updated_at DESC', :limit => 10, :conditions => [ 'uuid = ?', uuid ]
  end

  def self.find_all_by_uuid_order_by_rating(uuid)
    find :all, :order => 'rating', :conditions => [ 'uuid = ?', uuid ]
  end

  def as_json(options={})    
    json = { 
    }
  end
end
