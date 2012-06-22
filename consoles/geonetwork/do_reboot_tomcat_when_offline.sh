#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

# adjust this to reflect tomcat home on your computer
TOMCAT_HOME=/usr/local/tomcat

if [ -f $TOMCAT_HOME/bin/tomcat.pid ]
then
  echo "PID file exists"
  pid="`cat $TOMCAT_HOME/bin/tomcat.pid`"
  running_pid="$(ps -p $pid -o pid=)"
  if [ "x$(ps -p $pid -o pid=)" != x ]
  then
    echo "Tomcat is running"
  else
    echo "Tomcat had crashed"
    $TOMCAT_HOME/bin/startup.sh
  fi
else
  echo "PID file does not exist. Restarting..."
  $TOMCAT_HOME/bin/startup.sh
fi

