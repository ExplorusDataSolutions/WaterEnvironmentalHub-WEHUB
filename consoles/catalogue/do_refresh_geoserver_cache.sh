#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

rsync -avz -e "ssh -i $HOME/.ssh/WE-GeoServer.openssh" ubuntu@ec2-184-73-111-158.compute-1.amazonaws.com:/projects/WEHub/consoles/geoserver/tmp/*.csv /projects/WEHub/apps/search/tmp/cache/geoserver/ > $DIRECTORY/do_refresh_geoserver_cache.log
mail -s "Catalogue geoserver cache transfer log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_refresh_geoserver_cache.log
