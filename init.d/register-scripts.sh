#!/bin/bash

cp *-start.sh *-kill.sh /etc/init.d

ln -s /etc/init.d/postgres-start.sh /etc/rc0.d/S01postgres.sh
ln -s /etc/init.d/postgres-kill.sh /etc/rc6.d/K10postgres.sh

ln -s /etc/init.d/geonetwork-start.sh /etc/rc0.d/S02geonetwork.sh
ln -s /etc/init.d/geonetwork-kill.sh /etc/rc6.d/K09geonetwork.sh

ln -s /etc/init.d/geoserver-start.sh /etc/rc0.d/S02geoserver.sh
ln -s /etc/init.d/geoserver-kill.sh /etc/rc6.d/K09geoserver.sh

ln -s /etc/init.d/wehub-catalogue-start.sh /etc/rc0.d/S02wehub-catalogue.sh

ln -s /etc/init.d/wehub-enginey-start.sh /etc/rc0.d/S02wehub-enginey.sh

ln -s /etc/init.d/wehub-search-start.sh /etc/rc0.d/S02wehub-search.sh
