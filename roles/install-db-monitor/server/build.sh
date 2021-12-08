#!/bin/sh
docker build . -t 10.12.107.150:80/public/monitor-server:20211207-dev
docker pull 10.12.107.150:80/public/monitor-server:20211207-dev
docker rmi 10.12.107.150:80/public/monitor-server:20211207-dev

kubectl apply -f deployment.yml -n gaussdb-monitoring
