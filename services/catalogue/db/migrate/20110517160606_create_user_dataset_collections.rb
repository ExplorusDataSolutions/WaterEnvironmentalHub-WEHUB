class CreateUserDatasetCollections < ActiveRecord::Migration
  def self.up
    create_table :user_dataset_collections do |t|
      t.integer :user_id
      t.string :uuid

      t.timestamps
    end

    add_index :user_dataset_collections, [:user_id, :uuid], :unique => true
  end

  def self.down
    drop_table :user_dataset_collections
  end
end
