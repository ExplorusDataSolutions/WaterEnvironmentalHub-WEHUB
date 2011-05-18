class CreateUserViewedDatasets < ActiveRecord::Migration
  def self.up
    create_table :user_viewed_datasets do |t|
      t.integer :user_id
      t.string :uuid

      t.timestamps
    end

    add_index :user_viewed_datasets, [:user_id, :uuid], :unique => true
  end

  def self.down
    drop_table :user_viewed_datasets
  end
end
