class UserReview < ActiveRecord::Base
  def self.find_all_by_uuid_order_by_date_with_limit(uuid)
    find :all, :order => 'updated_at DESC', :limit => 100, :conditions => [ 'uuid = ?', uuid ]
  end

  def self.find_all_by_uuid_order_by_rating(uuid)
    find :all, :order => 'rating', :conditions => [ 'uuid = ?', uuid ]
  end
  
  def find_ratings_by_uuid(uuid)
    sql = ActiveRecord::Base.send(:sanitize_sql_array, (['SELECT rating AS index, COUNT(*) AS ratings FROM user_reviews WHERE uuid = ? GROUP BY rating ORDER BY rating;', uuid]))
    ActiveRecord::Base.connection.execute(sql)
  end
  
  def summary
    ratings = find_ratings_by_uuid(self.uuid)
    
    average = 0;
    ratings.each do |r|
      average = average + (r['index'].to_f / 5 * r['ratings'].to_i)
    end
    
    { :average_rating => average, :ratings => ratings }
  end
    
end
