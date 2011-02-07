class CreateDatasets < ActiveRecord::Migration
  def self.up
    create_table :datasets do |t|
      t.string :name
      t.string :uuid
      t.text :description
      t.text :methodology

      t.timestamps
    end
  end

  def self.down
    drop_table :datasets
  end
end
