## 步骤解析

> 先关闭防火墙，安装pptpd=>测试连接=>安装l2tpd/ipsec=>测试连接=>开启/设置防火墙=>测试=>设置转发=>测试=>完毕。

## 准备

* 关闭防火墙

* 检查内核是否支持tun/tap

  ```bash
  [root@jurlu ~]# cat /dev/ppp
  cat: /dev/ppp: No such device or address
  [root@jurlu ~]# cat /dev/net/tun
  cat: /dev/net/tun: File descriptor in bad state
  [root@jurlu ~]# modprobe ppp-compress-18 && echo ok
  ok
  ```



## 安装

```bash
yum install epel-release -y
yum install -y openswan ppp pptpd xl2tpd wget
```



## 配置

> 公网IP： 103.114.162.2 eth0
> l2tpd 网关(localip) 10.0.1.1	客户端： 10.0.1.100-10.0.1.199
> pptpd 网关(localip) 10.0.1.2	客户端： 10.0.1.200-10.0.1.254
> nat转发： 10.0.1.0/24 => eth0 [103.114.162.2]

* 系统设置,允许转发

  ```bash
  vim /etc/sysctl.conf
  net.ipv4.ip_forward = 1
  # for ipsec
  net.ipv4.conf.default.rp_filter = 0
  net.ipv4.conf.default.send_redirects = 0
  net.ipv4.conf.default.accept_redirects = 0
  
  sysctl -p
  ```

* 配置PPTPD (不建议使用, 数据包会被GFW分析并封禁服务器IP, 墙了IP,意味深重)

  ```bash
  vim /etc/pptpd.conf
  localip 10.0.1.2
  remoteip 10.0.1.200-254,10.0.1.100
  # localip是VPN连接成功后，VPN server（就是你启动pptpd服务）的地址
  # remoteip是指可分配给VPN client的地址或地址段
  
  vim /etc/ppp/options.pptpd:
  ms-dns 8.8.8.8
  ms-dns 8.8.4.4
  ```

* 配置PPP用户

  ``` bash
  vim /etc/ppp/chap-secrets
  # Secrets for authentication using CHAP
  # client        server  secret                  IP addresses
  ijiabao         pptpd   123456                  *
  ijiabao         l2tpd   123456                  *
  # 或者通配
  ijiabao * 123456 *
  ```

*  关掉防火墙，此时应该可以连接pptpd了，如果有问题，先解决，再做后面的

* 配置L2TP

  >  千万注意，此文件注释内容不要用#号，用分号，因此问题花了几个小时查错

  ```bash
  vim /etc/xl2tpd/xl2tpd.conf
  listen-addr = 103.114.162.2
  ;下行可选，默认是注释掉的
  ipsec saref = yes	
  [lns default]
  ip range = 10.0.1.100-10.0.1.199
  local ip = 10.0.1.1
  
  vim /etc/ppp/options.xl2tpd
  ms-dns 8.8.8.8
  ms-dns 8.8.4.4
  require-mschap-v2
  ```

* 配置 IPSEC

  ```bash
  # 在网上抄了一大篇，发现没用，保持默认就行，检查virtual_private有无IP段就行
  vim /etc/ipsec.conf
  config setup
          virtual_private=%v4:10.0.0.0/8,%v4:172.100.0.0/12,%v4:25.0.0.0/8,%v4:100.64.0.0/10,%v6:fd00::/8,%v6:fe80::/10
  
  # 设置预共享密钥(PSK)
  vim /etc/ipsec.secrets
  include /etc/ipsec.d/*.secrets
  103.114.162.2 %any: PSK "www.jurlu.com"
  ```

* 此时应该可以连接L2TP了

* 为防火墙添加端口服务

  ```bash
  vim /usr/lib/firewalld/services/pptpd.xml
  <?xml version="1.0" encoding="utf-8"?>
  <service>
    <short>pptpd</short>
    <description>PPTP</description>
    <port protocol="tcp" port="1723"/>
  </service>
  
  vim /usr/lib/firewalld/services/l2tpd.xml
  <?xml version="1.0" encoding="utf-8"?>
  <service>
    <short>l2tpd</short>
    <description>L2TP IPSec</description>
    <port protocol="udp" port="500"/>
    <port protocol="udp" port="4500"/>
    <port protocol="udp" port="1701"/>
  </service>
  
  # 添加服务端口（根据上述xml)
  firewall-cmd --permanent --add-service=pptpd
  firewall-cmd --permanent --add-service=l2tpd
  firewall-cmd --permanent --add-service=ipsec
  	或直接添加相应端口如： firewall-cmd --permanent --add-port=1723/tcp
  	查看端口： netstat -tunlp
  # 添加GRE，否则隧道失败
  firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -p gre -j ACCEPT
  ```

* 开启防火墙，此时应该可以连接vpn了(暂不可上网)，如果有问题，先解决

* Nat转发设置

  ```bash
  # 地址伪装：
  firewall-cmd --permanent --add-masquerade
  # 自动调整MTU-MSS
  firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -p tcp -i ppp+ -j TCPMSS --syn --set-mss 1356
  # 转发，多选一: (我选择第1个,注意eth[公网]和ppp地址) 1是Xen, 2是OpenVZ, 参见下文“参考”)
  firewall-cmd --permanent --direct --passthrough ipv4 -t nat POSTROUTING -o eth0 -j MASQUERADE -s 10.0.1.0/24
  firewall-cmd --permanent --direct --passthrough ipv4 -t nat POSTROUTING -s 10.0.1.0/24 -j SNAT --to-source VPS公网IP
  
  firewall-cmd --reload
  ```

* 开机服务

  ```bash
  systemctl enable pptpd ipsec xl2tpd
  systemctl restart pptpd ipsec xl2tpd
  ```



### 排错

> 所有配置尽量保持默认,在网上抄的不一定都能使用，改的越多，潜在的错误就越多

```
临时关闭SeLinux
setenforce 0

看服务是否正常运行：
systemctl status pptpd
systemctl status l2tpd
systemctl status ipsec

看ipsec有无错误
ipsec verify
看相关端口是否打开
netstat -tunlp
查mtu是否一致(连接vpn后）
ifconfig
```



## 一键安装脚本

> 初哥建议，但是如果出问题了很不好查问题
>
> wget https://git.io/vpnsetup-centos -O vpnsetup.sh
> nano -w vpnsetup.sh
> [Replace with your own values: YOUR_IPSEC_PSK, YOUR_USERNAME and YOUR_PASSWORD]
> sh vpnsetup.sh



## 参考

* 防火墙转发

  ```bash
  # 允许防火墙伪装IP：
  firewall-cmd --add-masquerade
  # 开启47及1723端口：
  firewall-cmd --permanent --zone=public --add-port=47/tcp
  firewall-cmd --permanent --zone=public --add-port=1723/tcp
  # 允许gre协议：
  firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -p gre -j ACCEPT
  firewall-cmd --permanent --direct --add-rule ipv4 filter OUTPUT 0 -p gre -j ACCEPT
  # 设置规则允许数据包由eth0和ppp+接口中进出
  firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i ppp+ -o eth0 -j ACCEPT
  firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -i eth0 -o ppp+ -j ACCEPT
  # 设置转发规则，从源地址发出的所有包都进行伪装，改变地址，由eth0发出：
  firewall-cmd --permanent --direct --passthrough ipv4 -t nat -I POSTROUTING -o eth0 -j MASQUERADE -s 192.168.0.0/24
  
  # 其它，端口映射：
  firewall-cmd --permanent --add-forward-port=port=1122:proto=tcp:toport=22:toaddr=192.168.100.3
  ```

* IPTABLE 转发

  ```bash
  # pptpd端口:
  iptables -I INPUT -p tcp --dport 1723 -j ACCEPT
  # l2tpd端口:
  iptables -I INPUT -p udp --dport 1701 -j ACCEPT
  iptables -I INPUT -p udp --dport 500 -j ACCEPT
  iptables -I INPUT -p udp --dport 4500 -j ACCEPT
  # GRE:
  iptables -I INPUT -p gre -j ACCEPT
  # 转发：
  # (1)XEN架构：
  iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o eth0 -j MASQUERADE
  # (2)OpenVZ架构：
  iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -j SNAT --to-source VPS公网IP  # VPS公网IP 要换成你服务器的IP 比如 119.24.40.64
  # 查看转发情况：
  iptables -t nat -L
  ```

* MTU

  > 常断线,可尝试

  ```bash
  # 设置ppp的MTU与主网卡一致, 先用ifconfig查看MTU
  /etc/ppp/ip-up, 在exit上一行加上
  /sbin/ifconfig $1 mtu 1500
  ```

* 其它配置参考

  ```bash
  # /etc/ipsec.conf
  config setup
          protostack=netkey
  		nat_traversal=yes
          virtual_private=%v4:10.0.0.0/8,%v4:172.100.0.0/12,%v4:25.0.0.0/8,%v4:100.64.0.0/10,%v6:fd00::/8,%v6:fe80::/10
  conn L2TP-PSK-NAT
      forceencaps=yes
      also=L2TP-PSK-noNAT
  conn L2TP-PSK-noNAT
      authby=secret
      pfs=no
      auto=add
      keyingtries=3
      rekey=no
      ikelifetime=8h
      keylife=1h
      type=transport
      left=103.114.162.2
      leftprotoport=17/1701
      right=%any
      rightprotoport=17/%any
  	
  # /etc/sysctl.conf
  net.ipv4.ip_forward = 1
  net.ipv4.conf.all.rp_filter = 0
  net.ipv4.conf.default.rp_filter = 0
  # net.ipv4.conf.$eth.rp_filter = 0
  net.ipv4.conf.all.send_redirects = 0
  net.ipv4.conf.default.send_redirects = 0
  net.ipv4.conf.all.accept_redirects = 0
  net.ipv4.conf.default.accept_redirects = 0
  ```
