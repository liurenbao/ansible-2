#!/bin/sh
if [ $(docker ps | grep goharbor | grep -c 'Up') != 9 ]; then
  echo "exit 1"
  exit 1
fi