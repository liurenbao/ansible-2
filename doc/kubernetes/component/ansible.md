# 环境
- UAT环境FusionCompute地址
  https://192.168.161.59:8443/OmsPortal/index.html
- Pirun环境FusionCompute地址
  https://192.168.161.56:8443/OmsPortal/index.html

## Ansible安装各组件
- 以下文件和命令基于ansible根目录：/etc/ansible
```shell
ssh 192.168.160.50
cd /etc/ansible
```
### 文件列表
- 变量文件
  - global_vars/all-uat.yml
  - global_vars/all-pirun.yml
- 主机文件
  - uat-hosts
  - pirun-hosts

### 举例
- uat安装nginx
```shell
ansible-playbook -i uat-hosts -e @global_vars/all-uat.yml playbook/install-nginx.yml
```
- uat安装rocketmq
```shell
ansible-playbook -i uat-hosts -e @global_vars/all-uat.yml playbook/install-rocketmq.yml
```
- pirun安装nginx
```shell
ansible-playbook -i pirun-hosts -e @global_vars/all-pirun.yml playbook/install-nginx.yml
```
- pirun安装rocketmq
```shell
ansible-playbook -i pirun-hosts -e @global_vars/all-pirun.yml playbook/install-rocketmq.yml
```
### 手动维护
> 手动维护请参考以下文件内容，有启动命令，** 代表各组件，通过名称可以看出来，一般在文件靠后的位置
- roles/**/tasks/main.yml