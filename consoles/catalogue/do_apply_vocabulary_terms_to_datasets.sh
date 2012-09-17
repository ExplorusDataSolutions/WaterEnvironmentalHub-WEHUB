#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

DIRECTORY=$(cd `dirname $0` && pwd)

ruby $DIRECTORY/do_apply_vocabulary_terms_to_datasets.rb > $DIRECTORY/do_apply_vocabulary_terms_to_datasets.log
mail -s "Catalogue vocabulator log `date`" adam.kahtava@tesera.com < $DIRECTORY/do_apply_vocabulary_terms_to_datasets.log
