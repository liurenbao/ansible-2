# 崩溃2个ETCD节点后的恢复方法

## 备份健康节点到etcd数据

```shell
cp -r /var/lib/etcd /backup/etcd
```

## 下载etcd软件包，用备份到数据启动，并把数据备份出来

```shell
./etcd --force-new-cluster --data-dir /backup/etcd
ETCDCTL_API=3 etcdctl --endpoints=http://127.0.0.1:2379 snapshot save /backup/etcd.db

```

## 重置原来的集群的一个节点

```shell
kubeadm reset -f
rm -rf /var/lib/etcd /var/lib/dockershim  /var/run/kubernetes /var/lib/cni /etc/cni/net.d ~/.kube /etc/kubernetes /var/lib/cni/ /var/run/calico /var/lib/calico /etc/cni/net.d /var/log/calico
```

## init重置的节点，并将数据还原回去

```shell

kubeadm init --pod-network-cidr 10.244.0.0/16 --control-plane-endpoint=192.168.160.55:6443 --image-repository=192.168.160.47:8888/google_containers --kubernetes-version=1.18.19 --upload-certs

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

ETCDCTL_API=3 etcdutl snapshot restore /backup/etcd.db --data-dir=/var/lib/etcd --initial-advertise-peer-urls=https://192.168.160.48:2380 --initial-cluster=k8s-master-test-1=https://192.168.160.48:2380 --name=k8s-master-test-1 --skip-hash-check

```
kubeadm init phase upload-certs --upload-certs
kubeadm join 192.168.160.55:6443 --token nlcxwa.uxyngp64ebfjmx3r     --discovery-token-ca-cert-hash sha256: c4df1cfdfe26f50d554155ae94c459e9c54f2580824190a539b722cb560df471

--control-plane --certificate-key d36b5bbcf805d02f66f8a32c16f93ead3662e0c9a7f5e9ca35a1c59b2d28803e
kubeadm join 192.168.160.56:6443 --token w2l7vy.71nncpmi3mcrdk43 --discovery-token-ca-cert-hash sha256:b22ba8c34d478cc6b6b5bd1a99680bffa47cbfc19047105b2afdeaf4aebf2a66 \


## 修改集群配置信息和证书，使新集群信息和恢复后的etcd数据匹配

```shell
base64_encoded_ca="$(base64 -w0 /etc/kubernetes/pki/ca.crt)"

kubectl get cm/cluster-info --namespace kube-public -o yaml | \
/bin/sed "s/\(certificate-authority-data:\).*/\1 ${base64_encoded_ca}/" | \
kubectl apply -f -

```

## 重启新集群k8s的etcd容器

## 查看集群数据，已恢复