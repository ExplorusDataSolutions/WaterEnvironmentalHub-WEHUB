#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

ruby $DIRECTORY/do_refresh_feature_cache.rb > $DIRECTORY/do_refresh_feature_cache.log
mail -s "Geoserver geojson cache log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_refresh_feature_cache.log
