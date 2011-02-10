class CreateFeatureAttributes < ActiveRecord::Migration
  def self.up
    create_table :feature_attributes do |t|
      t.string :name
      t.string :unit
      t.references :feature

      t.timestamps
    end
  end

  def self.down
    drop_table :feature_attributes
  end
end
