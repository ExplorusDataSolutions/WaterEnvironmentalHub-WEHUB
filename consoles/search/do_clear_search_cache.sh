#!/bin/bash

base='http://localhost:80'
url='/search/refresh'

echo $(date)
echo $base$url
echo $(curl $base$url)
