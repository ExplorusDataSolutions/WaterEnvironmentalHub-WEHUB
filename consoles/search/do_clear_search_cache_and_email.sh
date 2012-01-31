#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

./do_clear_search_cache.sh > $DIRECTORY/do_clear_search_cache.log
mail -s "Search cache clearing log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_clear_search_cache.log
