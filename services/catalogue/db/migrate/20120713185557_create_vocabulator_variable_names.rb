class CreateVocabulatorVariableNames < ActiveRecord::Migration
  def self.up
    create_table :vocabulator_variable_names do |t|
      t.text :name
      t.text :description
      
      t.timestamps
    end
    
    add_index :vocabulator_variable_names, [:name], :unique => true
  end

  def self.down
    drop_table :vocabulator_variable_names
  end
end
