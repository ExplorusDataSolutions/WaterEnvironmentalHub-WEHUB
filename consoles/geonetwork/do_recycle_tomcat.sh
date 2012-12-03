#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

/etc/init.d/geonetwork stop 

sleep 5

pkill -f tomcat.*catalina

/etc/init.d/geonetwork start 

sleep 5

ps aux | grep tomcat 
