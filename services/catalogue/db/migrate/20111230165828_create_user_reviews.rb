class CreateUserReviews < ActiveRecord::Migration
  def self.up
    create_table :user_reviews do |t|
      t.integer :user_id
      t.string :uuid
      t.integer :rating, :default => 0
      t.string :comments
      
      t.timestamps
    end
 
    add_index :user_reviews, [:user_id, :uuid], :unique => true
  end

  def self.down
    drop_table :user_reviews
  end
end
