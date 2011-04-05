class CreateFeatureMetaContents < ActiveRecord::Migration
  def self.up
    create_table :feature_meta_contents do |t|
      t.string :name
      t.text :description
      t.text :keywords

      t.timestamps
    end
  end

  def self.down
    drop_table :feature_meta_contents
  end
end
