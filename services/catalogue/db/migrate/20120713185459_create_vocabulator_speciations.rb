class CreateVocabulatorSpeciations < ActiveRecord::Migration
  def self.up
    create_table :vocabulator_speciations do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    
    add_index :vocabulator_speciations, [:name], :unique => true
  end

  def self.down
    drop_table :vocabulator_speciations
  end
end
