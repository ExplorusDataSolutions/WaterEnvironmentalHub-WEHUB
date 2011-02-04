class CreateItemGroups < ActiveRecord::Migration
  def self.up
    create_table :item_groups do |t|
      t.string :name
      t.references :item

      t.timestamps
    end
  end

  def self.down
    drop_table :item_groups
  end
end
