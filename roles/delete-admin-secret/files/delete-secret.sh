#!/bin/bash
kubectl get secret -A | grep admin-token | awk '{system("kubectl -n " $1 " delete secret " $2) }'