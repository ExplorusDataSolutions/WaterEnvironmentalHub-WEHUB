#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

# adjust this to reflect tomcat home on your computer
TOMCAT_PID=/var/run/tomcat6.pid
TOMCAT_HOME=/usr/local/tomcat

if [ -f $TOMCAT_PID ]
then
  echo "PID file exists"
  pid="`cat $TOMCAT_PID`"
  running_pid="$(ps -p $pid -o pid=)"
  if [ "x$(ps -p $pid -o pid=)" != x ]
  then
    echo "Tomcat is running"
  else
    echo "Tomcat had crashed"
    sudo /etc/init.d/tomcat6 start
  fi
else
  echo "PID file does not exist. Restarting..."
  sudo /etc/init.d/tomcat6 start
fi

