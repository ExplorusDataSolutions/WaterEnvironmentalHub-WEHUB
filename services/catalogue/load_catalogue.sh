#!/bin/bash
sudo service postgresql restart
rake db:drop
rake db:create 
rake db:migrate
rake db:fixtures:load MODEL=dataset
rake db:fixtures:load MODEL=dataset_group
rake db:fixtures:load MODEL=dataset_group_dataset
rake db:fixtures:load MODEL=feature_source
rake db:fixtures:load MODEL=feature_type
rake db:fixtures:load MODEL=user_dataset_collection
rake db:fixtures:load MODEL=user_viewed_dataset
createlang -U catalogue plpgsql catalogue_development
psql -U catalogue -d catalogue_development -f /usr/share/postgresql/8.4/contrib/postgis-1.5/postgis.sql
psql -U catalogue -d catalogue_development -f /usr/share/postgresql/8.4/contrib/postgis-1.5/spatial_ref_sys.sql
psql -U catalogue -d catalogue_development -f test/fixtures/feature_data_416ad2bc_04cf_41eb_9c9b_7e440c21673b.sql
psql -U catalogue -d catalogue_development -f test/fixtures/feature_data_ed8fb7c0_8e59_4884_a422_a8a3be49982b.sql
psql -U catalogue -d catalogue_development -f test/fixtures/feature_data_fe4460ca_6dec_4b65_93fe_9b5d6e31e6e8.sql
