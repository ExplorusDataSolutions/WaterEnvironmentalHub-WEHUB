#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

email_dir=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ -f $email_dir/do_load_email_addresses.sh ];
then
  email_addresses=$($email_dir/do_load_email_addresses.sh)
else
  email_addresses="adam.kahtava@tesera.com"
fi

dir=$(cd `dirname $1` && pwd)

script=$(basename $1)

logfile=${script/.sh/.log}

$($dir/$script > $dir/$logfile)
$(mail -s "Log for: $script `date`" $email_addresses < $dir/$logfile)
