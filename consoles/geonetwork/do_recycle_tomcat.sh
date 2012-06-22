#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

/usr/local/tomcat/bin/shutdown.sh -force 

sleep 5

pkill -f tomcat.*catalina

/usr/local/tomcat/bin/startup.sh 

sleep 5

ps aux | grep tomcat 
