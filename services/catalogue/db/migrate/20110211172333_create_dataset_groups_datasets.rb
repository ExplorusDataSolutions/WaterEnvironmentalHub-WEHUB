class CreateDatasetGroupsDatasets < ActiveRecord::Migration
  def self.up
    create_table :dataset_groups_datasets, :id => false do |t|
      t.integer :dataset_group_id, :null => false
      t.integer :dataset_id, :null => false
    end
  end

  def self.down
    drop_table :dataset_groups_datasets
  end  
end