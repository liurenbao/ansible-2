# back up
backup_dir=/data01/etcd/backup
ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
snapshot save $backup_dir/etcd-snapshot-$(date +%Y%m%d).db

# remove old
find $backup_dir -mtime +7


