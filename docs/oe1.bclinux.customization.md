---
created: 2023-04-17
intention: |-
  random thoughts.
title: 移动云能欧拉操作系统虚拟机需求
author: 罗潇
date: 2023-04-27
share: true
---

### redis弱密码问题修复
修改 dsmp/common/redis/redis.conf
![[media/Pasted image 20230419110112.png]]

修改 tip.sh
![[media/Pasted image 20230419110211.png]]


### 适配端口
#### 问题描述
443, 80, 22等端口安全组限制

#### dsmp 443 web访问端口修改
修改nginx的配置 `dsmp/common/nginx/lib/server_443.conf`
![[media/Pasted image 20230417180008.png]]

修改tip.sh脚本中traefix prefix环境变量.
![[media/Pasted image 20230417180120.png]]

#### ssh 22
修改 /etc/ssh/sshd_config
![[media/Pasted image 20230427135802.png]]

```
# 重启ssh服务
systemctl restart sshd
```

### 证书签名
#### 问题描述
虚拟机运行环境ip未知, 用户直接通过ip访问. 安装阶段签名证书的CN和别名与实际使用对不上.

#### 解决办法
虚拟机启动阶段重签.
修改 /etc/rc.local
```
(cd /data/dsmp/bin/conf/cert_ssh && bash -c /data/dsmp/bin/conf/cert_ssh/sign.sh)
```

修改sign.sh脚本, 遍历所有物理网卡的所有ipv4, 写入证书的别名.
![[media/Pasted image 20230427134906.png]]


### 使用DHCP协议配置ip, gateway, netmasking, dns
#### 问题描述
移动云环境通过DHCP协议配置网络信息, 虚拟机制作阶段使用的静态ip.

#### 解决办法
修改 /etc/rc.local, 增加命令`dhclient`

### 压缩镜像
#### 问题描述

```Bash
# 原命令无法正常压缩镜像, 产出的镜像非常大
qemu-img convert -O qcow2 -c [INPUT] [OUTPUT]
```

#### 解决办法
```Bash
# zerofill, 正常压缩
virt-spacify --compress [INPUT] [OUTPUT]
```

### 登录提示
#### 问题描述
云能运维人员要求ssh登录后看到版本信息

#### 解决办法
编辑 /etc/motd, 增加版本提示.


%%### openssh升级版本
从源码编译安装
覆盖替换即可.
注意升级版本后的配置文件, 有个坑
root用户在升级后默认不让通过密码登录. 而升级前可能默认允许密码登录. 需要更改配置.
编辑/etc/ssh/sshd_config
![[media/Pasted image 20230420151107.png]]
编辑sshd-service配置
```shell
systemctl restart sshd
```
%%