#!/bin/bash
while [ 1 ]; do
  kubectl get pod -owide -n kube-system >> kube-system.txt
  echo "-------" >> kube-system.txt
  kubectl get pod -owide -n elk >> elk.txt
  echo "-------" >> elk.txt
  kubectl get pod -owide -n monitoring >> monitoring.txt
  echo "-------" >> monitoring.txt
  kubectl get pod -owide -n gaussdb-monitoring >> gaussdb-monitoring.txt
  echo "-------" >> gaussdb-monitoring.txt
  kubectl get pod -owide -n kubernetes-dashboard >> kubernetes-dashboard.txt
  echo "-------" >> kubernetes-dashboard.txt
  kubectl get pod -owide -n rocketmq >> rocketmq.txt
  echo "-------" >> rocketmq.txt
  kubectl get pod -owide -n test >> test.txt
  echo "-------" >> test.txt
  kubectl get pod -owide -n traefik >> traefik.txt
  echo "-------" >> traefik.txt
  sleep 2
done