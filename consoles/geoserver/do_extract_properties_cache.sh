#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)
ruby $DIRECTORY/do_extract_properties_cache.rb > $DIRECTORY/do_extract_properties_cache.log
mail -s "Geoserver import log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_extract_properties_cache.log
