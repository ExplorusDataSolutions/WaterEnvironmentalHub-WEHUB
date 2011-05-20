#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

ruby $DIRECTORY/do_import.rb > $DIRECTORY/do_import.log
mail -s "Geocens import log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_import.log
