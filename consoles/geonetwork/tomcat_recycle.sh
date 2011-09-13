#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

while pkill -f tomcat; do sleep 1; done

cd /usr/local/tomcat/bin/
./startup.sh > $DIRECTORY/recycle.log

mail -s "Geonetwork's tomcat recycled `date`" adam.kahtava@tesera.com < $DIRECTORY/recycle.log
