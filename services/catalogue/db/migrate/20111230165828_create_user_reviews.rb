class CreateUserReviews < ActiveRecord::Migration
  def self.up
    create_table :user_reviews do |t|
      t.integer :user_id, :null => false
      t.string :uuid, :null => false
      t.integer :rating, :default => 0
      t.text :comments
      
      t.timestamps
    end
 
    add_index :user_reviews, [:user_id, :uuid], :unique => true
  end

  def self.down
    drop_table :user_reviews
  end
end
