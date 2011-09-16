class CreateFeatureMetaContents < ActiveRecord::Migration
  def self.up
    create_table :feature_meta_contents do |t|
      t.text :dataset_uuid
      t.text :keywords
      t.text :source_uri
      t.text :coordinates
      t.text :bounding_box
      
      t.timestamps
    end
    
    add_index :feature_meta_contents, [:dataset_uuid, :source_uri], :unique => true
  end

  def self.down
    drop_table :feature_meta_contents
  end
end
