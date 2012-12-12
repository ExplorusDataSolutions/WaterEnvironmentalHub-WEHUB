!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

/etc/init.d/tomcat6 restart

sleep 5

ps aux | grep [t]omcat6
