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

ActiveRecord::Schema.define(:version => 20110211172333) do

  create_table "alpine_ed8fb7c0_8e59_4884_a422_a8a3be49982b", :id => false, :force => true do |t|
    t.decimal "id",                                                       :precision => 255, :scale => 0, :null => false
    t.decimal "feature_id",                                               :precision => 255, :scale => 0
    t.time    "Date/Time",                                   :limit => 6
    t.string  "Radiation, Net"
    t.string  "Radiation, SW, In"
    t.string  "Radiation, SW, Out"
    t.string  "Soil Heat Flux"
    t.string  "Temperature, Soil"
    t.string  "Temperature, Air/Snow Interface"
    t.string  "Temperature, Air (upper)"
    t.string  "Temperature, Surface, IR"
    t.string  "Humidity, Relative (upper)"
    t.string  "Pressure, Vapour (upper)"
    t.string  "Pressure, Air"
    t.string  "Wind Speed (lower)"
    t.string  "Wind Speed (upper)"
    t.string  "Wind Direction"
    t.string  "Wind Speed (RMY)"
    t.string  "Wind Direction (RMY)"
    t.string  "Snow Depth"
    t.string  "Rainfall"
    t.string  "Soil Water Content, Volumetric (5cm depth)"
    t.string  "Soil Water Content, Volumetric (15cm depth)"
    t.string  "Temperature, Soil (5cm depth)"
    t.string  "Temperature, Soil (15cm depth)"
  end

# Could not dump table "bas_ab_cvec_building_py_9df5b770_3f73_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_cutline_r01_391af140_3f77_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_historic_site_7c884b80_3f77_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_intermit_water_a493c280_3f77_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_park_r01_c7d1d2f0_3f77_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_pipeline_r01_ed2d9340_3f77_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_power_line_r01_0b749510_3f78_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_railway_r01_2dd8c040_3f78_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_residential_5b171660_3f78_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_road_r01_8c0d9280_3f78_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_runway_py_r01_a6f93450_3f78_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_trail_r01_c8121ad0_3f78_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_waterbody_r01_fd9bb3a0_3f78_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_watercourse_1d7f9c90_3f79_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_well_r01_3958aba0_3f79_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_wetland_r01_57a32fe0_3f79_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ab_cvec_wood_area_r01_739e45e0_3f79_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_ca_cvec_province_bndry_9388be80_3f79_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bas_cvec_wetland_r01_c7f0bab0_3f79_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "bdy_ab_cvec_building_pt_eb080940_3f79_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feature_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "geo_ab_cli_agr_cap_250k_141bef90_3f7a_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "geometry_columns", :id => false, :force => true do |t|
    t.string  "f_table_catalog",   :limit => 256, :null => false
    t.string  "f_table_schema",    :limit => 256, :null => false
    t.string  "f_table_name",      :limit => 256, :null => false
    t.string  "f_geometry_column", :limit => 256, :null => false
    t.integer "coord_dimension",                  :null => false
    t.integer "srid",                             :null => false
    t.string  "type",              :limit => 30,  :null => false
  end

# Could not dump table "hyd_ab_nsf_islands_1m_2003_3377bcc0_3f7a_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "hyd_ab_nsf_lakes_1m_2003_4ff06730_3f7a_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "hyd_ab_nsf_rivers_1m_2003_885cad90_3f7a_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "natural_416ad2bc_04cf_41eb_9c9b_7e440c21673b", :id => false, :force => true do |t|
    t.decimal "id",         :precision => 255, :scale => 0, :null => false
    t.decimal "feature_id", :precision => 255, :scale => 0
  end

# Could not dump table "nrn_ab_7_0_blkpassage_a795fea0_3f7a_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "nrn_ab_7_0_ferryseg_c38de050_3f7a_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "nrn_ab_7_0_junction_edb6e020_3f7a_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "nrn_ab_7_0_roadseg_project_09abdba0_3f7b_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "pamcombined_fe4460ca_6dec_4b65_93fe_9b5d6e31e6e8", :id => false, :force => true do |t|
    t.decimal "id",                                :precision => 255, :scale => 0, :null => false
    t.string  "feature_id"
    t.string  "Field"
    t.string  "Crop"
    t.string  "Calendar Day"
    t.string  "Root Zone (mm)"
    t.string  "Root Zone (%)"
    t.string  "Top Zone (mm)"
    t.string  "Top Zone (%)"
    t.string  "Actual Evapotranspiration (mm)"
    t.string  "Precipitation (mm)"
    t.string  "Relative Humidity (%)"
    t.string  "Biometeorological Time"
    t.string  "Leaf Area"
    t.string  "Potential Evapotranspiration (mm)"
    t.string  "Total Soil Moisture (mm)"
  end

  create_table "spatial_ref_sys", :id => false, :force => true do |t|
    t.integer "srid",                      :null => false
    t.string  "auth_name", :limit => 256
    t.integer "auth_srid"
    t.string  "srtext",    :limit => 2048
    t.string  "proj4text", :limit => 2048
  end

# Could not dump table "trn_ab_nrn_ln_r02_project1_438f0a90_3f7b_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "trn_ab_nrn_ln_r02_project_2682d2b0_3f7b_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "trn_ab_nsf_road_network_5ea9d2b0_3f7b_11e0_9207_0800200c9a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

end
