#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

./do_prime_search.sh > $DIRECTORY/do_prime_search.log
mail -s "Search priming log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_prime_search.log
