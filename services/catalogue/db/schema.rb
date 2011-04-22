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

ActiveRecord::Schema.define(:version => 20110422182729) do

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
    t.text     "methodology"
    t.integer  "feature_type_id"
    t.integer  "feature_source_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "datasets", ["uuid"], :name => "index_datasets_on_uuid", :unique => true

  create_table "feature_data_416ad2bc_04cf_41eb_9c9b_7e440c21673b", :id => false, :force => true do |t|
    t.decimal "id",         :precision => 255, :scale => 0, :null => false
    t.decimal "feature_id", :precision => 255, :scale => 0
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
