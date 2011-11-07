class CreateCreativeCommonsLicenses < ActiveRecord::Migration
  def self.up
    create_table :creative_commons_licenses do |t|
      t.string :name
      t.string :uri
      
      t.timestamps
    end
  end

  def self.down
    drop_table :creative_commons_licenses
  end
end
