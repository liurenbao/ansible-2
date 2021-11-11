#!/bin/sh

docker build . -t 192.168.160.47:8888/public/uoamp:20211028-dev
docker push 192.168.160.47:8888/public/uoamp:20211028-dev
docker rmi 192.168.160.47:8888/public/uoamp:20211028-dev

kubectl set image deployment/uoamp uoamp=192.168.160.47:8888/public/uoamp:20211028-dev -n monitoring
kubectl rollout restart deployment/uoamp -n monitoring
kubectl rollout status deployment/uoamp -n monitoring
