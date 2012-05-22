#!/bin/bash

cache="/../../apps/search/public"

script="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

objects=('index.html' 'catalogue/')

for i in "${objects[@]}"
do
  echo $(rm -rf $script$cache/$i)
done
