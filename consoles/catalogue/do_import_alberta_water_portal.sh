#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

ruby $DIRECTORY/do_import_external_service.rb alberta_water_portal > $DIRECTORY/alberta_water_portal.log
mail -s "Catalogue import log for Alberta Water Portal services `date`" adam.kahtava@tesera.com < $DIRECTORY/alberta_water_portal.log
