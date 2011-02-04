class CreateObservations < ActiveRecord::Migration
  def self.up
    create_table :observations do |t|
      t.text :json
      t.references :feature

      t.timestamps
    end
  end

  def self.down
    drop_table :observations
  end
end
