module ReviewHelper

  def augment_users(reviews, users = socialnetwork_instance.users)
    reviews.each_with_index do |r, i|
      user = find_user(users, r.user_id)
      reviews[i].merge!(:user => user) unless user.nil?
    end unless users.nil? || users.empty? || reviews.nil? || reviews.empty?
  end
  
  def find_user(users, id)
    users.each do |u|
      if u.id.to_i == id.to_i
        return u
      end
    end
    
    nil
  end  

end
