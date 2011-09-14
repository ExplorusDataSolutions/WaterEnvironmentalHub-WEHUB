#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

/usr/local/tomcat/bin/shutdown.sh > $DIRECTORY/recycle.log

sleep 5

pkill -f tomcat.*catalina

/usr/local/tomcat/bin/startup.sh >> $DIRECTORY/recycle.log

sleep 5

ps aux | grep tomcat >> $DIRECTORY/recycle.log

mail -s "Geonetwork's tomcat recycled `date`" adam.kahtava@tesera.com < $DIRECTORY/recycle.log
