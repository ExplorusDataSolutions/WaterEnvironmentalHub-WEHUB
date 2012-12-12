#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

dir=$(cd `dirname $0` && pwd)

ruby $dir/do_refresh_feature_cache.rb
