class CreateFeatureMetaLayers < ActiveRecord::Migration
  def self.up
    create_table :feature_meta_layers do |t|
      t.integer :feature_meta_content_id, :null => false
      t.string :layer_id, :null => false
      t.string :name
      t.text :keywords
      t.text :source_uri, :null => false
      t.text :coordinates
      t.text :bounding_box      
      t.text :feature_period
      
      t.timestamps
    end
    
    add_index :feature_meta_layers, [:layer_id, :source_uri], :unique => true
  end

  def self.down
    drop_table :feature_meta_layers
  end
end
