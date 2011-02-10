class CreateFeatures < ActiveRecord::Migration
  def self.up
    create_table :features do |t|
      t.string :name
      t.text :description
      t.references :dataset
      t.references :feature_types

      t.timestamps
    end
  end

  def self.down
    drop_table :features
  end
end
