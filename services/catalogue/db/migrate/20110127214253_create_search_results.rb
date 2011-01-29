class CreateSearchResults < ActiveRecord::Migration
  def self.up
    create_table :search_results do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :search_results
  end
end
