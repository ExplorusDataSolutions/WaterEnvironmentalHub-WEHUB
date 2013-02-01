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

ActiveRecord::Schema.define(:version => 20120929170553) do

  create_table "authors", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "dataset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "creative_commons_licenses", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "uri"
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
    t.string    "name"
    t.string    "uuid"
    t.text      "description"
    t.text      "source"
    t.text      "feature_period"
    t.integer   "feature_type_id"
    t.integer   "feature_source_id"
    t.integer   "owner_id"
    t.timestamp "created_at",                  :limit => 6
    t.timestamp "updated_at",                  :limit => 6
    t.integer   "creative_commons_license_id"
  end

# Could not dump table "feature_data_000b3879_b3ab_4744_a6d9_b5f153122c4b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_00ce3ee3_7d6d_4c7e_af13_56f81a9b5f22" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_00f9605a_1868_401e_b18c_43fc82cfe336" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0114f408_eb20_4ed3_b8e7_e1984aa90262" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_013899c5_75fa_4987_9649_8e4df993e17f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01693f8a_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01a45d5d_b281_458a_b824_1183ab0e466b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01aef894_2f86_4381_b6fd_42b9dba8479d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01b6e2ad_42a0_4d93_9ebf_1faf25627d9a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01bd4464_0d7f_4445_946f_2762676c58c4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01ce0e7c_8424_4d29_840a_4e7cd734d553" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01d914d0_d310_49b8_8844_ed63e7aefb2d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01ee6826_9839_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_01fe9758_983b_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_020f1216_4bd6_4cf1_a2b8_df5d1c14f820" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_02627dfa_1632_4f5b_a2d1_d5b1a71579a7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_02691678_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_026fa547_a911_4b7b_a420_0366511321a6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_02af9843_29c4_4383_879c_4ace3b918a8a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_02e78e4d_d34e_4baf_a59c_4bf34469bfbc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0302324a_b2de_48b3_9e10_5bf36c672608" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0308623e_8a1d_4189_8a5f_84dfbd5ac8ea" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_03193990_96d3_11e0_963f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_03de4cfa_5a34_411c_8ea0_c6e2d2956639" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_03e1afc4_f276_4023_8583_35811e4296da" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_03e3c2a9_1772_4d0d_a180_c023729e2ad9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_04226c8d_aa26_401f_9a74_c638da86d619" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0488f632_16f9_4693_bfac_3c7f9f1c4a76" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_04b4d966_1d7d_4a54_bd2d_c98aa92f7391" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_04d3bbb1_05dd_4c14_aa61_8aff1f575dcf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_04f3cbda_4dff_4423_899c_99d2e820b1d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_04fffb6a_90c5_4af2_ad19_6a6a915bc762" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0536e358_b9eb_47a4_9001_5c2babb13c95" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_053f0d3c_c377_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_055d96fb_87ce_4b79_871e_cab43af8d890" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_056ec56f_55fc_4bd3_92e2_a93cf9501783" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_05860088_86ad_44bf_b266_605b8062c8e3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_05d20764_e2cf_44f2_83d7_c3b59f3ed538" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_05e53b9c_8e2c_11e0_b806_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_05f85e6c_c378_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0602f369_5d02_4f8f_a93e_8edd5a7ec83d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0604efc7_2147_422f_8372_cfdcc2af2685" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_06454c29_ad72_47e5_b5f1_60d69bb3bf9f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_065148de_dd9c_4493_941c_f4df8265ba31" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_06819d10_802e_4fd3_9069_3a0301be3d1c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_06b586c4_832a_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_06cee160_9760_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_073b9cd8_985f_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_073edc10_02e1_46bc_b5a1_c498a4c220f8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_074390b9_8504_4fa1_8758_f05bd1480191" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_07473fe9_dccb_40a1_abf2_ad17d21c8413" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_074acbf4_fb79_4fa7_9860_f896d0034dad" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_075aa996_a8ba_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_078af05e_b23a_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_07b672dc_02d5_4353_9f8d_e75e06fb1e54" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_07ba7e8b_4f80_46d4_ab08_21630a75c742" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_07c37c69_ce40_48b2_9959_6bae795d7ae9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_07df2632_9a38_41c2_8bb5_f84fc596614d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_07fea542_2cbe_4e56_83bc_cf58647454fc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_081535af_1b2c_4097_8b16_5a0261af942e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0837e6a5_0a49_4d76_82d3_105a7ca70a28" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_084b3954_8bbb_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0864dac2_d533_4e81_bed8_aa77f3c651db" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_08b4c7d6_c763_4a1d_8533_61ecd2f8c14b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_08e49aa5_e3da_4702_8719_1dc4ee8c0e2d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_08ed5266_a8cd_417b_a7a6_73139985fe63" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_09228442_9b7c_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_094b3446_f2c5_4fb5_a3e7_6476df31ee35" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_095c08e0_74c8_4a99_9dc8_d93626d0a053" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_095c4c90_a62e_4775_844f_97531297b06c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_09b1b6f8_ac02_11e0_a4de_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_09c6503e_6963_4c15_b352_d2eae76cc056" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_09c91da5_e7f0_43f1_aab1_4412f6ac8aef" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0a2706a6_a34c_11e0_9b8a_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0a4267c1_79b6_47c7_9ac1_f45f5e9c0dab" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0aa12be6_afae_4c27_ba0f_859da680d0f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0aadc446_985e_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0ac2b01c_b218_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0ada96b2_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0adcbaf2_58de_4dd1_892d_3e1db8b947b3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0b04403e_155d_443d_b96b_19c1a72079d5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0b315268_a25d_4fc0_afd7_271cf5ab7acf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_0b70f516_fc08_11e0_bfb5_12313b015271", :id => false, :force => true do |t|
    t.string "Year"
    t.string "Survey Team"
    t.string "Total Number of Brown Trout Redds"
    t.string "Approximate Latitude"
    t.string "Approximate Longitude"
  end

# Could not dump table "feature_data_0b71f8f3_9323_4e92_941d_826f702f2b5a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0b93f280_a336_11e0_ad0c_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0bafcc2d_a7a7_491f_93e1_330db2bceed1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0bda03dc_eed4_4e8c_bc3d_17cdbff2cae3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0bee6fa7_18b0_4f3d_b1fa_87a5be6777ca" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0c18c0cf_f912_4491_a54b_5672180c9b6d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0c2f3ac7_3372_44da_b089_e0ff2a6f4fe0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_0cc76f3a_540a_11e1_87d7_12313d23d00b", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_0cd79de0_984b_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0cdfca9e_98b6_429f_8e45_0941a82c3806" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0d157996_9cce_4d4e_891a_fd16f64075ed" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0d442bae_f37d_405e_8aed_e05e1a61dfca" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0d4fb684_b189_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0d862ac0_95e1_11e0_bd01_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_0df5bd3e_ebaa_11e1_891d_12313d23d00b", :id => false, :force => true do |t|
    t.string "Year"
    t.string "Mercury (annual national amount released to water in kilograms)\r\n"
  end

# Could not dump table "feature_data_0df69cbf_0de1_4c7b_a33a_e813e7ecfb0b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_0e059cd0_f92a_11e1_821e_12313d23d00b", :id => false, :force => true do |t|
    t.string "Year"
    t.string "Jevrejeva"
    t.string "Church & White"
    t.string "Jason-TOPEX\r\n"
  end

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

# Could not dump table "feature_data_0e5b507a_b4ad_11e0_8cbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0e5c1d98_a8b9_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0e5d3e42_c373_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0e6bc333_c1f6_4b28_8040_49e52d02f488" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0e6d76e0_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_0e8b26e9_1328_4e25_aeaf_e6f564894731" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0eb913ae_9860_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0ec63000_2482_4f55_9139_0cf00c6c9f95" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0ed11d2a_b2ee_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0edf7b1b_565a_4580_86a7_cd9e3765da66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0ee34e1d_6a6f_4252_a6fa_11f15254a785" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0ee6857c_b8cb_4734_a1e4_6e7421d1951a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0f543160_f929_11e1_8cd1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0fae7044_8748_4bbf_9c2c_9158e23b5165" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0feb9b3a_9b75_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_0ffee1b0_a33e_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1034554f_3a8b_4158_a31f_719e7ef6864c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_105da239_3584_48a2_bf05_6fa621a63821" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_108d26e4_a554_408b_ad25_968afd6d01b4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_10922ff0_c374_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1137272d_bc84_4c1c_86ff_a9e07fa4e3df" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_113e396b_c579_47d0_aa7c_051507c07318" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1140b3fc_8bbd_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_11959fe4_91e1_42f4_a24b_ce3d0153c38c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_124f8f44_8329_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_12502723_efc6_4f5c_aa98_743390d8d1d9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_125196aa_f32c_489b_bcb4_cf6d899d5f4a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_125cefe8_b495_4ab6_94cf_625af077a960" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_126edf3c_e52d_4c5a_9fdc_ab35c5f3f4a6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1274d148_96d2_11e0_963f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1295068c_b22c_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_12f6d5d0_a686_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_12f73208_c36b_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_12fce9e8_7283_4174_b9f6_504751dc2988" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_13003801_04f5_49f1_9553_8f307341f60a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1349a087_0f48_45c2_81cb_e34961a7edeb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_134d1b73_8027_4603_9c4b_6e96819e9f13" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_13620990_c242_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1395897c_3a88_42a4_a5fa_d2dfef88f135" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_13963021_30b0_45f5_b779_ce6a07b90cb5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_13a62baa_f36a_4458_a809_6b6ab8438554" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_13c9972e_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_13f51dd9_66eb_44ea_9cd9_dc0c3327e3ef" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_142bbf9a_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_149819f1_e107_4c18_a172_fd392b59d16c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_14a762ee_c375_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_14b9dd60_e507_4463_a26f_36d4c793a9b0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_14da700f_b95a_4c27_87cb_3addce33958f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_14e4d8d2_9b56_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_14f5e197_952e_4a3a_8944_51b5e75dcea0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_151123c9_1382_4a0e_8954_ab9e01198b7e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_15a60d56_cd5c_46d5_b83d_615915d5971b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_15be3dec_e30f_45bd_93bd_0b0f78b4d722" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_15c2f2ba_a03e_4b4b_9de2_46d0d25855b2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_15cc487c_b2ec_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_15efdcef_8afa_4c16_a1f3_2057a25240f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_165c477c_f4cc_44e4_a1b2_5d0b3ce12d76" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_167ed3f0_6032_4a34_84db_2efc5668c0ad" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_16b6c4b6_cd53_4690_bcb6_a54683885875" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_16b87956_95ed_11e1_be7d_12313d23d00b", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_16e97ffd_3643_4d7c_992c_f859668a8c75" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1703643c_f507_4fb1_b5bf_4e43f83c5a1d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1731469a_8bbe_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_173a0675_ad3e_4d55_b026_fd6c1a0a0393" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_173b0278_4dc1_4d34_b415_a43c4cbcbfaf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_176e4170_b2ed_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_17780715_f8bc_4e9a_96b7_e35c18e80027" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_178402f0_f8d5_41a4_b791_510ae29d3a11" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_17bf7427_f9ce_4a90_9ebf_f6a2dca1dc45" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_17d53f82_cdc1_4603_82f6_76de4c342cac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_17e4e125_0feb_4626_a6da_d8579d90f373" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_17e74923_1c7c_4150_bbe7_4ba4d08ee261" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_17ef0633_83f5_4246_bbbb_994697991b9b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_17f07472_a8b8_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_181ab57b_e988_4bff_bb9a_f6df8a8854db" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_182c1158_8763_467b_93ff_96affda65a13" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1830fa3e_e522_42e4_b5a0_6b3b569bba0b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1832aca8_a8b7_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1839e3ab_7cf1_4372_8a28_b09c686fb4e6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_185065d9_d30c_4f16_bcd0_9979876f1ed2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1862c298_cab5_4c70_a1e0_8cc8e17ecf61" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_18754cfb_3997_4069_bda3_10213d8bcfb0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_188e95cc_9780_403c_9d2d_c63c183b59d1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_189af006_ae48_4948_9018_1e3c8327f1d4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_18d17005_cb7d_4378_9214_61923d386659" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_18d6613c_095f_4b30_9812_fa8845218f8c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_18fd8d32_6d39_11e1_8702_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_19357a74_afa7_4486_bc72_a12772e756bc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_195688ef_3c4f_4f8d_94e5_050eb7e102b3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_195aade7_9a03_431e_9433_e37fc6f9ef21" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_196d513d_4dae_4dd3_8461_ff9b90df74bc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_197a5054_cf61_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1983f817_6e3d_400b_b92a_eea17d0efdd1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1990a838_9944_11e1_ac5a_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_19dc5244_983a_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_19f6a47f_b7e1_450e_9f30_bd034b5f27bc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_19f72cc1_f154_4002_8229_4592369b74fa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_1ac77d5a_5650_463a_95b6_8cac74d8b738" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1ae7e092_9766_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1b2344d1_b01e_4c26_8b5f_d272af7ed85e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1b3080ec_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1b3b7485_cb37_48a5_9a57_96a859f735ab" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1b575f4a_c249_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1b60e1e3_9060_4ae2_8b05_5c0c94a67511" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1b66857e_6d20_11e1_aedc_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1bb44525_bcaa_4cac_a4ba_12b5f5aa47d2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1bd9d3aa_a912_4690_bb30_3acf190dc929" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1bf50c92_ea62_493d_aaa1_66278c394a91" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c0987ec_b019_47dd_a7f6_631d20a1b9f7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c37ca8c_44fd_418e_bffa_f0dd781d4eb8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c4262dd_ecf8_453a_8ca1_f5689e09f5a3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c4b3c5e_5fa5_4ef6_8b04_3f22f189d965" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c62e0ab_7dac_4394_aed3_44bca1792056" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c77a15c_4246_458d_98a8_20fee1b2bb46" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c7a98e9_0174_4f00_81f1_cb470a3a3b12" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c7fed51_72bf_4c45_ad8d_8e29d4f9d31b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c81c128_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1c880fe3_110b_497e_8fb7_05e62a4d258d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_1c925056_fc08_11e0_bfb5_12313b015271", :id => false, :force => true do |t|
    t.string "Year"
    t.string "Survey Team"
    t.string "Total Number of Brown Trout Redds"
    t.string "Approximate Latitude"
    t.string "Approximate Longitude"
  end

# Could not dump table "feature_data_1c9db2d0_9839_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1ca98f6b_7e8b_4365_8636_bcdc02a146a1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1cb13430_975e_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1cc01823_2b30_4946_a0d5_8d22851b7add" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1cd498ea_0a30_11e1_aeb4_12313d2b729d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1d02817a_fff1_40bf_892a_f8583f1c0f55" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1d1b3c09_de26_4cf4_b50e_3ce35c191ec3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1d2d0aa4_6d89_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1d543368_bdfe_46cf_b043_d94517e8efab" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1d8c7cbd_58fd_4792_a545_916be03c8c3b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1d9f049a_9767_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1d9f7ba1_ad58_43c3_b2db_f10adeb6b8d4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1dcf0b41_b2ba_4315_b39a_ad062091520c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1e153c54_d93d_4c0e_8095_562509309dd0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1e3d4cb5_99da_4065_8577_0f84862ee8ec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1e73fd95_5991_437c_b92a_07f829e378db" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1ed7b013_ebd5_4ff6_a0b3_da29b358555a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1f051aec_96ca_11e0_963f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1f0800f4_8bbc_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1f23eb10_bf57_4286_9ea5_dd45e66f235f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1f4716a5_05dc_4124_96a9_a93ea3dc522a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1f488514_0a82_4b34_b501_2c930bf83821" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_1f5c3a54_c9bd_11e0_8355_12313b015271", :id => false, :force => true do |t|
    t.string "EarthTrends (http://earthtrends.wri.org) Searchable Database Results\r\n"
  end

# Could not dump table "feature_data_1f8eac27_7fa4_4ecc_8f75_b84808f04173" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1f8f4664_4ffc_4f8f_b9ed_4790c56e66a3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1fda1982_4241_4b0a_b9fa_e8d121606fed" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1fe283d6_cbba_4ac3_8b63_bb270708c964" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_1fff17c7_ec87_4994_9404_39dd33454bd6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2055f788_f676_4b78_8baa_e19cc46fe66b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_208ba6dc_810f_45ba_9e18_f6c9be6f9e0c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_20b1f877_18b6_428a_9643_22a19582c706" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_20ccdbbb_91c2_4f98_bc8b_9af68a1b9652" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_20d80f6d_6075_4afd_b520_9887728006eb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_20db9023_a040_4c5e_abd1_c644668685a5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_210cea56_50da_407d_aefe_240cbc7b40a2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2118048c_7f9f_4cc1_8408_8922d045b39e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_211dde17_a5c3_4b02_b811_c9d1ff59fe4a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_21c32593_bb5a_424a_84aa_f7f81017126f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_21c7a750_9863_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_21eaf39d_e557_417d_82f0_74e1a6221b46" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_22233367_4664_499a_86a2_10677019c2e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2269a691_7521_4eaa_92dd_5858d06a6afc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_226d3aa4_25ff_4468_951e_7c58a45f8601" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_226f4641_b944_423b_ac36_33b1f77e0a5e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_229a4803_187b_460a_8c14_6fe03e74700d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_22aafc70_82b5_4415_ab15_a29a6b321a14" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_22f04876_984a_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_22f3f355_13a0_4aa4_8ddc_7f9733c4ff75" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_23355b3c_7a45_43fe_b557_4421ae972cbd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_234eed43_8886_41d0_85db_d1190f06caad" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_235e68f2_76b7_4b77_9736_7e6eb6f7f328" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_23b44e41_9cbb_41f8_bd9c_4871b876b7d6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_241e6c64_6d1f_11e1_bdc4_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2423f024_a689_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_24249591_8239_4292_b722_22f06700a4f3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_243cd3e0_9a28_4f71_bb1e_6c2c006a1d4f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_24419ddc_4eea_446f_ba76_49733d5d6e05" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2449848b_de15_403e_ac24_3314bfd4c776" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_244af01d_69b7_4d31_82b4_1e4f4f2d9a8c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2474fbcd_69cd_4bfb_a981_172be9fd6f09" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_247cf41d_f261_47f2_8887_c6fc75a4594e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_247ed30a_295a_4436_970d_a54dd0359a1a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_24881e54_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_248f9e67_596a_4c0f_b48b_e48720267653" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_24b7a46f_91ad_4204_9fc3_d9772a2c60dc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_24c6ea09_fda2_43d9_b3d0_26471cc11c6e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2520ffa9_f313_4a44_97c5_ff1863d05173" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2535c0d4_cefe_4f32_af45_ca2b66341e61" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2544de5c_a826_4085_b1ac_38c60d38dba5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2556f3ca_2fa0_4dc7_acd9_9d74b6006466" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2560bfac_c2b4_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2560ff22_c1eb_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_25700782_b229_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_259d603e_fb25_477b_b543_30db91f00bf8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_25c36e12_473a_47bb_8cdc_3b7899e0ff9c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_25c4c801_755e_4a47_a0c9_91d387eb1d09" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_25f5fd32_c944_4f9f_ac7b_48bb9d8ed167" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_263e3bda_323f_4fd8_9933_d5f8f4a1a888" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2641bdbf_1c2b_4d25_b2ca_9300b68d15f8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2648bc17_749c_44ae_ba97_cf9145cde2aa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2656add7_8a4c_469a_85ad_2530385d41f4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2657be92_95e1_11e0_bd01_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_265df474_832b_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_26799599_e658_40ba_8274_5803950b2542" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_26dcdf96_a32e_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_26ef7b50_a32f_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_26f81930_3f3f_481c_a74a_b60f1dc9b84e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_271bd542_46e5_4874_9a04_35d128498e0f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2746cec6_ae53_11e0_86f2_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_277671e8_53a4_43dc_952e_7e32e8438940" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_27898d68_f850_11e1_acf1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2795586a_a32d_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_27a264d9_7b3f_4d58_8630_5e64362416a9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_27d1e47b_414d_412c_bdc6_3df8b8cdc3a8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_27d780cc_a33d_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_27ea5990_5e4c_4438_81d2_48238746f9d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_27f52b58_841c_4e4a_8622_b85559de9f3d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2818aff8_c376_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_283b5393_fa3d_4481_a1a3_01b845256a90" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_28b4798d_bbbb_45d3_807e_5e04d0c24e33" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2920c700_c205_44b7_a58c_4c8352e92fd5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_292163c9_284e_4e82_88c8_79750c85359c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2921def0_9861_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_296539b9_07d2_48c3_82c5_f5063488c117" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_296819de_bd18_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_29fc2221_af89_4135_af53_178d154e2cd8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_29fe9824_8423_456d_85f9_aa6eb884fb3f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2a3ed455_bea3_444b_97ca_afdbff57b11f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2a53b350_6d53_4900_8dde_e3cd10980e1a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2b0e0391_0067_4846_9dc1_54459eb2a0fb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2b24cfe2_c30d_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2b4fd067_fb4e_4258_9624_979804f27baa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2b5751a1_9235_4682_8b8e_871ab3d31339" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2b61ddfe_8523_497d_996e_8c012a427cca" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2bb2b773_6bc9_4b49_a596_5f684e157b0d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2bdfb187_faa9_4f4d_96e6_684c29af622e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2bebb1df_511a_4ae7_ae2d_e96f3e4275eb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2c12b6e6_f086_49bb_b004_7fe35e30c810" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2c2a0fb0_f265_47c8_a2a3_a029d42c6ea3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2c35628c_c0a4_4338_be0e_0ef5ceea6f86" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2c7f263a_9761_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2c8859ff_edb8_48fd_b987_a45b2540412a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2c94bef0_87f1_4ed4_b810_fac718475297" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2cad82eb_c69a_4e23_a332_6fc0477067f7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2cc47958_6d38_11e1_b5e4_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2cc73026_6c3b_4daf_98f4_947551dfc182" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2cd9eb34_985f_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2ce907c0_4adc_4efc_85d9_1c5661acd0f3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2cfed602_f05a_11e1_82db_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_2d091de2_fb5f_11e0_bfb5_12313b015271", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_2d254e62_6d7a_11e1_b5e4_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2d54ed09_3243_49e1_b6eb_6f0e470585a7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2d7f34ea_e461_4973_bfe8_20b534d35db1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2d81706c_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2d86b25b_6dc9_44cc_87a3_4364f5d4d42b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2d8bcf53_400f_4599_9395_fc2f3760f0f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2dae43d9_6068_44fc_b798_b56e66893417" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2db879d8_1f0a_4108_be00_6a97729dc06e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2e08d964_6d7c_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2e1fb27a_be25_43e7_9bcf_1a3ab0754458" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2e8a8772_44b0_45d6_b637_860910d83e06" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2ea23237_db55_43a8_96e0_2c042c376a01" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2ea5aad7_80f0_4f1e_9832_b783903dafd9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2ea82e50_2271_46f2_bf6e_9c14a438e270" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2ec975d2_b1ab_43f1_8b55_6c0f735e6cd4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2f4a3010_2e58_423f_a7d9_0d03a0daf6de" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2f4a3828_3780_499c_a5f2_db0693640707" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2f6329b1_fc7b_4450_9049_07af45a17ee3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_2fbf7cd6_ddd4_41a3_87bb_09d5e9fcd4d3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_30191c30_b217_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_304511d2_a682_11e0_aa6e_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3051c273_716b_4881_9492_1fedb030e32f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_30620ac9_98b7_4ffb_853b_02612c236be5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_307f9e18_9243_4aa0_9c67_e0ad436e0252" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_30df8fa6_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_30f4c680_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_31295454_c36b_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3167080e_cf78_46b3_b8ab_cf8dca60edcd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3177e1e6_d364_4618_b7dd_cd236d07945e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3189260b_8968_44f2_b4c1_cc4a459102cc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_319c9500_24a5_478e_b42e_e4a0f237ac9e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_31d6a3bd_2ca5_41be_a547_64bbfaef3e54" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_321a8d4e_9772_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_321cdd9c_6f56_435e_a08f_181a0213d4b7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_32577b56_0614_403c_8de6_b3332f5d8c02" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3274eedb_3197_40ba_99ec_9184fcdfb25c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3276debb_11f0_42d6_97f7_011ef52ba7c5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3288a54e_985e_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_32b9a430_eaec_4e7e_91b5_4a956bb8b208" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_32ba2604_6448_45c2_82e7_84ded3534700" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_32d63c8c_c2bb_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_33221aa4_7692_11e1_96f3_12313d23d00b", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_33252a5e_9c55_11e0_a860_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3374fdda_8379_4e45_8c88_9d95c3b0693c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_338faa9a_06f7_4016_aa40_09f0858ee92f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_33a9898d_fee0_4e43_9b4d_bb973ecdbfd9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_33ac96fd_c293_4011_a2cd_4d6be83a7b88" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_33c28482_d0bc_4a28_9b9d_619831876fbd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_33c9ce17_6b8b_4977_bc9e_5e1c86efd60a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_33d2720e_5037_49fd_ac25_f8b63c2b0bef" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_33df284c_b239_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_34005f58_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3420d9e0_c247_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3426732e_2d17_42a2_a596_45a5380ab591" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3427f752_74f0_442a_8a56_93b2509eb13a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_34566774_1af1_11e1_9e62_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3461fb14_9830_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_34a18d1c_b228_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_34b00045_e23e_404f_8bdf_40ae30efab58" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_34bb03e4_b216_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_34c9c77d_538a_4df9_82a3_43bdc12e5924" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_34f09100_e774_44d9_86f4_1b743ea08c2d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3553b506_7ba4_43db_a173_4cee8f8a8b54" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_35f12f8b_081b_45b0_8bf9_398f5f218d31" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_361863f6_4ad0_4948_8ae7_dbcfda61ad73" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_36aab0f7_137c_4c44_a041_32d1a96a371f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_36cb5234_9b7c_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_36cbdcc1_08b8_4d0c_ad0c_272954a5c6d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_36e7bd04_1b45_4733_874c_7e94e68e7331" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3703b4fe_c36c_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_375a50f8_adb7_40e9_8da4_fbff4d2fed46" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_376a669e_c363_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_379047e2_95a1_4fd0_8dea_f583f900bc45" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_37a2d7b9_0da6_40c6_9ef5_c17c266c660b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_37a6ee94_59a0_4d83_a4a0_8964c981f15a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_37a97a8c_9da5_4430_9893_673e673cecce" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_37b7fcb6_f7f7_4977_b2b3_72533ab1023e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_384c8707_c08e_4986_bf1b_9d10db4a0b92" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38814ef8_58b7_4de9_b678_1d8b40ce843e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38a16f43_26e1_4af8_ab5d_978833faed24" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38d460a3_41dc_4ae0_904b_12d19e9434df" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38e94401_9b7a_4159_9afa_89641283537e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38ec2fe7_a260_44d3_96d9_1be73668909f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38fc57ee_9765_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38fda854_7af7_4840_8dea_025305dd1e85" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_38ff5086_0630_11e1_a9a0_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_39339964_8bbe_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_39c2b3eb_3da9_42c5_89a1_9cb9353bd4a3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_39cb1a20_e875_45cb_845d_8c8d14249ecb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_39e8b7a6_b218_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_39f6e04d_2c34_4b6f_abbc_8157f8387d3a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3a24a7f7_bf93_4a74_b4c6_2c6fb8b23e4c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3a2e0418_9860_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3a3dc9f9_794e_4acb_9679_c56049d71748" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3a83b8b6_a33e_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3a85692e_9838_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3a8cae01_8812_4bb7_a276_f2649472adf9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3ab3bffd_0bec_42e5_b9a4_9982223b83ef" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3ab56817_1aa0_4c0f_bcef_33e79260517f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3ac04e2b_a401_411c_915c_dec418886a04" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3aeb860e_8573_4bda_b3a2_77474ccb353d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3afa67a2_8329_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3afc517f_eeef_4be7_b75f_74dc2079641d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3b09521a_c377_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3b16ab32_9b7b_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_3b22db2b_e86b_4cf1_8ebd_b86c0bd014de" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3b2579f0_df15_4340_b069_8311950bef14" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3b2fa6aa_b24b_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3b61c8bd_d6a2_48eb_9796_fa2b54c54911" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3b9756d2_9762_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3ba1e904_a8b9_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3bca4fb0_6d81_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3bedb55a_832a_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3c134304_d555_49e5_b106_7950215cbbf5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3c18224c_8bbb_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3c79a150_6d80_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3c983704_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3cc48fc7_4ae7_4bcc_bfa7_657891744c08" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3cc66ea8_9b54_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3ce144a6_5811_4c20_8358_533e8f4e26e3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3d10d281_4996_4f89_825f_5d4f77bb5426" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3d21810b_2a4e_4fef_8db0_4b876ee71659" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3d56eed0_726f_4d48_908e_417870a0e3d9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3db9b314_6d87_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3dce8b13_b769_4229_b354_5a5f8288aeda" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3e2fcba4_c30e_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3e5d6804_77a6_4a65_8f50_f3cd566b5a3d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3e98c242_b22b_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_3ec8d8ae_97d4_11e0_b23e_12313d0345e4", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_3ed679f3_db78_4ede_a7f7_938daa170040" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3eea0996_f7e2_4770_8472_65146b73575a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3ef383e4_7d7e_11e0_a516_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3efc5618_6a04_4b7b_a65d_d752abe6f1c3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3f0f9579_81a1_48e3_a635_1a9e7dbdf8b7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3f1ca804_140d_4073_a931_bd7a985fa211" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3fa0f879_f578_4b59_bb18_ec88535d31a0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3fb96cc3_28fa_414d_bcbb_33e49a438e1d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3fe2d740_45c5_44e4_b45b_dc8f3a210ad3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_3feab156_8327_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_402207f2_982e_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4025b06e_4ae0_436b_8841_a293bac6b5a4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_403b0e40_4a7b_47e1_887a_cc30603beccd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4045ebe4_6fc4_4c11_9db1_4c2e683149bc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_404cb8d0_8e54_4514_8989_ddeedcc92435" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_405e6264_a34c_11e0_9b8a_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4060833e_7f5d_4b08_a2d9_28f41217bccf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_409a8b93_df6c_44f0_934f_9b2e6b87162a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_40cb06fb_0735_4885_9595_0956518327e3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_41195128_e9de_464e_9fd8_d0d857137c70" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_416ad2bc_04cf_41eb_9c9b_7e440c21673b", :id => false, :force => true do |t|
    t.decimal "id",         :precision => 255, :scale => 0, :null => false
    t.decimal "feature_id", :precision => 255, :scale => 0
  end

# Could not dump table "feature_data_4179dbf3_bc08_4a21_bfbb_f1b5949aba88" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4187b489_98ce_43d8_897a_ae4661909345" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_41910898_a339_11e0_ad0c_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_41a58fca_b22a_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_41cb5e63_8c0b_4fc0_989f_e6404a58c6bf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_41cdee10_e176_4292_9539_0ae672215616" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_42144b15_9972_4ba5_af9f_072cdede030d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4215ca64_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_42280be2_68e3_4ac7_8e3a_8f56c609227c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_423aad2a_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_425f9d28_c1ea_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_42860c5c_1cb4_4f76_a6e0_ba524f46d762" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4298fc82_f877_436d_a46e_bbac5b76372e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_42cdea4e_a32c_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_42e4e3de_e761_475d_a371_ad8ad2e628be" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_42fdafbe_1aef_11e1_ac3b_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_430cee5f_9c1e_4dc1_80ce_d82ee82ca4ce" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_430ea52b_e187_4c4b_b8fb_db5cd25b0d8b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_43145ce6_30c9_4fcb_bd4e_d88b512455d6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4321e43d_8b71_425e_807d_65d431e31bdb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_43579393_0be3_4914_b488_2143b86a6e0c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4363ff78_b8d0_4d07_b010_2622a53f67de" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_437fb2c0_8e2c_11e0_b806_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_43af941a_6c23_400b_8a18_599e4eb9fed5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_43e0baba_3fe6_4c62_a2d3_73fdaef0552d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_43e9e1d4_cb75_48dd_a5d9_07b7d6910869" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_43f4c61e_477d_4290_8db3_dba2080a7605" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_440a4018_234a_43a8_9bc1_6f395ceaf57f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_443ea570_a3e7_45b5_a4e1_d2a4eaff7c75" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_44dc150a_3813_4b2c_a4e5_f866cae93054" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_44e1f725_4669_41b1_a230_e50360d0460f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_44f1ebe9_cabc_4044_a2af_4c12e4447e7a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_44fabaae_9b75_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4502a72e_145e_4072_86f5_a8ee30aea0aa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_451da71c_ac5f_49ce_8d3f_00e89bf52d0e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_453acf1e_6c9f_48c9_b65f_e034b19ce452" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4542adf8_c372_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45549c0b_7f74_40d3_a9d9_23c0656b0c91" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4556db27_6f31_45f6_9376_771d1c6230ad" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_4564c698_1aef_11e1_9a14_12313d23d00b", :id => false, :force => true do |t|
    t.string "FID"
    t.string "Latitude"
    t.string "Longitude"
    t.string "Date"
    t.string "Time"
    t.string "Temp_Soil_1 (C)"
    t.string "Temp_Soil_2 (C)"
    t.string "Temp_Air (C)"
    t.string "Humidity_Rel (percent)"
    t.string "WindSpd_cup (m/s)"
    t.string "SnowDepth (mm)"
    t.string "Rainfall (mm)"
    t.string "TDR_VSMC_10 ()"
    t.string "TDR_VSMC_20 ()_x000D_\n"
  end

# Could not dump table "feature_data_4590768e_eb36_4f03_bbe3_84a7ab3db8d3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45948b60_92bb_11e0_a35f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45a5318b_2a0f_4f33_b4aa_f6c65cb50f45" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45be1bc9_66ac_4667_8654_7cabe75d1973" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45db585f_bf39_44f9_9530_c7f15ff36888" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45dd4d97_5dab_448b_a42f_24e4dbf18a24" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45e0e4c6_8328_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_45e9aec7_23c2_40af_b644_bec8b7f01530" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_4628193c_6d1e_11e1_9d19_12313d23d00b", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_46599ddb_aeb1_4e6a_a8ca_c65bbeaeb4ac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4684a15c_cccf_4d85_a70e_b3720f50e20f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_46b8a143_d921_4fbb_addd_69b79c1e3d4d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_46c435c9_a2ed_49f0_8a43_29b957579aa3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4719fa48_c9a6_11e0_8355_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4764b85e_7456_4e29_a201_1a465a837a8d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4765cbeb_3e30_48a8_99db_7c1309c90876" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_47b83881_63b5_4bbd_bc7c_93498d33719a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_47d886e1_f8a7_4751_b012_d046c3e346b1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_47e2915a_859c_4691_840d_c81292b85cc2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_47f6013a_8321_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4821392c_9866_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_482a320b_e3ac_4e85_af4e_393927204f72" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_48352924_fd4b_4768_a60c_51c396ec1198" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_485cbb56_854b_45c9_9106_ab51d717d401" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_487ee76a_b2ed_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_48b4d5e5_dc23_4efe_91b5_f2bd97fc55c2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_48b8e7a6_f59e_40c2_8281_3f70af9fac8d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_48c4bb63_3b25_4520_acb6_d369c761dc22" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_48c605aa_95d4_40b3_8c55_e4dbec004004" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_48e83dd4_8bbd_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_48eacdf9_623f_4ec7_9763_932e26f6e151" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4934b9da_d5e7_4d76_a6f2_3c6e479aabfc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4937e6ca_c373_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4967db65_4f2a_4b66_b422_58d5d23d7018" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4989f5e4_c375_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_499d7f02_6d7e_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_49f18508_a8b6_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4a6c4c31_f633_4b5f_8dda_87b21c4ebaa4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4a7ad9ca_23cb_4b6a_96b4_e48abf716c67" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4a7f1a78_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4a98aa48_0ed8_4369_9d6e_c9b44db2a8b7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ad508d6_d0eb_47ba_a24f_bb00c0cfca36" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_4ae56e94_ab48_11e1_834d_12313d23d00b", :primary_key => "gid", :force => true do |t|
    t.integer "to_bas"
    t.integer "sub_bas"
    t.integer "maj_bas"
    t.string  "sub_name", :limit => 75
    t.string  "maj_name", :limit => 75
    t.integer "sub_area"
    t.integer "maj_area"
    t.integer "legend",   :limit => 2
  end

# Could not dump table "feature_data_4afed896_a8b7_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4b186340_f773_11e1_ac75_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4b23a11d_cbdc_4c86_9631_882ee9b99b46" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4b3bf669_57b6_45d9_815a_846cf9b77368" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4b3f2218_b238_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4b6c3f4d_1bfc_4c88_b0c4_5317a3f325b4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4b973ff4_8bbc_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4c063784_68e0_4878_8137_b816e97e47be" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4c0eb61c_9894_4d1a_85d5_ea71e7cd9188" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4c1c9a50_c30c_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4c1cc51c_df28_4593_a7e7_bef7f7d0e7bc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4c28d0a6_6795_4896_a4b6_5d7acaf5d076" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4c61db4c_6d84_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ca36183_8d4f_41b1_9aa7_df3fea8396c0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ccc2ca0_93f7_4f64_b4b3_f4b2b888d2b1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ccfe1b4_0631_445f_8333_83bd5a800472" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4d6acff5_dc78_4f8d_aa82_110f82de4685" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4d753bb8_7005_485c_8404_2eeab3f28c2a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4d810209_474b_4211_9120_8f81dafb5db8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_4e1bc78d_8f0d_4195_8676_e4268bd11f75" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4e6aa42b_0218_48ca_8059_b7ac84eb77a0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ea2c402_c36b_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4eadc199_e471_483b_8268_90d86f2e801e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ebaf2e1_aa80_4b0f_8d50_7ebdaf436611" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ef9e96e_462d_4d93_b9bf_7a97804951fa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4f060d7d_7b1a_4059_8fdf_b223a580a16b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4f5944a0_8bab_4718_8241_2065952f80ac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4f7e709b_976e_47ce_8117_eb8f19a035ab" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4f868706_8c7a_43b5_99da_92c2a7572ae6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4fa51765_e978_4494_a12b_02f31abdcc73" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4fb6ebf3_7adb_4ee1_888e_7205dcf1b312" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4fcad4ee_9839_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4fd44cdb_cb74_48c1_8446_dd17baaf8bf9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4fe36d87_5bcc_4fa4_9931_cb219093f51c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ff578c9_0995_4872_bd85_0b596f6f057b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_4ff845c7_f074_4824_849f_b58642c37c65" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_500656d0_a32f_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_500e1658_984a_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_505cc5a3_1bcd_43df_96e7_efc02a02dc8a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_50b859d4_a686_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_50b93574_9948_11e1_b021_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_50cf40e2_c756_49f3_b6c8_ef222ceedd80" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_50d61f82_5b2f_4626_a20e_66df4d9adcd0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5211959c_6d88_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_523427fa_b49d_11e0_8cbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_529a7789_03e8_4db7_97d8_d711a16b1d3a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_52a31331_f802_403a_a7de_4777696f6f5e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_52c35b10_8f26_43e1_8989_da5ef6d8c082" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_52c4fbd5_5e0b_4179_8395_8df87407e9f8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_52f798ef_830a_4e49_bb42_10f2872f9784" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_533c9ad6_832b_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_533d5dfd_1ec7_4f1f_a21c_1e32ae17f22a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_53650c38_6d8a_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_53a5c2d3_6beb_452b_ae76_6754db65625f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_53eb34b4_9763_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_53f5151e_7dc2_4833_9e06_d44b05257cd5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5427294e_2a1a_4493_bba7_6c6cce8c5c4b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_54312e6e_8213_4485_a29a_af5c67006e26" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_54553c2d_4826_47ca_a0ed_e8de2d50b890" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_547972f2_a338_11e0_ad0c_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_54abae52_f2cb_4e9c_abd9_85f921f01bc4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_54b29a65_2f19_462d_8fc3_316b6d5cf8c8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_54d4aaca_96ca_11e0_963f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_54d5f8d5_fc6e_401b_8496_cdd2579ff702" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_54f019f6_5eaf_46aa_9ae3_d1944979a2e8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5510407e_d9c2_4ecc_9245_2b2287f0fa79" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5519526b_ee25_4a30_8a15_7fc8813d9774" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5532fed2_50d6_4b3b_ac74_e052b7a6361e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_559da887_af33_4185_9d3a_c9e6e7ff5e0e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_55b57175_35ec_40fb_8292_22bc0d9fb63f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_55c8b658_2f3c_40d1_bb1f_3dc7dda6dfe0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_55ca6fef_6897_4620_a52d_227a151aa489" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_55f51632_7237_4967_81e8_d38b03854a63" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_55fa596b_e941_411d_abaa_c6d1d0175a44" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5606bb9b_d491_4224_af53_dcc5f2914760" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5681be61_b8ed_420f_8072_f11b4c8c02bd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_569c8148_7823_4463_b1de_a96133d80c32" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_56b44952_9861_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_56bbaa7d_540a_4daa_add2_8e6bc81ab133" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_56c2e15f_f85c_4ae0_98cb_b748d10ffdbd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_56e68fb2_c226_4cfd_acc6_865224b75d5b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_570a7ee8_dcfe_4851_8803_a24f47fc62e9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_57225436_6710_4af3_b32d_65e4330659b2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_575558ba_1e2c_4d4b_ad9c_0b55cbe8a26f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5788415a_985f_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_57a66b04_c9ff_4a87_b1ab_8b2d2673adf9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_57ade606_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_57f15e08_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_5806d6ec_af28_11e1_a07f_12313d23d00b", :primary_key => "gid", :force => true do |t|
    t.string  "hwin_num", :limit => 254
    t.decimal "x"
    t.decimal "y"
  end

# Could not dump table "feature_data_580dd282_c363_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5828bc68_a740_4b09_953f_595dc19bf56a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5833740a_d977_4b1a_9429_d3a7e34a011c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_583daf74_6d7d_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5859d021_952d_4dd0_8e49_1ee6ce8e651e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_589c1e60_af27_11e1_8cfe_12313d23d00b", :primary_key => "gid", :force => true do |t|
    t.string  "private_la", :limit => 254
    t.string  "pgmis_casi", :limit => 254
    t.decimal "latnopriva"
    t.decimal "longnopriv"
    t.string  "cons_autho", :limit => 254
    t.string  "county",     :limit => 254
    t.string  "township",   :limit => 254
    t.string  "lot",        :limit => 254
    t.string  "concession", :limit => 254
    t.string  "aquifer_ty", :limit => 254
    t.string  "aquifer_li", :limit => 254
    t.string  "wwr_number", :limit => 254
    t.string  "strati_des", :limit => 254
    t.string  "no_record",  :limit => 254
    t.decimal "well_depth"
    t.decimal "wel_piezom"
    t.string  "screen_hol", :limit => 254
    t.decimal "elva_groun"
  end

# Could not dump table "feature_data_58d02419_592a_4754_acd5_5bc7f81833c2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_58e87634_b4b1_4d70_9464_a676345ba9c5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5919d8e2_b229_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_59650266_a2db_415a_b061_fb8fc56fa71b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5985314e_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_59bc1eac_6098_4a8e_bb69_25732c06cb5a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_59f1d50a_ae53_11e0_86f2_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5a1938be_4b72_4c82_8e1a_9820adb04807" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5a4cc7cc_68da_49bc_bd8f_7f3c1e4ae747" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5a837733_089f_4b10_89de_992eda28c454" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5a975f99_180d_44ab_b396_525a10c92191" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5a998674_a8b8_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5aaeeebc_65fd_47d3_b4cf_e7e6870f410d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5ae63a08_a2a8_420f_babc_26152412716b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5af880ee_3feb_4164_b896_097efa340de7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5b10b48d_df1a_4e56_b638_a8289478f096" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5b545475_32b3_4e0d_9ee1_1510818f15f9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5b609152_e83e_4030_a065_b037cafc98b8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5b7a0048_abe0_11e0_a4de_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5b885cfc_82d7_48ae_8fff_ab0a03fdfd58" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5bb4f9b5_8a0e_4af1_8d36_70a87d33c0d4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5bf1d05e_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5c0cd8b6_2fd4_457f_acab_ac855ea65d5b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5c1738e0_b4d0_4467_9e06_362b44beb1f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5c1a838a_cad2_4826_8076_05ec507dc8d5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5c4b6031_8e2c_4d07_a07d_a600736db177" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5c5e5bda_c1e6_40ca_9aa5_f7c11b3dd685" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5c6127ab_2380_4f16_9ab3_8609c36a474d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5cdba03f_97ed_488b_afab_50ffbadabe70" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5cf84608_5e57_4119_bbc3_5887bc74a194" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5d706c62_ae50_11e0_86f2_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5d7bc5d0_07b2_4285_a684_e9eb56137d62" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5d8bc0f8_a34b_11e0_9b8a_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5da1d64b_0029_4a52_a058_62b9f845bfad" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5defe5de_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5e843ee0_c1eb_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5eadbb42_48bb_4d72_bc8e_db4ed76d682e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5ec1b675_763d_405d_8911_cea1d31c2ca2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5ed55f2e_29d2_498c_b639_562a1803cf2f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5f1b25d0_9860_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5f6d1ba9_9371_4e74_8321_acd811efc031" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5f7ff30a_f6fa_41e8_b5be_97b8b7b96f2e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5f8cf475_eb01_45b5_bd74_bbb0e93ddb0d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5f90c550_b2ec_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5fac2e14_bb0e_4c52_bb69_9a60ada7e6b1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5fcaf38e_6a08_4f10_8713_41e552beb79e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5fd05918_8bbe_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_5fe1db4a_a8ae_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_601c404c_a212_4805_afc8_17aac1d1d4b5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_607bf7c4_a9f3_11e1_bb55_12313d23d00b", :primary_key => "gid", :force => true do |t|
    t.string  "fips_cntry", :limit => 8
    t.string  "cntry_name", :limit => 19
    t.decimal "green"
    t.decimal "blue"
    t.decimal "grey"
    t.decimal "total"
  end

# Could not dump table "feature_data_609ea2e2_6d85_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_60d43f10_7d08_11e0_a516_12313d031ca0", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_60ee6fee_cd65_49bf_8ffc_d6ead33db80e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_60fa3351_7618_41a0_a527_6c2859399e27" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6100cd17_5d31_491a_ab56_7691c57945f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6106af69_b026_44e8_aa56_990c529a78ac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6171ebf6_a2bb_11e0_956a_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_617e9400_bb85_4a90_939c_3a2243177298" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_619ebf5f_1cae_4689_a006_1c6ae40df0cc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_61b1f7d4_b22c_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_61e14fbe_6b8e_4dd2_a0b3_10f709f9e4c6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_620202a7_d4ee_4bab_9613_57e39e6383e0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6237a65a_6d83_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_623a1634_a33e_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_623d486a_9766_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_624d926a_8024_41f4_9de6_8d88bb669c9d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_62627a84_9862_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_627366a6_c1e7_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_627fb540_9849_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_62e3d297_45ff_438c_9e59_cd5bf07a4036" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_62f6db9f_97c0_48b3_ab71_dace817cf947" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_632f4a2c_da6e_48cc_aff5_b0ececd9ad81" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_633b2651_67e4_41ee_a167_3efe1fcc4353" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_633fba18_c376_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_64024a36_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_644a32de_f850_11e1_ac75_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_64649d08_dadd_4e38_9442_1088f9cf3c7f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_646854e5_db9c_464e_ba11_1437f85f427a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_647271ae_8baa_4bec_bc9c_b32f71a3683a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_648a8575_bd82_4608_9077_daaa8d0f6ed9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_64aea2da_e390_408d_b3ff_23214f60806d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_64e1b5b8_b690_4ccd_b02b_4c2244fb18c5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_653d2baf_0856_483c_a81e_6bb211bd3fbc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6549570c_8c6c_451c_93bf_49bf9da85848" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_65583eea_4093_45f8_9798_373c6efb0d8e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_658bad66_171c_4629_9f06_36703597ac71" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_65df2fc6_bf95_4726_9a62_9930c59dadfb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_65e2c661_fac1_467b_975a_21c18fd789b5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_661368ec_be28_4ca8_a192_7e1dc8c8c113" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_66279f24_8416_4811_b4c8_891af87888fe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_66389930_c2bb_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_6657e1b8_fb60_11e0_bfb5_12313b015271", :id => false, :force => true do |t|
    t.string "Year"
    t.string "Survey Team"
    t.string "Total Number of Brown Trout Redds"
    t.string "Approximate Latitude"
    t.string "Approximate Longitude"
  end

# Could not dump table "feature_data_666a8c20_b216_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_66ea20d5_3d5d_411d_b806_4949a8e66374" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_66fa884a_502c_47b7_956b_f1cf07cf9224" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_67140260_c1ce_464d_b0db_fcc659d97ee3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6755faa2_6d82_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_67d9fa4a_c374_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_67f99280_33c8_4570_95bb_9848f7b92ae5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6804c713_81b7_4ea5_9c46_ef86f11e818f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_680e5830_1293_42fd_af41_590d69b6397a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6823cf5c_4cbc_4eb3_b2cc_d97be4baac21" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_684ae188_5213_46ac_8063_f9bfd72cb0b6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_690eeb3c_f84d_11e1_bfed_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6923ca37_e589_4c45_bcd6_5841db8e43ef" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6923fc7e_cbc2_4ab9_9175_495b5fe0644a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_69876c16_86c7_4d7c_b9cd_4b2545fec6db" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6a0f050c_9d5b_4f24_a967_0a1d285b7d83" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6a19e65c_8329_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6a5085ba_16df_4a99_b5b3_a1b04fe568ee" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_6aa447d7_3d8a_49ba_977f_22d7f78e0af5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ac47da1_5ca0_409f_bc71_a588ea76de19" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ad1b828_975f_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6aed6b68_493f_413c_8ef8_323c372afaa8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6af79f64_9b7b_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6b27b7eb_5abb_4bfb_9202_2ca1256af788" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6b398dc3_e1c9_4356_ba2c_f04ca821f558" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6b8399b4_fc02_4ba9_92f1_1a0061c9da0d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6bb35d95_fda2_4406_a2d4_df7a798e4349" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6bba5f4e_0f65_4d4e_b25b_8d89632120cb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6bc0b75c_d305_4146_8608_f97c116f05a2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6bd15fe9_9ec2_4c10_a3e1_8d07daa4b93b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6bfb4304_0ca5_4088_ae96_a3d7bacd2271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6c26b7a8_c36c_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6c2fb419_ed08_4b95_a7f7_ec1d5482365a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6cabb1f0_9b7c_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6cbdbb13_fc03_4a4f_a680_de9446eebe0a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ce225c4_c7da_42e3_80ce_0924f61137ff" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6cfbc46f_daec_4f66_a73b_99f1e1961683" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6d06c3c5_b33a_4fa7_b7bd_5649e830b308" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ddc2169_aff7_43cc_bded_545207a8e141" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6e78b3ea_8bbc_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ea54aa0_70b0_4da8_b96f_0d205260edb8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ee2632c_aa52_4747_bb1c_3be1fc5b34f5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ef30aa4_cf38_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ef3d193_f199_42d0_bbe6_e075bdea7fb5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6f0a59f1_c98f_4548_8e66_837d58bd1fdb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6f21bc03_bbb1_43c9_b1a9_b8ab6d8ab4ab" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6f48bda5_07f3_4677_aea1_069df3e1d065" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6f4a39ac_c563_4b18_9f37_b703d9b76a27" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6f524fa8_40e1_4c37_b35e_eff8154920f5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6fa21196_3208_4a82_ae72_c05eaa6c15ea" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6fae732d_f64c_47a9_b540_00a7b57e8f89" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6fb3a671_3c24_4d5e_8156_4aff44d6c5e2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6fd67db6_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6fdf75b8_cbe0_4c71_b36c_12d56283c838" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ff03b40_90cb_40d6_8a97_d7a228298b68" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_6ff405ac_832a_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7020cdaa_64a1_4022_9c57_798ae64ed77f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7038c9b7_969f_400f_ace8_821b07defc67" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_70921d67_65a8_4f54_aa16_bc094dd97fb7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_70a6f7a4_8bbb_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_70b1a849_e616_4418_95f9_b5d8f9c3022d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_70f04fdb_5bd2_47af_aad3_86e1140b1a91" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7100aecc_cdbf_4716_b00e_4189c24dd9ba" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_710584f2_b2eb_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7119199b_a6d9_42e7_b56b_1ac82fabf611" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7141dc38_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7160386f_9c3a_454c_bda9_6e9a3ced7df5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_71658422_c2f8_45ca_a0bc_f433fbbe0595" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_717ef7cc_3b62_48df_8810_e473280d12d9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_719f0fc4_a336_11e0_ad0c_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_71a48520_b228_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_71d0463f_d91e_49f4_9186_0f7d5a44c8d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_71fcf5d6_9764_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7205f1c8_97e2_49d7_abf5_f876865ca76a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_723a6e68_6d36_11e1_b5e4_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_723b3b20_3958_484b_949d_2185281bd87a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_72691838_cf36_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_729429ec_b217_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_72d03c14_8bbd_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_730b4b19_b28c_4664_93f8_31558943dbe8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_731593de_7285_459b_b481_54fd41fcc577" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_73257b92_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_734adcd3_41f4_478c_b4e0_06f791a6621e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_736eb50a_a33d_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_739b1974_b189_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_739eacfa_a105_4cf9_9d6a_17732386f9f8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_73c137fe_ffa5_491a_90db_83fd443631ac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_74508e44_1ad5_47aa_8ed1_40d1a37a7ae9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_74623e04_f851_11e1_a7e3_12313d23d00b", :id => false, :force => true do |t|
    t.string "Year"
    t.string "Ave"
    t.string "Max Season"
    t.string "MinSeason\r\n"
  end

# Could not dump table "feature_data_747d1cb7_c66b_4912_9e3a_147913e5269b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_749510e2_2daa_4e57_849d_df68ffbca7dc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7495d2b8_d2e3_4ee7_b3b1_0cc873c6e3f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_74a2e372_0c63_4cb5_a36d_0a8c80b388d2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_74cf6ae9_d3b2_4c3c_9944_ee45e0f6b066" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_74faf7ee_82ee_4de6_b37b_a8fdb4678aa2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7514d490_1de3_44f6_8717_e0ae9a26c856" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_75429383_2aaf_44ed_abff_612c10bc65f6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7547bedb_736e_4d2a_95e3_67c99a92e47c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_757676ca_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7591df2e_06d9_4529_b17f_b6b243ac421b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_75a41c58_9838_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_75e426f1_fc4f_4490_b17c_011299023446" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_75e6afca_2698_498c_adac_caf26157e7e3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_75f69c1f_d602_40bb_b1be_2cd812ff327f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_760ec9ee_6fe4_4f0e_8287_d0576d069cba" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_76266201_accf_49ff_9ae2_a8a2d81365a4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_762737fe_5ca3_45c2_99ed_88674e008dbe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_762f4b95_9a5f_46a2_bbb3_49c120f6593c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_762f53de_b2ed_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7642c4be_c247_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7654dee9_b43b_4b18_bfa7_ee8014b0808f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_767dd2d8_957d_49ff_8fd9_1628a5ac88e7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_76887eb4_1993_4f37_9d81_f1116466f4d3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_76c163b2_9b75_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_76e30c70_e0a0_4ae8_b528_4c5d32d9518b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_76f2a043_9291_436d_9b69_2fc8d9ad5ddf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_76fe4cc4_bf78_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7712d417_51b0_44d7_b46a_73691fb8d12b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_772ad342_6d7a_11e1_b5e4_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_777452d0_5e9a_4ed2_a47e_085f573b0880" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_779c9b9a_5b6c_4cee_aef0_d3677c1dd564" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_77a02c63_e5b8_4f9a_aa9b_4d008a16545a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_77a44a2b_3c99_477a_b634_7b44dc45db68" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_77c92f02_72c7_4915_915b_ebe7ec6d449e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_77d5e244_4303_4676_aead_ce6a08e4bcb6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_78140c5d_1e7f_4f41_9d28_c7729414b349" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_783de498_8057_468c_b4a5_196e290ab7fa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_785c1fc9_b025_44c1_8548_990383adac95" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_787f47b7_2b72_4749_a51a_e10e3333bf0c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7882ba90_9835_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7895890e_b239_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_78ca0be9_0697_45a2_a647_3edea394dda4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_78cf32d8_9765_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_78f2d510_8bb9_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_79067338_2146_4476_8a4a_b92876e094d3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7912cf05_9a4e_4bd5_ac90_3c5939da0a5d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_79175da4_6d86_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_791cb518_a8b7_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_79bfdfca_9b53_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_79c5b406_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7a1578c0_8bba_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7a2df7d5_fbb5_4079_8d10_0bc6dd725c15" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7a6e88cf_c717_48d8_abcd_f72ea36911de" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7aa5f7e8_9771_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7ade2b23_d2c7_46ad_b187_6b0c8b2ff4c1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7ae16893_1a1c_4a4f_880e_8eab498a6c45" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7ae727f6_f5ce_457c_8792_4145d76f6a42" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7af51770_35a6_4469_b26e_5f305afbf7e6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7af8ca60_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7afe4578_9763_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b014d40_d29d_4923_9678_8f724ad55963" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b1813e6_c2b4_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b24ce5c_d33d_4882_a248_fc1de50a810d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b307889_2b6d_4815_947c_ca932c28bb5c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_7b385f86_a9f2_11e1_b326_12313d23d00b", :primary_key => "gid", :force => true do |t|
    t.float   "basin_id"
    t.string  "drainage",   :limit => 40
    t.float   "area_calc"
    t.decimal "population",               :precision => 10, :scale => 0
    t.decimal "ws01"
    t.decimal "ws02"
    t.decimal "ws03"
    t.decimal "ws04"
    t.decimal "ws05"
    t.decimal "ws06"
    t.decimal "ws07"
    t.decimal "ws08"
    t.decimal "ws09"
    t.decimal "ws10"
    t.decimal "ws11"
    t.decimal "ws12"
    t.decimal "wsavg"
    t.decimal "monthno",                  :precision => 10, :scale => 0
  end

# Could not dump table "feature_data_7b463862_f041_4e23_aeee_866799915b3d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b4d54ca_7bbb_4430_b3c4_0a857fb5fe9c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b7b4054_1282_4959_8f23_9da4d3d524a6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b887392_c76b_4dac_84fd_51280d1de30c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7b8c562f_8c62_4ea4_b603_bd145bb26560" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_7be1587c_c9bd_11e0_8355_12313b015271", :id => false, :force => true do |t|
    t.string "EarthTrends (http://earthtrends.wri.org) Searchable Database Results\r\n"
  end

# Could not dump table "feature_data_7bfc8490_ad74_11e0_8c43_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7c00b143_a547_401b_bcd3_0552018edae5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7c0a8dc2_984a_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7c51e97e_6588_40aa_b8c4_602e0fa472f1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7c63eb4f_e041_4ad0_8b46_4d1a4e5f6c9e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7c89ee70_ef80_44b1_834f_ba60363cc979" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7ca3daa8_0c39_4b97_9117_e9581748aa33" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7cca0822_c375_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7ce68bef_4ef2_42c0_ba10_fd417a08d20b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7cf1197a_a32d_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7d2d7a33_96cb_4ece_8b6f_8c32dd752dc1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7d36c1e9_599c_4e7c_82a1_38fbcd5b48ee" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7d660bf9_2489_482a_91b2_1c72655d424a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7d6a60a0_72a9_11e0_9c80_0050ba2647ec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7d73dda2_c1ea_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7d9f95a8_9861_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7dc06835_4362_41a6_984d_6900821e8960" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7ddf7692_83df_4f83_a6fe_ebe870d9f000" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7dfcba91_8d0f_4f1b_94a4_1922b0d37959" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e03f790_9b7d_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e0e5fde_ec56_487f_9349_3750b45a1255" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e140d25_0d97_4f0a_9d1d_766db0f89001" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e1ce24a_13e9_424e_bd7b_fd4923b9bc33" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e5a0fbc_dd52_47df_a00e_1a610bae9fbd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e602a92_95e1_47c7_afb5_35b5986762d8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e6906ed_d814_4642_a4e5_7e217fc6aaf1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e6fce87_66e0_4131_8a6d_e4659ec07d94" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7e779c00_11cb_4609_a5dd_30d1cd196d53" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f146dc6_2c45_4548_a5d6_d280f5a9df3d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f159e12_985e_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f3b1e82_832b_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f3db3aa_ea3f_4319_9162_79bc4713826b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f4c1087_44e9_4f88_9d2d_a9ea9e5818e5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f52d20c_d626_4186_9abf_5346b647a6ca" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f54352a_d492_48b8_952e_48c4406e0220" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7f9031ab_ebd6_4125_9b59_5838925fda80" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7fa6ac98_9e18_4d32_8824_acd6f5900297" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7fbe9cd4_587c_448e_a803_05c5c83f8681" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_7fcbcf4c_0424_4a01_9f92_275b4031a08e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_802621c1_0a6a_4fc9_b37c_b89df9a56dbc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8047ef8c_72ad_11e0_9c80_0050ba2647ec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_804c0f28_30f3_447f_8667_ea80a8cfae71" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_80a2a80b_7322_4bbb_9375_9da8371d6349" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_80b106c2_c373_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_80fc307a_f770_11e1_975c_12313d23d00b", :id => false, :force => true do |t|
    t.string "Region"
    t.string "Country"
    t.string "Annual Renewable Water Resources (km^3/yr)"
    t.string "Year of Estimate"
    t.string "Source of Estimate"
  end

# Could not dump table "feature_data_80fe6cb9_2fc0_4f64_9bab_7d8b4ca62506" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_81513d52_bf79_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8166f4cf_4575_4650_88da_76ff350a4f1b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8174d00d_3668_4f01_a360_4389c491f896" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_81fcb8a6_dd8b_407b_bf79_9429a625dfbc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8205ee6d_0924_4322_9755_bc05d19951fa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_82508d79_8da4_40c5_bc75_4779b12df48e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_829eb048_888f_462c_bbb2_61959a5c6d5d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_82dc73fc_8c60_49a3_aeff_2ae7a2f04e8c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8313218d_a524_4a56_82c9_c0cfc662669e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_832b1b16_7f1d_4f99_9838_ead68ed4a23f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_832ec784_b785_4eeb_a299_ac40088b27b3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8339ef64_c1ff_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_833ead91_6f4b_4954_839c_ca46fbd334a2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_834fe9e2_0ff4_4653_ae9a_52e4cb6f0856" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_83d7d316_1348_4a99_a7f7_36e08db84f81" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_8426cd10_9839_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_84275ca9_55b1_462a_97ea_b97ba0a856b4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_843ace87_195e_4c28_83bd_1a5ccbb3e53d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8448bc34_c1e9_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_84b61970_f6ec_4758_9d17_7ecfe19bce16" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_84bd66e3_5d36_445a_9dfc_101c9315af34" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_84e9a2f9_78ab_4ae1_bc9e_f7ca3c106a4e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_85059830_c15b_4c90_92fc_84cdf21baf7f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_8533d3d8_9767_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_855224b8_ad8b_402c_b272_6ca0a678722f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_858289e8_e67e_420d_b34f_daac46f74a68" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_85afb1fd_319c_41ab_85e0_66e87fb0ced5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_85be9359_1981_4a32_91f9_fad9be4836c0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_85e95030_d6f2_4d81_9d4d_21f3268ccced" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_85ea61ce_c41a_435c_a261_3aebd694a4fb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_85f39ccf_390e_4243_91b1_eaf3a634c4d3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_85fccb16_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_86420e6b_a38d_47e3_b74d_be61f9ca943f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8685b9e2_6403_46a3_93be_883be9bc61a4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_869de1a6_a8b9_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_86afc905_932b_4ef6_93da_42cbe5efd21f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_86c89996_4550_4828_9cfa_6239b9ac3be6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_86db227d_d1f9_4d6d_b7ed_d416e6bc52bf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_86eba444_de15_48c5_b65f_ac5befe5ad18" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_86f0bb00_b215_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_86f51984_c363_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87335601_ba63_4a38_8ea9_02ddcfe94973" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87469b3a_a32c_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_878f5726_a683_11e0_aa6e_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_879059ba_8328_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87a99816_9b7a_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87b16bed_78e8_4c6e_96b5_dc15c08f60a1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87c7648c_e2c9_4b01_8900_9801253e386b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87df1e70_1395_4c86_8794_fd734d767ae6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87e7fc05_95eb_4b71_aecb_742a70764ed6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_87f310a2_60b1_4253_972b_0420726cd313" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_88149921_f3e2_47f4_bdd9_901901195307" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_882415ad_b484_4284_a8a5_f4aa32c5ff6d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8833c40e_bf84_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_88375197_0550_4358_9971_6e0c87446074" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_883ead58_0c0e_4bcd_945e_d59be99637f5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_885fa068_983a_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8881ca88_9b7a_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_88bf90f6_6d68_43bb_9a6e_0f47a58fdd25" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_88da76c4_3a50_4e77_9c7c_fe1d92dbe428" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_88f48f0c_b386_49b3_92e6_661e18334866" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_88f5ca68_94ed_4dd5_95cf_0ba3355181cf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8960b69d_30a8_4f30_a9da_3a5880c08914" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8976acf8_7536_4d72_81c5_cba037250261" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_898e2c74_b22b_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_89afd80c_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_89bb28b0_8327_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_89d8146f_1c29_4468_8781_bd47e0c91087" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8a2efd44_8d4f_4a39_a4d0_cab555040bbe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8a3c5958_cc1d_4bd9_8d54_b900130bc9ef" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8a42e4c6_d3a9_4b72_bfa9_925cbe0996f7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8a6ac176_c355_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8a79e737_f690_4094_8231_d54b5f93e857" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8a94a76c_c372_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8ac463f2_4abe_452e_954e_eb9fb2915f10" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8b3d51fc_c307_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8b7d1a90_ff5b_484f_8a3b_504a979b32f3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8b856470_4515_4b85_8222_565232006958" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8b9d6026_a32f_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8ba0263e_613d_48d2_ab02_9b70d45c7893" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8bca8562_756d_4a6d_b705_2ee7fee610d5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8bed7e00_a81e_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8c0705cc_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8c341a25_69f7_4094_93e2_4d63791ec340" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8c606014_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8c94d4f7_4f7e_457a_b88f_c6c8b23caddb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8cd98fe4_0af1_4622_8925_86b68d87dd68" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8ce8dd9e_8a71_4380_bb5e_9553051d8fa9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8cfb0c2a_9849_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8d0fbd9b_c8f9_4d60_8229_49163580fe48" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8d19dd08_b216_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8d3e43ae_0dd9_4d92_a476_273df1e8265b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8d457c20_fbde_4a65_a37a_875e7ffb0004" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8d4ad454_a685_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8d52b143_3041_4849_8ecf_4634f1c3e956" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8d9450a8_cf38_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8db506fc_bf70_4dae_b244_eeab995891a2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8df4a876_9906_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8dfcb056_51f4_485f_a12b_612debe3c0ca" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8e15a7c1_6728_4781_a3f8_2973055ecc53" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8e18a72d_212c_4dc8_89e1_f755fd4b58fb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8e2fcf27_30cd_47f7_94bc_3d90941a5372" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8e7af796_dd8a_471d_b0ab_4a98170cf9d7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8ef95341_7e4e_4785_becb_0af981345cea" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8f301d98_a34b_11e0_9b8a_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8f49432a_31e4_4447_bfa2_592e440eb539" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8f8c2fd9_da16_4b14_8551_cef3717c80e5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8fa3993c_2f2d_4b33_b4df_a3692cf23a8d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8fd259bc_44ef_407b_8c4a_1aacc957a8a8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_8ff1a4b8_c36c_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9075af9f_671e_4bd7_a15d_c5951b1c6db5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_90b69fe8_9860_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_90beab62_c30c_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_90c45f17_fbb0_40fc_a352_1d5bec26ef52" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9105781f_46a4_4612_bc0f_aa78e14299df" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9124ff4f_c6dc_434b_a83e_0de425eb9a16" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9170cd18_c1e7_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_917e1ed5_cb75_4d05_9647_0decc416ac4e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9189b5e2_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_91cd45da_8ef8_400d_b615_1607b94bea0f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_91d43ca3_41d9_45c1_b572_a911792e522d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_91f9fcbf_220a_43de_8c10_8541673a65b8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_923b01a0_b9fe_11e0_abbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_925f9d92_b0e0_11e1_9946_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9263f412_5d14_4d35_af24_4fdda5c3dbbf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_92af067f_52a5_43ea_91e3_ab9c77fc8fb7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_92b753e3_bbba_484d_8f85_acfcd8b28935" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_92c254ab_0496_4921_a450_8dcd27d8a067" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_92c5050a_6d89_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_92db84d2_c376_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_93104286_a8b8_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9329c96b_d3b5_4b08_8e40_d8bfd28a3aec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_932d039a_53af_4aa3_9d92_1762dbe3f2e5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9338de2a_7339_4427_ae62_e4761a9f5d11" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9354ff4e_c2b1_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9355af20_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9362e8c2_c36d_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9371a599_377b_4ce6_84a0_6aa5807fb3de" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_937b214c_ebaa_11e1_9d19_12313d23d00b", :id => false, :force => true do |t|
    t.string "Source"
    t.string "Mercury (kilograms)"
    t.string "Percent of national amount released\r\n"
  end

# Could not dump table "feature_data_939469b2_8329_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_93cf052d_acea_4dcd_8aad_f72305042757" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_93d51f2f_3dde_44c1_a6e5_a5ea4071b72c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_944c96b8_8bbc_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_945e48e4_c371_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_946a7c9f_2ea1_4447_98c6_a9e48ebb5ab3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9488042a_4ff6_4620_91c5_2ee140b548d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9496cc3c_6d7b_11e1_8c8e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_94a061d2_dfd6_4b5d_8a53_26b7cf9766d9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_95137f5f_59c6_4248_b344_e2e6e54599eb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_95233c94_96cb_11e0_963f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_955ac1f7_9f16_4f1a_8e3c_eb4be46c477e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_95898200_cebb_44d0_a15a_7c5c628f3968" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_95bb6aa9_8e71_4b21_8375_f02f6bad2375" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_960123cc_f7cc_4c3f_8f0c_3342604ccd46" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9649f16c_e45f_4a0b_94f4_7e11c50a1aba" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_964ce9f0_56d3_4780_9bbc_bfa0e74003d4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_96a1961f_1ff8_4260_80f5_e17969160b0d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_96c04e95_fe1f_44a4_9756_d789d641f30c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_96db998c_95f9_11e0_bd01_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_96df4551_a6da_4624_a7f2_773425f60f2d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9736a018_de64_45c2_b10a_a46a161b804f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_974586e9_5a30_40ed_b1b4_a50cb594eb1f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_97b502d2_786e_4c2a_b9d9_cae00d358da1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_97d9c5c8_9763_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_97e86bee_df1c_4c5e_863e_0cc7f329eb13" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_97ec578e_982f_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9814166d_5bbe_49be_b7ce_642a48bf6fcd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_98ba2393_4a0e_4370_ae54_fd71487981a4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_99161208_b2ec_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_995a04a0_72a9_11e0_9c80_0050ba2647ec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_99c49b06_6d87_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_99d794c8_5ead_4f3f_bdee_43ce97362d30" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_99e4ce34_73c5_4850_b8fc_6235f0496901" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_99e64af5_983a_45fb_9960_cf6092fcf5b6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_99f834fc_c3c1_4e7c_9c5f_8b042f64cc6a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_99fe9e11_3210_4458_a38f_82a652369f82" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9a1785f7_7210_472d_9273_4772c35b4922" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9a42fd24_b780_48cf_8ad7_f821a3a7621c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9a8f922e_b49c_11e0_8cbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9ad2a3a0_aa43_4aa6_b738_3661f579db3d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9ad56c19_b371_44fe_8800_2b4f80ff9b24" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9b1babea_6330_11e1_825e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9b42870d_64a0_4f64_8979_0929afd1deae" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9b58e212_8bbd_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9b835823_e254_4985_8ca8_503f1e5d9031" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9baecfef_7d09_481d_87b2_878fa01f6601" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9bfd0193_519b_425f_9cdd_ab121203bf34" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9bfe3cbc_d856_438e_8947_400237dbeb51" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9c81d4cb_ac0c_455d_ad1e_d193f3255c53" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9ca77d2c_5ab7_400b_9cea_a8e86aa80e5d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9cb2ac34_9832_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9cc5da9f_d4a3_49ff_a376_9c7f20239122" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9cdc3316_8bbb_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9cfdb8e5_56ec_48df_a636_624ef2639585" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9d0d5310_b217_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9d158301_057a_44f9_aa48_da44bbcbd5fb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9d4ab9de_d23e_4764_8568_7154c05a3d69" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9d61a0b5_75e7_4ce2_a1bc_0d36f07db3bd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9da0e498_f241_4760_9bc5_4a7d01710566" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9dde2972_383e_4053_ab3c_c283f21053c3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9df17e9b_a9ba_42af_af03_cad8431e6b4d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9e157ff6_9945_11e1_870c_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9e2edc4a_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9e56b96f_fffa_469d_b517_ad0ed9278b08" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9e579a08_9838_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9ed81a24_9762_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f0199b6_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f304e0f_ae38_4def_acb8_383a5dc2e8a9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f32c630_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f4f60d2_6726_497c_9e03_1383875176da" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f59eeb5_23c5_4b8d_b7fc_f20c117ad03b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f5ace5b_91e5_46a9_80eb_5aec51f81f13" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f6a0258_953c_4c7c_8a65_fcb2520203c3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9f793fd6_832a_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9fa51ab2_8a13_403b_ae9a_d9260924d18f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9ff130bc_4571_4232_9084_0346d2c658a4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_9ff77707_a658_4dac_9d4d_90fce6548194" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a0029a8a_6d38_11e1_8c8e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a01d4fa4_868d_4ec3_80de_a24ddd251f86" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a0292a78_9430_4a1f_a684_2204de77f633" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a075eda5_2064_4a51_baa2_dcdc251d1df4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a07ac6f3_d842_4d9b_b0b4_c552ba87de83" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a1a691bf_7f59_42c3_810a_d2651665f821" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_a1c4fe14_95e1_11e0_bd01_12313d0345e4", :id => false, :force => true do |t|
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

# Could not dump table "feature_data_a1d39b35_ede5_43a7_a9d7_ae6660d18df8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a2295992_4021_42fa_bb67_35168c393499" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a24c0666_a11e_4abc_85bd_443df1ae48b5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a2629c00_3dfb_4ea4_a1c0_48473d6281d5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a2636302_cf65_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a26f0d8c_c2b9_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a2c6cc46_65a5_40ff_987c_f19f70e6449c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a2f72336_9b75_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a2f850a9_42fa_4666_8823_79dfb78585a3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a344ccbc_52f0_4896_b07c_df87f1598ceb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a34ea632_9761_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a351ee3c_9770_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a3558aa6_0388_431f_aec2_6953e028aa20" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a3721486_f569_427e_992b_398c2ebd241b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a3c32aac_9b7b_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a3d84936_6d7c_11e1_89ac_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a3d925be_4f52_4fc1_b94a_187c712dd379" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a3e16802_9b56_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a4586356_72a4_11e0_9c80_0050ba2647ec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a469184b_b594_465d_acb0_07675f8bd162" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a4913695_d4aa_4772_862f_30be39b285d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a4b0a6d9_0313_41b4_b050_b9228516d6e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a4b3140b_cfb6_432e_95cc_00b403e8764d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a4b5ffe4_985f_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a4c94028_c4cc_48aa_9bf8_b8fc690730cd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a4f090be_ba23_4537_8ad7_723053969c46" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a55b3138_d45a_422e_9c26_3e39d1b3686f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a5ae0532_984a_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a5c7d19e_1cb3_49a4_a22f_5322caa42ead" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a5ef9874_9b80_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a6507305_0f8c_49b2_8330_fb986be029dc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a6575f24_3172_4a12_bf36_8dcaeeaf70b2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a696b4c1_c1b8_492b_b216_05446cc28040" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a6af3fec_a8b6_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a6b153fb_87c0_48a2_bf6d_544dbeb8f992" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a6c32a0f_d225_4200_9649_fe603a537647" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a6e7e546_d24d_4d92_92c2_acc46d9d51a3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a75a119c_9156_4bf8_ba20_47696e241492" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a78fcffa_2c96_4a08_82dc_6b0b1df6605a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a79e32b2_e9cb_4a82_903d_ebed0889daf0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a7c22d15_8b9b_4b5e_8871_60b0e4aebce2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a7ec12ea_b2ed_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a806696a_9f9a_4b02_b71f_ffafcd4dc176" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a85737ec_9e88_42dd_b47e_514c63fbc525" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a87500f2_1f5a_4eed_8aab_20b923838f70" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a8b13780_9760_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a8b53721_1ba6_4460_8e64_455c5b5073e1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a8e1318e_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a8f965f6_7b9f_4c85_99a9_afadca07d155" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a8fd1948_a446_4834_97ba_e6f97871a7f3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a9014004_ce42_497a_8ed3_cf637fac100e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a9092c60_1e20_40d3_8d81_cdddb3281228" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a90d34fa_a682_11e0_aa6e_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a93cf668_ac56_40de_855e_f5194a5d31fe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a94803b2_05d9_4170_bb67_64eedfba23bb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a95676c6_e4d4_4ad1_8d59_e16d821a94fa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a95eb08c_0501_4341_9ce1_5aab1cd2bb65" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a9864411_8d63_4a46_bf54_e135468d4c3c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a98887fa_166d_4e82_bb05_4e2305a69752" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a98bea51_5aee_4253_a2d1_76feb20b8c1b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a992ff95_6451_4593_a77d_93544040e4ac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a99a80ae_bb35_41d9_a4f6_0f4ccf908b2a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a9b625d6_72a9_11e0_9c80_0050ba2647ec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_a9c1a208_b228_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa01e43c_a2b8_11e0_956a_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_aa0bc8d2_fc07_11e0_bfb5_12313b015271", :id => false, :force => true do |t|
    t.string "Year"
    t.string "Survey Team"
    t.string "Total Number of Brown Trout Redds"
    t.string "Approximate Latitude"
    t.string "Approximate Longitude"
  end

# Could not dump table "feature_data_aa1e3995_ed51_4388_af6b_867c8eaeaf68" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa2529f8_a32e_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa276ee6_d134_44c4_9da0_ea99079b3ea0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa2f67e8_41ea_4acb_8f15_54f3baa83ae0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa3b41e7_21c0_4118_8cf2_e0faac7bc53c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa3e0ee4_985e_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa49fe29_7f99_4d6a_b151_a3adced3f21f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa61c50a_b23a_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa738bc4_70ad_489f_bdf5_cfc4e310a5f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa959ba2_b238_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aa997200_a8b9_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ab2d3524_0e3b_423b_b616_29eebbd27b63" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ab3ad784_3c4a_47a1_8e8a_1fd490ce9b9a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ab3e6f21_59d5_4812_b474_74e3fa6db252" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ab84f4a8_304c_4771_92da_50de6e4e1d7d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aba06dd2_08d4_410f_994d_807a9d217ea6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_abd6be83_3dc0_4425_9627_6c5708a479e7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_abea6796_bf83_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_abf8adad_c494_4c6a_8a00_3c0647bcab43" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ac136e2c_7bf0_4aac_ba2b_18ede96a3376" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ac22900a_5bea_4d23_9889_cb6527e542d1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ac49eae2_a950_4c00_8fb7_25314d3dcf37" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_acbf53e6_b229_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_acdfa092_a338_11e0_ad0c_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aceb2b4b_decd_4ff6_b22a_f0927726b66b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ad10c62d_ee21_45e0_a409_c770d46978cd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ad3e090a_3444_420c_8c4c_eb6bddfd3aac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ad83b0f9_2af5_41a5_9b01_202bd1702961" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ad86bcba_9762_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ae1b14c0_ac86_4829_a937_0e6e82524fc9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ae1ed336_9b74_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aecacd0b_49f5_49d9_9c3b_0d26186b7203" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aef82d6e_014e_48e7_b263_a21e670468c4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aef966ea_eac8_40d4_8170_aae0f2b041af" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_af237552_c374_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_af3ddc4e_f771_11e1_8819_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_af720756_84bb_4578_96d1_5e01529902e9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_af99adbe_c363_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_afa0916f_5759_4c4d_9eb5_651d22497056" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_afb566b5_b920_46b4_8587_89b29c21c0a7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_afb5cd3d_ed85_4594_8cb8_d6b5bd030baf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_afce09d3_d3ed_4ff4_8c28_d5fe12c7544b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_afd0c7c8_6a06_11e1_89ca_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_aff8bc52_6d7f_11e1_8c8e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b00412a2_c0fd_4de0_8a2b_50becf682a66" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b01e8fce_c247_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b04fb454_cca6_4c71_b49e_b52c72c8c188" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b07ac2fa_c245_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b0ea3cbe_0180_11e1_8f53_12313d2b729d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b149f4bc_01dd_4506_a4db_66d815f5dda2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b1574127_e969_47cb_bca6_07357a6e20f6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b17affd8_c36e_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b1851d26_c91c_4eff_a5e8_90dda0f6f016" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b18bdb4c_6dc3_4707_a436_5c6f3e29b6b8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b2205b37_8fbd_4304_8d33_84c92214db90" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b232114c_7ae7_4c10_bd49_a272fd1d6e44" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b2515558_159c_46af_8039_8a380333279f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b2d0d6ab_3cf2_433c_a5c0_24ce5d1eb4c0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b2daebf8_677d_450e_a26d_1ab86cbc4cf8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b300486c_ae52_11e0_86f2_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b337826a_c24b_4a6d_8c04_4cf6a038cc36" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b37cb212_9bdc_4965_984e_695b8c808ddc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_b3efa8b6_6d20_11e1_b84f_12313d23d00b", :primary_key => "gid", :force => true do |t|
    t.integer "code"
    t.string  "valdate",  :limit => 10
    t.integer "provider", :limit => 2
    t.string  "id",       :limit => 64
    t.string  "dataname", :limit => 10
    t.integer "accuracy"
    t.string  "theme",    :limit => 2
    t.integer "type",     :limit => 2
  end

# Could not dump table "feature_data_b41ed04f_7d63_49ef_bde1_a19df2612c6c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b4730c4a_f242_48c8_9615_2ef96f6b93da" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b48125df_ddcb_415f_990d_1f47e09f1dc9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b4d8cecd_e3cf_4f5a_b610_4fea6e9f3fdc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b4e24d8d_7d30_421a_8ce5_12221e44ec6c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_b4f8117f_6475_4eae_879e_c78cbc662d89" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b50a399e_fd49_4f85_8f47_1bedb4ede694" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_b5a11017_0e70_44d5_b652_d1b0bf294cf6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b5a5ecfc_9ce1_11e0_a878_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b5e519ba_9839_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b5ec5b9c_b024_454e_a321_d116d6275491" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b63faf8b_1b6d_45ee_898a_bf9df724de07" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b6bc6129_a96f_4595_9efa_5f7eadc253f9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b71004cd_9400_48df_b95d_e31c056b0aec" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b729df27_e9e6_4f1e_9cc9_5987e0a82a95" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b7377bb4_a71c_4146_9b94_8e6bd9f0ef22" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b7b57389_9336_4667_86c0_82aaade8c2bd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b7b68acd_97c9_4471_91b6_041e79245ba1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b7c1a0c2_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b7d4c489_beb8_4494_9423_0c1919a177a0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b8637b4e_8328_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b8750040_c373_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b88780c0_ceb2_40dc_b513_493ad3ef7645" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b8bb703e_9ec6_4b31_a506_dfd1563acc57" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b8d497ef_1d2e_4bf0_81c5_4858d3de4537" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b8d82d87_584b_4923_a71f_4cedeb8017bf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b91feaae_7a6f_431a_b4b4_e849fd4142f2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b93ebee7_c198_4ce3_8359_3deff3de4cae" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b96a5e76_5ec1_4180_8d69_60d7d07e5d4e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b9737962_a8b7_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b992bb5a_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b99ddd2b_3b92_4c08_bec6_1b98489e5315" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b9a6ca15_d593_45f7_8374_a4f638df61fa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_b9a7418c_f92b_11e1_a0d4_12313d23d00b", :id => false, :force => true do |t|
    t.string "Date"
    t.string "Nominal area of sea ice"
    t.string "Nominal volume of sea ice"
    t.string "Nominal average thickness\r\n"
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

# Could not dump table "feature_data_b9e76eaa_b9fe_11e0_abbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_b9edcf76_6d80_11e1_8c8e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ba0e9454_741b_4ff4_8cf8_11addc89002d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ba317d0e_b22b_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ba346221_082d_4569_9de1_b2d23b74b434" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ba5b93db_126f_4a17_9d42_f781f2febdde" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ba964be5_9642_4ad7_9ad5_eafb6a07227e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bac22fcc_61cd_4f62_a97f_d2bd6a3c58ab" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bae753ec_071c_421b_b029_e52469b499a2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_baff331e_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bb3e0b89_1cd6_46db_874e_f2c8d4324589" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bb4ff2b6_3134_4488_adf5_2c1770c47e28" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bb7b5ee8_c246_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bbc0b482_5fa0_4e72_800e_6beacc019441" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bc587c7c_9093_49f0_a0a2_ab5c755ffc83" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bc775158_028c_46ee_8423_f6d2998877d5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bca39566_b960_4012_9537_71f46eeb267c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bcb80915_188e_4a59_b269_fed44573fa47" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_bcd6d55e_a9f1_11e1_bfe1_12313d23d00b", :primary_key => "gid", :force => true do |t|
    t.decimal "id",                       :precision => 10, :scale => 0
    t.decimal "gridcode",                 :precision => 10, :scale => 0
    t.decimal "basinid"
    t.string  "basinname", :limit => 254
  end

# Could not dump table "feature_data_bd1ec7f7_78bd_420f_9d70_3d057b6b7d9b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bd1fab10_b2eb_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bd3aab1f_c8df_4ec0_8026_7f1d6ceb8a1e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_bd64eea6_f92a_11e1_9d01_12313d23d00b", :id => false, :force => true do |t|
    t.string "Date"
    t.string "SOI"
    t.string "SOI-MA"
    t.string "Cook"
    t.string "Cook-MA"
    t.string "Fiji"
    t.string "Fiji-MA"
    t.string "FS-Micronesia"
    t.string "FS-Micronesia - MA"
    t.string "Kiribati"
    t.string "Kiribati-MA"
    t.string "Marshall Islands"
    t.string "Marshall Islands-MA"
    t.string "Nauru"
    t.string "Nauru-MA"
    t.string "Papua New Guinea"
    t.string "Papua New Guinea-MA"
    t.string "Samoa"
    t.string "Samoa-MA"
    t.string "Solomon Islands"
    t.string "Solomon Islands-MA"
    t.string "Tonga"
    t.string "Tonga-MA"
    t.string "Tuvalu"
    t.string "Tuvalu-MA"
    t.string "Vanuatu"
    t.string "Vanuatu-MA\r\n"
  end

# Could not dump table "feature_data_bde7b11b_2b04_4a5f_94a8_e564df5e4b4f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_be03877b_35d6_4fa0_b544_9eba9403d03e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_be038e3c_9c2a_40a4_b81a_49101dcb2b0a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_be05d78e_f366_4df8_bba2_8b39db371838" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_be10e90e_9797_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_be2717cb_918e_4de2_ae3b_39d26d83387e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_be305230_6d84_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_be6b8e60_e81c_4c08_a4d8_ec10cabd0b02" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_beb14a48_a33b_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_becfba3c_9e50_4df5_ae43_1fad3b428da5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bee66904_65c6_4866_aa2f_fd32842620e6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bef587c8_38d5_487d_8e88_a09a2ec7ba47" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bf89e320_4801_420b_afde_044559c9a0b3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bf8c3608_9754_453d_b999_e46ba80985df" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bf9df55f_31e9_4eea_97b4_05fa24955a39" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_bfca5d70_c1fe_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c0084839_c086_4f82_9741_e93578585c51" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c00e4428_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c021323a_d11e_45bb_8490_c1433d20ae26" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c02f7be4_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c06082d4_9849_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c084b550_84c4_4314_8dbd_e7d45255c40a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c08a309c_e2d2_49d9_8666_ae218b162e1d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c0a07572_9b7a_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c0b69358_6d79_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c0d3777a_6d83_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c0d6137f_1596_484d_9d42_e3deb9058e53" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c0d99ab1_dc96_4901_9a6a_46c670c68caf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c0f7adbc_6d37_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c112f542_c36c_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c165c6aa_79ae_4ed2_92b2_ecb94a3c8b03" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c1753fd8_1950_4bcf_84c1_ada5912b3b43" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c17a8389_7b29_4fbc_9a4e_5e0ba3e18df0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c17b34b6_cf62_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c19c9b17_3326_477c_8ab5_c813db948922" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c1c7f5b0_cf64_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c1e2f883_8b34_458f_881a_cb033a356be8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c1f986cc_96d2_11e0_963f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c205a8c6_baee_4b20_88d9_1a4232514ada" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c21ee7b8_c1e9_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c242a699_b33e_48a2_a0c6_ef8178415701" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c25d69f3_01af_4e43_8644_31068bebe28d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c291049e_51b3_4f74_8663_9e6c5f13acfe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c2ad268d_a821_40f2_8e88_46f254baddbe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c2cbe55b_2a35_4647_8c28_9f60de0e142d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c307396a_8327_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c31d8e5c_8bbc_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c324c1d8_5639_4f9a_90d4_c1a14b77f5b2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c3367bb4_f856_4e2d_9e5b_1fd3619c47fa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c33bacce_b188_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c36a608a_e6ba_4d8c_8232_411afbc4de2d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c372eabe_9760_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c375b3c1_a26d_44ed_b592_1c9e2b4c8f60" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c3980fb0_1d1a_48fd_b1cf_adb15e88b6c0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c3b993bb_6036_4da0_a523_b6b64c059f05" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c3c5106c_bd14_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c3c9090a_6911_4b3a_9cc7_65e2d21a14cd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c3d6aa2c_9765_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c409636c_fe64_4bd9_b1cd_d68bd01febdb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c419c2ba_a33d_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c42387d1_2b41_4c7c_aef9_445b9479719a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c43c2ecc_3025_4e96_ba88_20bd07f1d771" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c4407fa9_2d1c_4b7b_874c_df514fb5912c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c45c7820_bf7c_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c4869d94_df1f_4b00_ae16_d77cb6fc8315" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c4c3aaac_9837_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c4c89867_70e7_443d_bd93_08201ff2fb3f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_c505975e_d473_472a_bdf0_51effd5646e9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c5257139_6c34_4528_b118_a2ec2aa7ae05" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c54f764c_9947_11e1_aa1f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c5eed292_5dfc_4f54_aa3f_03deee80f986" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c622a9b7_d993_4521_a3a6_4e1db26ed24c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c670d960_c375_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c6a72d22_6d88_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c6cf43b4_8e6b_4d4a_ac78_fe9d3483724c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c706263e_4363_489a_bd29_3bf0dbaebb47" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c7206705_aace_415a_8c95_8e174dc8e473" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c775d0b5_92c7_4e1f_8e48_e7e0d81529f2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c7d9af72_8298_456c_8173_728bc2f7c73d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c806a104_4ab0_4eab_a8e6_23e29582223d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c852ef0e_b22a_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c85ebd30_9b7e_411a_a15b_3d7ab71dc78b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c8a670ef_85c4_4253_a629_21285b2428ba" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c90ab25d_3fc3_4aab_bebd_c96e807dab7f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c90e352e_9de9_402c_a495_dbfc3b60a9ea" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c9220105_7f0f_402c_a38c_a44fd2dac275" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c937ceac_8e71_4b4a_97b2_bbc0e3f332e0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c95bbbf2_9b7c_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c965318c_9df2_43b3_9ecb_a0199b112854" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c965cb7a_8bbd_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c99b051c_1d26_4be2_acbb_32d06d0078dd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c9b9119a_d666_43e4_8d9f_4d97e2d20274" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_c9d9418c_59e0_4c92_ba3b_f60ca0e1752d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ca164fec_dd81_4bc2_b9c5_4617c163e3f1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ca5610b8_68dc_4390_8afe_3221ea0dfaa9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ca7c6809_2544_4fbc_bad2_d18dd65f46d2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_caa503ec_c377_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_caf4f2e0_9770_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_caf593aa_0dfa_40f6_8cfd_8c5b201b3fa9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cb0f4457_b501_4b83_a381_5c3bdbf1c6f2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cb109783_9ee9_47ca_97d4_e7d872dbf3bc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cb7c9845_edae_4146_a39e_e6c6f84b8961" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cbceaf68_382d_47a0_8e14_994a3659be94" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cbd82356_984e_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cc07bac6_0a2d_4b3a_a79d_02f06cddba91" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cc4395ad_d0f0_430a_9d61_e1ebb177d535" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cc66fc8e_a21d_4878_a918_24c70eab3a20" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cc930712_c372_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cca86248_9838_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ccacceed_e0d4_46f2_9f73_81ae7dba04ee" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ccd2b776_fce5_4d3b_a839_394452e6fb30" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ccd2d053_2903_4a0a_909e_492c06c0ec6a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ccd4b838_b0de_11e1_a88e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ccd583d2_7d33_428f_9c93_c0a039698585" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cce70b3c_44d0_4271_b57b_930c6438b21d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cd026cbe_14ba_4cf4_ac21_e1371661ade8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cd11fe7e_2e6a_4fb5_927b_707fcf33a9f3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cd376667_a8a7_4f8e_8f64_82625dbc8387" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cd559cdc_1a5f_4d56_b6f4_d7b77ad1c6b2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cd7d11a2_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cd9b1fbd_4357_4526_ab16_ea527ce9c6d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cdbd21a2_a330_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cdca18de_9b75_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cdf7ab5a_a8b8_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce163d4a_3e9e_435b_a1a5_6e0a7194014b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce26f546_984a_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce479eb8_20ef_4569_9b68_4dbae9a0b983" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce5f1414_36e9_42a3_bbb9_5ddde8888b5e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce6734d7_50bf_4b1e_bef2_6203751d5d1c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce74a604_c376_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce76f143_29c4_46ff_b375_b535266804b8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce7fddac_a33d_11e0_8930_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce8e6689_ee2a_4010_adc4_2d73053f25bb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ce92d626_1727_41dc_ba11_29d9ab976b62" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ceaa7944_6d82_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cec7434e_48bd_4ab6_9645_4a1c832c078f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ceda4f66_495f_42bd_84a9_07570e4bcc21" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cee2b838_bf7f_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cef0d218_eaed_463b_b45e_9fd3a1f4245f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf253b89_6e22_4f95_9ff9_2d1ff30c18fb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf265099_edd0_4025_bfa4_2d8b54fcb19b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf34eb38_c247_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf393c97_8768_4c39_b933_0236b06e96cd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf415411_1f65_4658_9e49_638b13bf8410" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf52b14b_f09b_4390_83b1_8f4d3a628cf8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf799edd_2a18_4b95_a4d4_7b9ab5c7a47c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf8b4ef8_2bcb_48ad_81f9_4a32de621807" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cf8c1080_c363_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cfafc69f_9b4b_4d27_8f06_e5d3f1aa9961" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cfb81740_1f96_4ad4_99d6_16d31a4e19e9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cfc1afe0_c2b1_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_cfe8471b_d92b_4cab_bd31_52d197b4a547" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d013f4d5_90e1_4c3c_8ba9_8f42280160c3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d01834f5_881a_4532_a77d_37c1f8b69d67" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d052a136_e9aa_446f_b567_3021eb87ad5c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d063d835_6b03_4e83_bf63_48ec5ffa0bb3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d06bc201_a035_482a_88b2_01dbf9930603" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d08877e6_a67d_4184_abf9_5f395fb1306b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d0a2ad16_6d7d_11e1_8c8e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d0d6af3a_b239_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d0f8dd26_faef_4b0a_9876_69386398774c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d117cbdb_0700_4fa7_b5ab_ff25f1e2f344" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d16a648e_28cb_48b3_9a97_18f1ded56144" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d17d38c2_aa3b_4637_a9a9_542f38cad7ff" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d19c6bac_3a19_441a_b361_557d3802ddb2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d20518d6_c1ea_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d21e25f7_a50d_4888_953e_13cb5c1f1c81" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d24d2c3e_56f4_4723_bfde_29a125f4fa36" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d24f8e15_0129_4386_ba2d_bdd629f62fb9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d25b38b5_0717_49f7_8101_24ddde99cb15" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d296ee91_3dd7_432c_9522_80322b6ba351" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d2986d28_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d2b240fc_26e9_46d5_9a01_b274aecb249c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d2b30b04_8c33_4274_890c_ef60268ebbd9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d2c0ff46_391d_4e65_b910_e4303788b494" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d313b3a0_ec44_4d61_aa58_ad59c6d397e7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d321f2fb_6433_4d98_ae31_7b820891b83b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d357a069_870a_4699_b342_94f22ee7aabf" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d37ed4c6_a8b9_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d3e72b29_03af_4756_a706_5e38968253c0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d3eecc7d_7985_4f30_ac3d_84f0c0e26235" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d3eecf52_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d4165d05_2203_42ae_b356_9f646670eede" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d42fd34c_2526_4dc6_9100_b3b0597d784d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d4302a5a_5222_4794_8a68_532d331a79d6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d44cad54_975e_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d45aaa4a_6cbc_4416_a5e2_cf69653770a6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d46601cc_0924_45f8_94b6_26d4425012f6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d476e81a_9d29_4774_8934_be1e3246b7c7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d47ee463_fca2_46f2_811b_e4b8bf220bfe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d48fa03a_8329_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d4c016b6_b928_42bf_957b_94b78d78b50d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d5031593_318c_45f8_947a_7d3ccfd5cf24" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d57e491c_cbe6_42a7_91bc_201f4711d1fe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d5904a98_3d39_4acc_8451_12d70f8af2c0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d59e3bf9_6913_4dcb_b239_95100a2a6c38" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d5a7faa0_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d5ac04d4_975d_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d5c1000c_abe7_4ee8_b340_690a648618c4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d5c89be2_b217_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d5d6f29e_9b7b_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d6048cb8_832a_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d674102a_9c7c_4282_8905_3f8e68ab67d9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d6c6ed77_2f2e_482d_9c4d_9272f562cff8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d6d40f89_1879_4f81_993e_e15268e3e740" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d6dcd668_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d6eeafda_6d87_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d71b743e_b216_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d723b584_b76e_482c_a19d_d94990fbd2f7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_d72d98fa_c2ae_11e0_8141_12313b015271", :id => false, :force => true do |t|
    t.string "EarthTrends (http://earthtrends.wri.org) Searchable Database Results\r\n"
  end

# Could not dump table "feature_data_d75def74_b24a_4769_93b6_8a7d6187d5d1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d766057c_8326_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d773dfb3_7867_4435_872d_c101a157776f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d78c2b7a_a686_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d7b89b05_d9aa_4b11_a578_8c67ed26d88b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d868ce42_956a_4b45_a527_0857b1a7d352" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d8b77708_2d32_41d6_a1d8_401c35d272a2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d8b7b3ec_a8b7_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d8f73f1b_74de_4dac_b747_ac1a663f2b7b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d9071d36_9860_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d9186098_cf63_11e0_97af_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_d9601c8c_b6ce_40ad_8821_09fb9ab15ad7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d966082b_371e_45e5_8354_964ed5cf5538" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d98d0d2c_bd4e_438c_89e7_ba8c153e9a9e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d9a4687c_766f_4ec8_a7d2_694b77e4c6ca" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d9bcc92c_b22a_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_d9ff5f10_04af_4f24_a4a4_be01b1594642" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_da0187c0_c24b_4e17_97ca_cd1ed7be110e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_da296dd3_564e_4da8_83d3_2edd744c69ac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_da6a47e6_b2ed_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_da79e0e3_1e1e_41db_a5cb_b95c7ee250c6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_da86723e_c61f_45a2_a4c3_239063bf84f8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_da9a96f8_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_daa5480f_3777_4b0b_85c5_40764e37817f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dac1a27e_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_daffe7b5_4f21_473c_981e_1543b5d16143" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_db0f113e_b4ac_11e0_8cbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_db37f5be_4d7b_4ef8_a660_c6920a7b71d7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_db731c50_9766_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dbeb4e0a_58b7_477c_9ee7_548b51dc4c27" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dc38264a_9949_11e1_b861_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dc8ddc42_a34b_11e0_9b8a_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dca407db_3d01_4790_a2bb_79bf6e2e6da0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dcbf97c4_4fb2_4410_908b_5ba7f6fb40c7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dcc5bd98_3024_4b81_a91c_238c0083886f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dd63e15c_c308_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dd82ff6d_f672_4964_9332_66a9024dbf01" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dde38848_d2dd_4be4_8276_edb23ca75223" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dde50beb_e313_43ee_92bb_bb8843ebe7e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_de44c1c6_a32e_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_de4fb0be_6d63_4ef9_8140_5b3e6be58997" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_deaf416f_f406_4975_9e8e_890d45d328ea" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_deb3b317_6b3f_4894_bf48_2c7b2c1f8d67" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_debf56c0_230c_4eb3_8e26_ccc281bc35fb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dec6f540_ad5c_4be9_b006_bb6673121e75" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dee7df18_a8b6_11e0_bbbe_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_df276f39_18a8_4d3e_ae9b_58f4b0325510" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_df3f8460_985e_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_df48325e_9948_11e1_ba67_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_df690715_137b_4c3f_bcec_8faf6f6b51b7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_df7f2f7f_776c_4420_a97c_024f2627fcf6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dfbdad33_b897_445c_aab0_d31ff2338365" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dfcb13ec_c2b9_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dfd70dea_dd11_42c3_8a88_9ac660fbb738" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_dfdbfc6f_67e2_4b3a_86f8_7dc0a9efe1d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e01c63f6_9b53_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e09d5aa7_ded7_4ad1_9f2c_8b38485218ee" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e0b0759d_e1d7_4a40_b97c_4020df0d8cd5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e0d7727d_7337_4674_890d_dee8f43c84f3" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e0e9bff1_2350_4c86_8a9c_e23f3270696a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e0f7bb58_7da4_4f61_9863_744e65e5e65e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e144a44a_6d86_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e16a77f4_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e1a135f4_ba12_46b0_9c12_3a93d7f05af4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e1e1b0c9_9014_4844_b399_beea1dc1b158" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

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

# Could not dump table "feature_data_e2157528_35ea_47ed_ba51_6f49306e713f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e21bacb5_584a_419d_a330_0ac22ea7e076" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e228410d_8ba7_4329_9434_57c4232e8a55" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e2351f73_023c_49e6_8084_ca527f8d23cd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e2383efe_985f_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e239fb3e_51b8_47ea_8343_01b075859102" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e2603a9b_8ad5_4cd5_8cf5_791225e87766" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e27f66e9_2799_4d8d_9881_19beaac6241e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e28250cd_1f30_4ee8_a79e_24921fe7f085" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e289143c_b227_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e2b3ed6b_74e0_414d_90c9_f5737a9d5da1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e2bbbd4d_6d9b_478a_8ba7_1e8ca3003af8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e2d9237e_1d4e_4a70_88d2_64829beb499c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e34dfa7a_4623_4f3c_b46f_261d01cac3f0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e357a410_13e2_48d4_b55b_a8346a10f1a0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e37e012d_c1b9_43b8_b4a7_9c6860594c40" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e38ab4b4_d521_4016_a85c_383928e3b84b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e38e66cc_79e8_45d5_9bff_b64f6c295e07" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e3afb594_a339_4d1b_8b72_2a0b68066c76" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e40b935d_30ff_4968_9109_339046c171ba" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e41b6c72_f84f_11e1_8dc9_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e41cc36c_a335_11e0_ad0c_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4250bf1_25b3_47a5_9df8_d81054287b09" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4372928_96ba_11e0_8628_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e45da758_a32e_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e468addd_518b_4bba_bd9c_c8fbd7cef458" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e46a0bd4_9761_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4990c52_f421_4a55_8b08_826b8e8c8850" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4af896e_0338_4e08_aa2e_3ba5c5f2a1d0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4d45f42_b215_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4db0f28_ec42_47e4_b5b0_8cf9d4931cd2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4e92b0c_0095_4c07_9ff2_f9a5cf77af7a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e4ed300a_276d_4f69_a105_b77a685f8a89" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e53643b0_002b_49ce_abc3_ec0099a6a41d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e53b8820_9861_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e56befb8_9b74_11e0_a12b_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e584cb66_718a_4a4f_b028_96ef863f5222" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e5dcad93_56dd_4db5_aba6_efa3d7b7a3da" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e5ec7066_acc7_4f8b_8f8e_799f8beeadcd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e607dad7_519b_4ddb_889f_223f944f8704" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e609adb3_c52d_4198_b727_1e3387fe93e1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e61bdea9_0c99_4b14_9580_174bb5808fbb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e64897b6_e87a_4de1_8197_2358432f5aaa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e64f1482_819a_48fd_abc3_2d85c632269c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e66c3ead_4051_4dba_8c54_91a27798d6b5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e69ea0b2_9767_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e6af89f4_9087_11e0_b806_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e6c9d979_0c85_42e9_9bc5_aeabe4b77a7c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e6ce8c98_8ba8_4fb8_9eb4_db382089f5e8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e714ebd6_e55f_4b95_8bcb_ba39d3d62a76" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e76df46e_8328_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e771d89c_7bc4_4eab_a7d4_b3379b89ec0a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e7c4395f_fbfd_44c1_baa3_0fef2a52ed47" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e7fdbdb9_269f_42d7_83f6_334e4b7b8aaa" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e812d2d9_6343_4250_80c9_6943d9b19c03" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e84a0e9a_b23a_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e8583736_ee48_448c_9c36_881c9cdb77f5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e8833ed0_08f7_4869_983b_fac12ec8a497" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e8d5f7fe_2a0d_4562_88dc_5d397d7d5625" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e8dad180_41d8_4435_af9b_cb618231711a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e90a821f_cfd7_47f3_aad5_e7c82805a13d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e9157b8b_b70c_4027_94da_fd8c8271eba7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e91ffdcf_350d_44b0_af52_ab9713433a24" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e92107d7_f764_4c36_b634_8ebe60063bd6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e926d248_6d89_11e1_8c8e_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e95cefc2_1637_47cb_935d_5a601250d647" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e9873335_2dce_431c_ba01_fc05bc86072a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e988c91d_793e_4118_92f0_ce45992a155e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e993b810_c2ba_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e9b19cf3_9974_4412_88e1_60d0dc600372" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e9e0e666_14c3_4350_ab61_8fbd2db220fc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e9e6b502_2c14_4e71_85f4_35eb44da3cf7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e9e75498_54e1_45b7_947e_d7db07d47deb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_e9fc90fe_8bbc_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ea21312a_3831_407e_b5e3_8b9c2f5aa4b6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ea72c40c_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ea9ac06a_7540_4751_9282_f85e55d19206" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_eb22b85a_d58f_48e0_9d55_c149b0410a2d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_eb85d97e_6d81_11e1_88c1_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ebb3bb63_848c_46c6_9c85_9dbff8e232e1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ebbe2b5e_b228_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec08a954_057b_4701_8483_156767a1fb28" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec316fdc_c056_499e_9f5a_1a9759faf1a2" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec50124b_ee4f_4242_8ebe_a8f05c83d6a8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec66a1b2_c1e6_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec79656d_6d8b_4555_9c8d_6c700ea04c54" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec919c31_3d9e_4d6d_9654_2a489998a182" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec975206_c364_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ec98893f_6e7d_4d72_b1b0_18c52cedc9ce" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_eca170bb_21d9_4586_8d2e_cf820dd48d1b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ece6092e_9a2b_4cf3_abb4_7631d11fd53f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ece648b3_6bb8_4ffe_a128_c828f8470676" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ece93034_96d3_11e0_963f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ed380714_121a_4893_83fe_48a572ca9270" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ed70281e_5725_43be_b0a8_1f76f2bd3c8d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ed808000_f0fb_4ffc_bd39_7101f5a295b9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ed8fb7c0_8e59_4884_a422_a8a3be49982b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_edf9505c_c366_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ee00f4a6_4a8b_4e6c_b0dd_18e4d83ecc19" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ee0c7bb4_9b7a_11e0_bdac_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ee61743a_4884_4d41_8e26_d03c7f164762" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ee962d1d_2347_4a6e_b2a9_adbfaf22853b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_eeada919_141b_4dbc_92a0_ba33f78d4875" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_eec415d8_b9fe_11e0_abbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_eeced1d0_982f_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ef5b55b9_200a_473c_a695_8da05bccd376" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ef80a44b_9ad1_4495_bdc6_c25da40a23af" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_efab4c76_a9c1_4dd2_a654_e6c9c691ca68" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_efe8128f_82f0_49c3_85a4_70123dce74b1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_eff7c2a6_b238_11e0_a5fc_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f003ddf2_dcff_452f_835f_a9ee1fa8e58e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f01b89c0_9762_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f07b9d13_d2e4_456d_bb8b_fc71b4622aab" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f093171e_eb03_4466_a2fc_93f86af3892f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f095c80f_5a64_4430_be74_e32656729ffe" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f09a0cfa_c363_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f0ae1a46_fa21_4c2c_b24e_07d6b476009d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f0beada0_b49d_11e0_8cbf_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f0c030e8_5ded_4d72_9833_2261987c4196" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f0cde9d1_b450_43df_b5d0_e5cc8ac8afd4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f102f5b8_c367_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f160b00c_c1db_45af_86ec_86b4ef6d73b9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f17cb294_0af8_11e1_9dad_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_f1cacd92_bf82_11e0_ac4d_12313b015271", :id => false, :force => true do |t|
    t.string "FID\tPostal Code\tLatitude\tLongitude\tCity\tProvince\r\n"
  end

# Could not dump table "feature_data_f1ce89b5_2f76_4742_9b7b_5723cb07f6e7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f1ef8b80_2a5a_4c53_85da_2569492d8f4a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f1fe7b8e_9760_494c_8f6b_b8f8be881e21" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f2430bad_2367_4006_9656_bd323e4b645b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f26306fe_9839_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f28f3e8b_8568_4388_9711_80d3a5104708" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f298da04_9946_11e1_ac5a_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f2c15068_a3c1_4e8c_b4f1_e4fbe51c0850" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f2f441f9_a17b_47b2_8bd9_6030505a6940" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f30be97d_3ba5_485a_a896_093ce4a74b0e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f30dac40_fbd7_4405_8e5c_f4edb3eefdd9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f331bc53_3a55_4549_8888_21f9e7601bae" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f342739b_57b5_49d5_a20e_588aa2750995" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f3534cab_df00_438c_8cec_36ade5ffeb93" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f36f6ccc_242a_4aca_9fc1_56f9ec4c0ec6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f3c198ae_c245_11e0_8141_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f3e8b177_1408_4e8f_80a5_b3ad9ae1109b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f3ee0f82_8d61_47fb_8082_81546ef252ac" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f3f4a877_95db_4702_9555_3dd7716655fc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f3f7e73d_996b_47ce_b20c_dbcc4805a341" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f4065e52_9762_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f42db2c7_5002_4bf5_9cdc_8f7261dfc2e7" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f43a9324_b549_4c75_9ebc_efd60ab0a270" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f457fe35_f141_41c9_9aa8_117ec79c7405" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f4906e7b_5e16_4817_b875_c1f3eee6f269" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f4e73cc9_82cb_4cec_ad84_433ca452fc85" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f4f5f186_ae52_11e0_86f2_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f4fa3363_28d3_4d40_b24b_9a6aa476e5b0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5143445_ed51_4004_a4af_6c5f0dac097f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f541f3a2_afc7_40b5_80c5_f01e44ccad17" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f554450b_4cd5_41ae_b001_c09b6cdfbde1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5823a80_eacc_4c6d_97d1_6677768a6bfb" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f583b5f7_846c_4dd7_aa3d_42e78c5a5458" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f59bc972_9849_11e0_865f_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5bc1a27_5a93_47e3_8292_c6f7a9b20136" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5c30978_c30b_11e0_a2bb_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5cea65f_d7c2_4cd9_b1e8_d861dedbee43" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5e1d946_c028_4aff_a59c_be9bace26946" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5e559ca_eab3_4c95_89c0_194b9cbb85e9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5ea43af_bc5f_4148_80cf_e1b69d6fad2c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f5fac1ee_a529_41da_ac4d_b7b52512fbbd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f6132113_3ef2_48bc_9434_6e6d2e47104e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f6267a3d_6a6c_48c1_b996_cdce87379033" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f62c9794_9764_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f6306f39_b9a5_41d5_a62d_85306ea6de75" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f63612f6_2cb2_4e51_8bc0_fa91563dd133" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f67dfdab_093a_49e0_b4a7_11ad15b7c5fc" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_data_f695e756_c2ae_11e0_8141_12313b015271", :id => false, :force => true do |t|
    t.string "EarthTrends (http://earthtrends.wri.org) Searchable Database Results\r\n"
  end

# Could not dump table "feature_data_f6962ff7_e882_4d5a_be31_43aeecdc1461" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f69b4108_c36a_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f69f97e1_06d8_4b8c_9b73_41577cdbefda" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f6beac28_c375_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f6bee13e_6d7a_11e1_b86f_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f6d05d98_9ce1_11e0_a878_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f71dc545_fe5c_4211_b695_d406f5fe6e56" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f7343448_9797_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f73814fd_85e4_4797_902b_0aaa7b286224" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f7557bfc_c371_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f76446b9_3580_4ace_8149_148018624921" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f7aca172_36c5_4cd9_b3c0_79e348e84629" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f7bb7c0c_c36e_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f811e6b6_8bbd_11e0_ac3c_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f818fb75_9866_4a9a_9dae_89b8e4081731" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f8b2f110_c1ea_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f90f529e_2594_4baf_a34a_a3cba64c0841" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f98326c3_00bc_4c87_acbc_4287af650ec9" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f9959035_682b_4c33_afda_d21ca5bcc8da" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_f9a1241a_5092_4a2a_b661_be333c5fb07f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fa334908_db7d_49d0_91eb_55688dc23629" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fa37af64_9768_11e0_b23e_12313d0345e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fa3ee02a_48e3_477a_a20d_b1ad98d28ca6" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fa6917ae_e426_4ff5_b29f_08d9469be648" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fa78be97_3b7b_49fd_851c_20a62b0ca27e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fa7c5019_c13a_4047_9618_ff656b48d395" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fac94206_a5f7_4854_b409_93c2d41abac0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fadfaf3d_e5ae_4165_83d4_ee4544b3c2b5" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fb32967a_a336_11e0_ad0c_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fb606d2b_b7c2_47d8_b587_95ad6a7ea64d" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fb8fd7f6_8327_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fbe7a23f_60e8_4c1d_9fc9_1c4bb89c725c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fbe80cbb_1d6b_4522_b8e6_72ad00ad87dd" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fbf9ed92_7548_4869_8544_aaa6deba2c65" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fc1381bf_e3bd_45f1_afc3_49d2a57cd336" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fc2cd9ba_c365_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fcc9119f_257d_42b4_a894_12996139f02e" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fcce6b5f_431b_4813_90c8_578e95b53011" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd03461c_c1e9_11e0_ac4d_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd0397aa_a32d_11e0_9812_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd08b59d_7fe0_46ce_90a8_25056635c72a" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd22ff5f_a566_4bba_ad0d_9e211a0bfef1" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd2b70f6_c86b_4f10_98c0_d058cdad1830" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd5aafe0_ae82_4b3e_bb3c_adb761dd9e8c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd6724be_b8fe_4986_a19c_9f7e3ab3fd47" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fd968744_c71b_4442_b884_ddb6d78c3177" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fdb0fd72_4ea4_4e43_bec7_b79b0f25a730" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fdb666ca_4b25_46b5_8c01_d60e435d1e4f" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fdbc2106_1e68_4d0b_9111_ab2238ae7645" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fe4460ca_6dec_4b65_93fe_9b5d6e31e6e8" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fe5026a2_7d70_453e_9034_7c8567ae03e4" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fe691802_da7a_4864_aa45_26df8236d545" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fe7b496a_82f8_4ab5_a51d_45c11396101c" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fe7b7183_a63a_482e_85aa_64a4350a5821" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fe977b48_f52a_47b7_862a_35e48ec39c07" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_febc0842_c368_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fed912b3_dc9e_4920_8112_126a16921b11" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fef0969e_6d85_11e1_9db3_12313d23d00b" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_fef50086_867c_41a1_8079_60402fbffe17" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ff0f66be_832a_11e0_b535_12313d031ca0" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ff0fe395_e65a_4dbf_a01e_cc0030e7ac10" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ff2bef5d_1f90_4aff_a204_1aa4b6131224" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ff2e3e10_7f29_4a51_85a6_3f063a1f0cad" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ff48d8e2_984a_4477_b6c7_f9a5ba91ad03" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ff68488d_6562_479b_8acb_4806462bff42" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

# Could not dump table "feature_data_ffa259e0_c369_11e0_8388_12313b015271" because of following StandardError
#   Unknown type 'geometry' for column 'the_geom'

  create_table "feature_meta_contents", :force => true do |t|
    t.text     "dataset_uuid"
    t.text     "keywords"
    t.text     "source_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "coordinates"
    t.text     "bounding_box"
    t.text     "feature_types"
  end

  create_table "feature_meta_layers", :force => true do |t|
    t.integer  "feature_meta_content_id", :null => false
    t.string   "layer_id",                :null => false
    t.string   "name"
    t.text     "keywords"
    t.text     "coordinates"
    t.text     "bounding_box"
    t.text     "feature_period"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "feature_vocabulary", :force => true do |t|
    t.string   "dataset_uuid",           :null => false
    t.integer  "feature_field_position", :null => false
    t.integer  "term_id",                :null => false
    t.string   "term_source",            :null => false
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

  create_table "tool_compatibilities", :force => true do |t|
    t.string   "dataset_uuid",    :null => false
    t.string   "compatibilities", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_dataset_collections", :force => true do |t|
    t.integer  "user_id"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_reviews", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.string   "uuid",                      :null => false
    t.integer  "rating",     :default => 0
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_viewed_datasets", :force => true do |t|
    t.integer  "user_id"
    t.string   "uuid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabulator_sample_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabulator_speciations", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabulator_units", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vocabulator_variable_names", :force => true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
