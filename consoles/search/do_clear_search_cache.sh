#!/bin/bash

base='http://localhost:3001'
url='/search/refresh'

echo $(date)
echo $base$url
echo $(curl $base$url)
