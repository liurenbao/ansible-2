#!/bin/sh
if [ -z "`ss -nltp | grep kube-apiserver | grep 6443 | grep LISTEN`" ]; then
  echo "exit 1"
  exit 1
fi