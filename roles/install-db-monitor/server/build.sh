#!/bin/sh
docker build . -t 192.168.160.47:8888/public/monitor-server:20211028-dev
docker push 192.168.160.47:8888/public/monitor-server:20211028-dev
docker rmi 192.168.160.47:8888/public/monitor-server:20211028-dev

kubectl apply -f deployment.yml -n monitoring
