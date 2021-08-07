#!/bin/bash
  dir=`ls /k8s_images/`
  for i in $dir
  do
    ipath=`docker load < /k8s_images/$i | awk '{print $3}'`
    docker tag ${ipath} `echo ${ipath/192.168.160.35:8087/192.168.85.30:8888}`
    docker push `echo ${ipath/192.168.160.35:8087/192.168.85.30:8888}`
  done
