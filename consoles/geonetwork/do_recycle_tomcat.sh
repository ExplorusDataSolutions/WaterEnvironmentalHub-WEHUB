!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

sudo /etc/init.d/tomcat6 stop

sleep 5

pkill -f tomcat6

sudo /etc/init.d/tomcat6 start

sleep 5

ps aux | grep [t]omcat6
