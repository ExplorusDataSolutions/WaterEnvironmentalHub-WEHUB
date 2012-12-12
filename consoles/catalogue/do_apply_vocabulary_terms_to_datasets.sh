#!/bin/bash

[[ "`/usr/bin/tty`" == "not a tty" ]] && . ~/.bash_profile

dir=$(dirname $0)

ruby $dir/do_apply_vocabulary_terms_to_datasets.rb
