class CreateFeatureVocabulary < ActiveRecord::Migration
  def self.up
    create_table :feature_vocabulary do |t|
      t.string :dataset_uuid, :null => false
      t.integer :feature_field_position, :null => false
      t.integer :term_id, :null => false
      t.string :term_source, :null => false
      
      t.timestamps
    end
    
    add_index :feature_vocabulary, [:dataset_uuid, :feature_field_position, :term_source], :unique => true, :name => 'feature_vocabulary_unique_index'

  end

  def self.down
    drop_table :feature_vocabulary
  end
end
