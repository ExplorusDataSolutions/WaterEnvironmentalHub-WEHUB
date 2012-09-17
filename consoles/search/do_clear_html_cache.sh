#!/bin/bash

cache="/../../apps/search/public"

script="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

objects=('index.html' 'catalogue/')

echo "Deleting HTML cache. Objects deleted:"
for i in "${objects[@]}"
do
  echo "$script$cache/$i"
  echo $(rm -rf $script$cache/$i)
done
