class AddFeatureSourceToDataset < ActiveRecord::Migration
  def self.up
    add_column :datasets, :feature_source_id, :integer
  end

  def self.down
    remove_column :datasets, :feature_source_id
  end
end
