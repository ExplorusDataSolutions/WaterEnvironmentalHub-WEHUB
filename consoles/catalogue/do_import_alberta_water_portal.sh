#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

dir=$(dirname $0)

ruby $dir/do_import_external_service.rb alberta_water_portal
