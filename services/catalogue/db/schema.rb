# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110512150716) do

  create_table "authors", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "dataset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dataset_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dataset_groups_datasets", :id => false, :force => true do |t|
    t.integer "dataset_group_id", :null => false
    t.integer "dataset_id",       :null => false
  end

  create_table "datasets", :force => true do |t|
    t.string   "name"
    t.string   "uuid"
    t.text     "description"
    t.text     "source"
    t.text     "feature_period"
    t.integer  "feature_type_id"
    t.integer  "feature_source_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "datasets", ["uuid"], :name => "index_datasets_on_uuid", :unique => true

  create_table "feature_data_0e3af8a8_7cf8_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_0e7f0f4e_7ce8_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_12521826_7cea_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_1a40e914_7ce9_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_284521ba_7cf8_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_35b3d256_7ce9_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_3b2218a6_7cf8_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_416ad2bc_04cf_41eb_9c9b_7e440c21673b", :id => false, :force => true do |t|
    t.decimal "id",         :precision => 255, :scale => 0, :null => false
    t.decimal "feature_id", :precision => 255, :scale => 0
  end

  create_table "feature_data_42ec8602_7ce9_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_4da9a0e2_7ce5_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_658f6526_7ce4_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_6a628d60_7ceb_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_7d6a60a0_72a9_11e0_9c80_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Feature ID"
    t.string "Latitude"
    t.string "Longitude"
    t.string "Calendar Day"
    t.string "Field"
    t.string "Crop"
    t.string "Root Zone (mm)"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)\r\n"
  end

  create_table "feature_data_8047ef8c_72ad_11e0_9c80_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Feature ID"
    t.string "Latitude"
    t.string "Longitude"
    t.string "Calendar Day"
    t.string "Field"
    t.string "Crop"
    t.string "Root Zone (mm)"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)\r\n"
  end

  create_table "feature_data_83fc67c2_7ce7_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_850e0b4a_7ce5_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_92f7151e_7cf7_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_995a04a0_72a9_11e0_9c80_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Feature ID"
    t.string "Latitude"
    t.string "Longitude"
    t.string "Calendar Day"
    t.string "Field"
    t.string "Crop"
    t.string "Root Zone (mm)"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)\r\n"
  end

  create_table "feature_data_a4586356_72a4_11e0_9c80_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Feature ID"
    t.string "Latitude"
    t.string "Longitude"
    t.string "Calendar Day"
    t.string "Field"
    t.string "Crop"
    t.string "Root Zone (mm)"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)\r\n"
  end

  create_table "feature_data_a9b625d6_72a9_11e0_9c80_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Feature ID"
    t.string "Latitude"
    t.string "Longitude"
    t.string "Calendar Day"
    t.string "Field"
    t.string "Crop"
    t.string "Root Zone (mm)"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)\r\n"
  end

  create_table "feature_data_b4e66b66_7cf7_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_b5705922_7ceb_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_b9ad8678_7ce5_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_c4f25d1c_7ce8_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_d92c096a_7ce6_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

  create_table "feature_data_e211310c_7cf7_11e0_92d3_0050ba2647ec", :id => false, :force => true do |t|
    t.string "Primary Key's"
    t.string "Feature ID%s"
    t.string "Field'''"
    t.string "Crop\\*"
    t.string "Calendar Day\\\\//"
    t.string "Root Zone (mm) DROP;"
    t.string "Root Zone (%)"
    t.string "Top Zone (mm)"
    t.string "Top Zone (%)"
    t.string "Actual Evapotranspiration (mm)"
    t.string "Precipitation (mm)"
    t.string "Relative Humidity (%)"
    t.string "Biometeorological Time"
    t.string "Leaf Area"
    t.string "Potential Evapotranspiration (mm)"
    t.string "Total Soil Moisture (mm)"
  end

# Could not dump table "feature_data_ed8fb7c0_8e59_4884_a422_a8a3be49982b" because of following StandardError
#   Unknown type 'geometry' for column 'thepoint_lonlat'

# Could not dump table "feature_data_fe4460ca_6dec_4b65_93fe_9b5d6e31e6e8" because of following StandardError
#   Unknown type 'geometry' for column 'thepoint_lonlat'

  create_table "feature_meta_contents", :force => true do |t|
    t.text     "dataset_uuid"
    t.text     "keywords"
    t.text     "source_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feature_meta_contents", ["dataset_uuid", "source_uri"], :name => "index_feature_meta_contents_on_dataset_uuid_and_source_uri", :unique => true

  create_table "feature_sources", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feature_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "geometry_columns", :id => false, :force => true do |t|
    t.string  "f_table_catalog",   :limit => 256, :null => false
    t.string  "f_table_schema",    :limit => 256, :null => false
    t.string  "f_table_name",      :limit => 256, :null => false
    t.string  "f_geometry_column", :limit => 256, :null => false
    t.integer "coord_dimension",                  :null => false
    t.integer "srid",                             :null => false
    t.string  "type",              :limit => 30,  :null => false
  end

  create_table "owners", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "source",     :default => "EngineY"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spatial_ref_sys", :id => false, :force => true do |t|
    t.integer "srid",                      :null => false
    t.string  "auth_name", :limit => 256
    t.integer "auth_srid"
    t.string  "srtext",    :limit => 2048
    t.string  "proj4text", :limit => 2048
  end

end
