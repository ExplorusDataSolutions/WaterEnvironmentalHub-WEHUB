class CreateFeatureMetaLayers < ActiveRecord::Migration
  def self.up
    create_table :feature_meta_layers do |t|
      t.integer :feature_meta_content_id, :null => false
      t.string :layer_id, :null => false
      t.string :name
      t.text :keywords
      t.text :coordinates
      t.text :bounding_box      
      t.text :feature_period
      
      t.timestamps
    end
    
  end

  def self.down
    drop_table :feature_meta_layers
  end
end
