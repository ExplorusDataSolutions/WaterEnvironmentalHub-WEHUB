#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

ruby $DIRECTORY/do_import_external_service.rb geocens > $DIRECTORY/do_import_geocens.log
mail -s "Catalogue import log for Geocens services `date`" adam.kahtava@tesera.com < $DIRECTORY/do_import_geocens.log
