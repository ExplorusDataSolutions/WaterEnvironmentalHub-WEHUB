class CreateToolCompatibilities < ActiveRecord::Migration
  def self.up
    create_table :tool_compatibilities do |t|
      t.string :dataset_uuid, :null => false
      t.string :compatibilities, :null => false
      
      t.timestamps
    end
    
    add_index :tool_compatibilities, [:dataset_uuid], :unique => true    
  end

  def self.down
    drop_table :tool_compatibilities
  end
end
