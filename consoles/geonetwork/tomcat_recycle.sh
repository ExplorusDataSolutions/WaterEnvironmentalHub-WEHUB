#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

ps aux | grep tomcat | grep -v grep | awk '{ print $2 }' | xargs kill -9 2> recycle.log
cd /usr/local/tomcat/bin/
./startup.sh > $DIRECTORY/recycle.log

mail -s "Geonetwork's tomcat recycled `date`" adam.kahtava@tesera.com < $DIRECTORY/recycle.log
