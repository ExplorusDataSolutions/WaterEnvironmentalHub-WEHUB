class CreateVocabulatorSampleTypes < ActiveRecord::Migration
  def self.up
    create_table :vocabulator_sample_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    add_index :vocabulator_sample_types, [:name], :unique => true    
  end

  def self.down
    drop_table :vocabulator_sample_types
  end
end
