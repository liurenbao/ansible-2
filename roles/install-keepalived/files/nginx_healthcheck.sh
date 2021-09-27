#!/bin/sh
if [ -z "`docker ps | grep 'nginx:' | grep 'Up' `" ]; then
  echo "exit 1"
  exit 1
fi