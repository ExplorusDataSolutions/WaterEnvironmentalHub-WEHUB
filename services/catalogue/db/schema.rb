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

ActiveRecord::Schema.define(:version => 20110517160707) do

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

  create_table "owners", :force => true do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "source",     :default => "EngineY"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_dataset_collections", :force => true do |t|
    t.integer  "user_id"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_dataset_collections", ["user_id", "uuid"], :name => "index_user_dataset_collections_on_user_id_and_uuid", :unique => true

  create_table "user_viewed_datasets", :force => true do |t|
    t.integer  "user_id"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_viewed_datasets", ["user_id", "uuid"], :name => "index_user_viewed_datasets_on_user_id_and_uuid", :unique => true

end
