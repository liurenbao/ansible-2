#!/bin/zsh

tag="quay"
target_server=${2}
images=$(docker images | grep "${tag}")

for image in ${images[*]};
  do
    echo ${image} | awk '{print $1":"$2}';
  done;

