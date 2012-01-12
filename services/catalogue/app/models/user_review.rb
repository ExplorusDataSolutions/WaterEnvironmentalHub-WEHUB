class UserReview < ActiveRecord::Base
 
  def find_ratings_by_uuid(uuid)
    sql = ActiveRecord::Base.send(:sanitize_sql_array, (['SELECT rating AS index, COUNT(*) AS votes FROM user_reviews WHERE uuid = ? AND rating <> 0 GROUP BY rating ORDER BY rating;', uuid]))
    ActiveRecord::Base.connection.execute(sql)
  end

  def find_average_rating_by_uuid(uuid)
    sql = ActiveRecord::Base.send(:sanitize_sql_array, (['SELECT AVG(rating) AS average FROM user_reviews WHERE uuid = ? AND rating <> 0;', uuid]))
    ActiveRecord::Base.connection.execute(sql)
  end
  
  def find_count_by(uuid)
    sql = ActiveRecord::Base.send(:sanitize_sql_array, (['SELECT COUNT(id) count FROM user_reviews WHERE uuid = ?', uuid]))
    ActiveRecord::Base.connection.execute(sql)
  end
  
  def summary
    ratings = find_ratings_by_uuid(self.uuid)

    possible = 0
    sum = 0
    ratings.each do |r|
      possible = possible + r['votes'].to_i * 5
      sum = sum + r['votes'].to_i * r['index'].to_i
    end unless ratings.nil?
    
    average = find_average_rating_by_uuid(self.uuid)
    average = average[0]['average'].to_f unless average.nil?
    
    total = find_count_by(self.uuid)
    total = total[0]['count'].to_i unless total.nil?
    
    { :average => average, :possible => possible, :total => total, :sum => sum, :ratings => ratings }
  end
    
end
