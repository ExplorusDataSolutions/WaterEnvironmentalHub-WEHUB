class UserReview < ActiveRecord::Base
  def self.find_all_by_uuid_order_by_date_with_limit(uuid)
    find :all, :order => 'updated_at DESC', :limit => 100, :conditions => [ 'uuid = ?', uuid ]
  end

  def self.find_all_by_uuid_order_by_rating(uuid)
    find :all, :order => 'rating', :conditions => [ 'uuid = ?', uuid ]
  end
  
  def find_ratings_by_uuid(uuid)
    sql = ActiveRecord::Base.send(:sanitize_sql_array, (['SELECT rating AS index, COUNT(*) AS votes FROM user_reviews WHERE uuid = ? AND rating <> 0 GROUP BY rating ORDER BY rating;', uuid]))
    ActiveRecord::Base.connection.execute(sql)
  end

  def find_average_rating_by_uuid(uuid)
    sql = ActiveRecord::Base.send(:sanitize_sql_array, (['SELECT AVG(rating) AS average FROM user_reviews WHERE uuid = ? AND rating <> 0;', uuid]))
    ActiveRecord::Base.connection.execute(sql)
  end
  
  def summary
    ratings = find_ratings_by_uuid(self.uuid)

    possible = 0
    total = 0
    ratings.each do |r|
      possible = possible + r['votes'].to_i * 5
      total = total + r['votes'].to_i * r['index'].to_i
    end unless ratings.nil?
    
    average = 0
    average = find_average_rating_by_uuid(self.uuid)
    average = average[0]['average'].to_f unless average.nil?
    
    { :average => average, :possible => possible, :total => total, :ratings => ratings }
  end
    
end
