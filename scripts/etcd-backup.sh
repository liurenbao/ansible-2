#!/usr/bin/env bash

suffix=$(date +%Y-%m-%d_%H:%M)
backup_path=/data01/backup

ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
snapshot save /data01/backup/etcd-snapshot-"$suffix".db
