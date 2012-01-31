#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

ruby $DIRECTORY/do_import_external_service.rb water_cloud > $DIRECTORY/do_import_water_cloud.log
mail -s "Catalogue import log for Water Cloud services `date`" adam.kahtava@tesera.com < $DIRECTORY/do_import_water_cloud.log
