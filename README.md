## 事项

- [x] docker自动化安装脚本
- [x] ES自动化安装脚本
- [x] harbor自动化安装脚本
- [x] java环境自动化安装脚本
- [x] kafka自动化安装脚本
- [x] keepalived自动化安装脚本
- [x] Keeaplived check(含Nginx、k8s master、Harbor检查)脚本
- [x] K8S依赖RPM自动化安装脚本
- [x] K8S Master Init自动化脚本
- [x] K8S Worker Join自动化脚本
- [x] Nginx自动化安装脚本
- [x] Ravencast自动化安装脚本(4组)
- [x] Redis自动化安装脚本
- [x] Prometheus自动化部署脚本
- [x] Grafana自动化部署脚本
- [x] K8S组件(calico/traefik/metrics/dashboard)自动化部署脚本
- [x] Logstash/Kibana/Filebeat自动化部署脚本
- [x] rocketmq自动化安装脚本
- [x] K8S证书刷新自动化脚本
- [x] K8S定时备份自动化脚本
- [x] 组件安装自动生成访问地址脚本
- [x] 服务器DC标签(按机房给K8S节点打标签)脚本
- [x] K8S集群数据备份脚本（目前备份找不到文件）
- [x] K8S集群时区调整脚本
- [x] NAS服务器自动安装脚本
- [x] docker数据清理脚本
- [x] ES数据清理脚本
- [x] busybox部署
- [x] 外部节点监控
- [x] 外部节点进程监控
- [ ] openldap安装脚本
- [x] 禅道安装脚本
- [x] svn安装脚本
- [x] jenkins安装脚本
- [x] Redis指标
- [x] ELK指标
- [x] Rocketmq指标
- [x] VM基本信息指标
- [x] K8S监控指标
- [x] 数据库指标

# 安装前必读

> 此ansible为I中心IT基础环境自动搭建脚本，包含：
> - harbor
> - docker
> - k8s elfk prometheus grafana
> - nginx
> - kafka rocketmq ravencast
> - redis

## 注意事项

- 检查 [hosts](hosts) 文件
  - `harbor` 标记keepalived的主备
  - `k8s-master` 标记keepalived的主备
  - `nginx` 标记keepalived的主备
  - `rocketmq` 是否添加 broker_name
  - `ravencast` 变量是否修改
- 检查变量文件 [all.yml](group_vars/all.yml)
  - 检查各个`VIP`是否可用，`virtual_router_id`是否冲突
  - `harbor`密码
  - `es kafka ravencast redis` 的内存配置

# 安装后必读

- 检查各个组件是否创建成功
- 2个harbor的同步事件配置
- 导入grafana的dashboard