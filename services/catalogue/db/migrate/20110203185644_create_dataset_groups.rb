class CreateDatasetGroups < ActiveRecord::Migration
  def self.up
    create_table :dataset_groups do |t|
      t.string :name
      t.references :dataset

      t.timestamps
    end
  end

  def self.down
    drop_table :dataset_groups
  end
end
