#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.profile

DIRECTORY=$(cd `dirname $0` && pwd)
mail -s "Geoserver import log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_import.log
