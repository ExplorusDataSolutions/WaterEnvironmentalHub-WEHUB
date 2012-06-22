#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

email_addresses="adam.kahtava@tesera.com"

dir=$(cd `dirname $0` && pwd)

script=$(basename $1)

logfile=${script/.sh/.log}

$($dir/$script > $dir/$logfile)
$(mail -s "Log for: $script `date`" $email_addresses < $dir/$logfile)
