#!/bin/sh
docker build . -t 10.12.107.150:80/public/monitor-server:20211125-dev
docker push 10.12.107.150:80/public/monitor-server:20211125-dev
docker rmi 10.12.107.150:80/public/monitor-server:20211125-dev

kubectl apply -f deployment.yml -n gaussdb-monitoring
