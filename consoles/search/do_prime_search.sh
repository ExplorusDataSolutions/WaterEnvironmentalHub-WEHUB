#!/bin/bash

base='http://localhost'

urls=('' '/api/datasets?feature_type_id=1&format=html' '/api/datasets?feature_type_id=4&format=html' '/twitter/index?format=json')

urls_push() {
  urls=("${urls[@]}" "$1")
}

for i in {1..10}
do
  urls_push '/catalogue/browse?page='$i
  urls_push '/search?page='$i
done

echo $(date)
for i in "${urls[@]}"
do
  echo $base$i
  echo $(curl -IL $base$i)
done
