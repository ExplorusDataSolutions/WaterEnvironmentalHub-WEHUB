class CreateFeatureVocabulary < ActiveRecord::Migration
  def self.up
    create_table :feature_vocabulary do |t|
      t.string :dataset_uuid
      t.integer :term_id
      t.string :term_source
      
      t.timestamps
    end
    
    add_index :feature_vocabulary, [:dataset_uuid, :term_id, :term_source], :unique => true, :name => 'feature_vocabulary_unique_index'

  end

  def self.down
    drop_table :feature_vocabulary
  end
end
