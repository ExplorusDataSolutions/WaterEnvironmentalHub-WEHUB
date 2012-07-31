class CreateVocabulatorUnits < ActiveRecord::Migration
  def self.up
    create_table :vocabulator_units do |t|
      t.string :name
      t.string :type
      t.string :abbreviation

      t.timestamps
    end
    
    add_index :vocabulator_units, [:name], :unique => true    
  end

  def self.down
    drop_table :vocabulator_units
  end
end
