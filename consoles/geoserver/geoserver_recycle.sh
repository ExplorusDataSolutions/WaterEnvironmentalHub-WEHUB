#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

/geoserver/geoserver-2.0.2/bin/shutdown.sh > $DIRECTORY/recycle.log &

sleep 5

/geoserver/geoserver-2.0.2/bin/startup.sh > $DIRECTORY/recycle.log &

sleep 5

ps aux | grep [g]eoserver >> $DIRECTORY/recycle.log &

mail -s "Geoserver recycled `date`" adam.kahtava@tesera.com < $DIRECTORY/recycle.log

