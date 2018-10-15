## WebServer速装

* 安装

  ```bash
  yum install httpd mariadb-server
  # php扩展很多，使用 php-* 通配, --exclude 表示除外(度娘根本查不到资料)
  yum install php-* --exclude php-mysql,php-devel
  
  systemctl enable httpd
  systemctl enable mariadb
  systemctl start httpd
  systemctl start mariadb
  
  mysql_secure_installation
  # 回车 输入两次密码 一路回车
  
  # 防火墙：
  firewall-cmd --permanent --add-service=http
  firewall-cmd --permanent --add-service=https
  firewall-cmd --reload
  
  # all done.
  ```

* PHP MCRYPT扩展库

  ```bash
  yum install php-devel
  
  # 安装: libmcrypt
  ./configure \
  	--prefix=/usr/ijiabao/libmcrypt-2.5.8	\
  	--libdir=/usr/ijiabao/libmcrypt-2.5.8/lib64	\	# 64位可选(如果是64位安装/usr则= /usr/lib64 必选)
  make && make install
  
  whereis php-config
  php-config: /usr/bin/php-config /usr/share/man/man1/php-config.1.gz
  
  
  cd php-5.4.16/ext/mcrypt
  phpize
  ./configure --with-php-config=/usr/bin/php-config --with-mcrypt=/usr/ijiabao/libmcrypt-2.5.8
  
  make
  make install
  
  echo 'extension=mcrypt.so' > /etc/php.d/mcrypt.ini
  ```

* MySQL字符集

  ```bash
  [mysqld]
  # 注意在mysqld下面
  # character_set_server = utf8
  character-set-server = utf8
  ```

* 多站点vhosts 示例

  ```bash
  # 文件: vhosts/_default, 最优先
  <VirtualHost *:80>
      DocumentRoot "/data/web/www"
      ServerName localhost
      <Directory "/data/web/www">
          Options indexes FollowSymLinks
          AllowOverride All
          #Order deny,allow
          #Allow from all
          Require all granted
      </Directory>
  </VirtualHost>
  
  # 文件: vhosts/foo/bar.conf
  <VirtualHost *:80>
      ServerName main.cms.com
  	DocumentRoot "d:/web/www/julucms/public/main"
      
      <Directory "d:/web/www/julucms/public/main">
          Options FollowSymLinks
          AllowOverride All
          Require all granted
      </Directory>
  	<FilesMatch "\.(ttf|ttc|otf|eot|woff|font.css)(\?.+)?$">
  	  <IfModule mod_headers.c>
  		Header set Access-Control-Allow-Origin "*"
  	  </IfModule>
  	</FilesMatch>
  </VirtualHost>
  
  # 文件 httpd.conf, 尾部增加
  Include vhosts/_default
  IncludeOptional vhosts/*.conf
  ```



## VSFTPD FTP Server

* 安装

  ```bash
  #安装vsftpd
  yum -y install vsftpd
  #启动
  systemctl start vsftpd
  #开启启动
  systemctl enable vsftpd
  # 防火墙
  firewall-cmd --zone=public --add-service=ftp [--permanent]
  firewall-cmd --reload
  ```

* 配置

  ```bash
  vim /etc/vsftpd/vsftpd.conf
  #禁止匿名用户anonymous登录
  anonymous_enable=NO
  #允许本地用户登录
  local_enable=YES
  #让登录的用户有写权限(上传，删除)
  write_enable=YES
  #默认umask
  local_umask=022
  #把传输记录的日志保存到/var/log/vsftpd.log
  xferlog_enable=YES
  xferlog_file=/var/log/vsftpd.log
  xferlog_std_format=NO
  #允许ASCII模式上传
  ascii_upload_enable=YES
  #允许ASCII模式下载
  ascii_download_enable=YES
  #使用20号端口传输数据
  connect_from_port_20=YES
  #欢迎标语
  ftpd_banner=Welcome to use my test ftp server.
  #接下来的三条配置很重要
  # chroot_local_user 设置了YES，那么所有的用户默认将被chroot，
  #也就用户目录被限制在了自己的home下，无法向上改变目录。
  # chroot_list_enable 设置了YES，即让chroot用户列表有效。
  #★超重要：如果 chroot_local_user 设置了YES，那么 chroot_list_file
  #设置的文件里，是不被chroot的用户(可以向上改变目录)
  #★超重要：如果 chroot_local_user 设置了NO，那么 chroot_list_file
  #设置的文件里，是被chroot的用户(无法向上改变目录)
  chroot_list_enable=YES
  #touch/etc/vsftpd/chroot_list新建
  chroot_list_file=/etc/vsftpd/chroot_list
  use_localtime=YES
  #以standalone模式在ipv4上运行
  listen=YES
  #PAM认证服务名，这里默认是vsftpd，在安装vsftpd的时候已经创建了这个pam文件，
  #在/etc/pam.d/vsftpd，根据这个pam文件里的设置，/etc/vsftpd/ftpusers
  #文件里的用户将禁止登录ftp服务器，比如root这样敏感的用户，所以你要禁止别的用户
  #登录的时候，也可以把该用户追加到/etc/vsftpd/ftpusers里。
  pam_service_name=vsftpd
  #重启vsftpd
  
  #### 用户配置
  
  #创建用户
  useradd -d /home/webapps/www.xxx.com -s/sbin/nologin -M hzh1990
  #设置用户到文件夹
  chown-R username /home/webapps/www.xxx.com/public
  #设置权限
  chown-R 777 /home/webapps/www.xxx.com/public
  #添加密码
  passwd hzh1990->密码->确认密码
  
  # 注:
  # chroot_local_user=YES, chroot_list_enable=NO 所有用户限制在Home目录，无法向上改变, 没有例外
  # chroo_local_user=NO, chroot_list_enable=NO, 所有用户都可以向上，没有例外
  # 必须去除主目录的写权限, 否则设置：allow_writeable_chroot=YES
  ```



### 防火墙相关

```bash
# 服务:
# httpd 未指定zone,应该是默认
firewall-cmd --add-service=http                    # (即时打开)
firewall-cmd --permanent --add-service=http 	# (最常用)
firewall-cmd --permanent --add-port=8443/tcp

# 设置永久打开(ijiabao)
firewall-cmd --zone=public --add-service=http --permanent
# 需要重置防火墙或临时打开
firewall-cmd --zone=public --add-service=http

# 设置默认接口区域,立即生效无需重启
firewall-cmd --set-default-zone=public


# 公共区，将vnc服务加入信任,临时生效, vnc服务包含一系列开放端口的定义,其它的常用服务类似,http https ssh
firewall-cmd --zone=public --add-service=vnc-server

# 添加服务:
vim /usr/lib/firewalld/services/svn.xml
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>SVN</short>
  <description>svn server</description>
  <port protocol="tcp" port="3690"/>
</service>
sudo firewall-cmd --permanent --add-service=svn

# 端口:
firewall-cmd --add-port=3690/tcp --permanent

# Rule及Nat转发 (VPN示例):
firewall-cmd --permanent --add-masquerade
firewall-cmd --permanent --direct --add-rule ipv4 filter INPUT 0 -p gre -j ACCEPT
firewall-cmd --permanent --direct --add-rule ipv4 filter FORWARD 0 -p tcp -i ppp+ -j TCPMSS --syn --set-mss 1356
firewall-cmd --permanent --direct --passthrough ipv4 -t nat POSTROUTING -o eth0 -j MASQUERADE -s 10.0.1.0/24
firewall-cmd --permanent --direct --passthrough ipv4 -t nat POSTROUTING -s 10.0.1.0/24 -j SNAT --to-source VPS公网IP


# 已配置的相关文件(可以直接改):
/etc/firewalld/*
/etc/firewalld/zones/{zone}.xml

# GUI可以直接用 firewall-config，更直观


# 显示状态：$ firewall-cmd --state
# 查看区域信息: $ firewall-cmd --get-active-zones
# 查看指定接口所属区域：$ firewall-cmd --get-zone-of-interface=eth0
# 拒绝所有包：# firewall-cmd --panic-on
# 取消拒绝状态：# firewall-cmd --panic-off
# 查看是否拒绝：$ firewall-cmd --query-panic
# 更新防火墙规则：# firewall-cmd --reload
```



### SELinux相关

```bash
# 遇到问题先关闭Selinux，如果问题依旧，则不是Selinux的问题
getsebool -a |grep httpd

# 允许网络连接db,否则无法连接mysql
setsebool -P httpd_can_network_connect_db on

# 启动httpd时, 错误卡在httpd.conf: LoadModule php_module 时
# 错误信息:Syntax error on line 57 of /etc/httpd/conf/httpd.conf: Cannot load /usr/lib/httpd/modules/libphp5.so into server: /usr/lib/httpd/modules/libphp5.so: cannot restore segment prot after reloc: Permission denied
# httpd_modules_t => textrel_shlib_t
chcon -t textrel_shlib_t /etc/httpd/modules/libphp5.so


SELinux policy enabled; httpd running as context system_u:system_r:httpd_t:s0
setsebool -P httpd_use_nfs 1
setsebool -P httpd_enable_homedirs 1

# setsebool -P httpd_read_user_content 1
setsebool -P httpd_execmem 1 ?

setsebool -P httpd_mod_auth_pam 1
httpd_mod_auth_pam --> off


# http无法访问某目录
chcon -Rv -t httpd_sys_content_t 目录名
# 标签示例:
[root@localhost ~]# ls -Z /var/www/html/
drwxr-xr-x. root root unconfined_u:object_r:httpd_sys_content_t:s0 laravel5
-rw-r--r--. root root unconfined_u:object_r:httpd_sys_content_t:s0 phpinfo.php
drwxr-xr-x. root root unconfined_u:object_r:httpd_sys_content_t:s0 phpmyadmin4.1.14

# 无法上传, 除修改目录777权限外,还需修改目录安全标签为 httpd_sys_rw_content_t
chcon -Rv -t httpd_sys_rw_content_t 目录名

# 开启端口
安装semanage命令
yum install policycoreutils-python

# 查看端口：
	semanage prot -l
# 添加端口策略：
semanage port -a -t http_port_t -p tcp 88
ValueError: 已定义端口 tcp/88:
# 修改端口策略：
semanage port -m -t http_port_t -p tcp 88

# 添加8000端口
semanage port -a -t http_port_t -p tcp 8000


# allow httpd to execmem:
setsebool -P httpd_execmem 1

# 设置目录/文件的默认属性方式:
semanage fcontext -a -t textrel_shlib_t '/usr/ijiabao/libmcrypt-2.5.8/lib/libmcrypt.so.4.4.8'
restorecon -v '/usr/ijiabao/libmcrypt-2.5.8/lib/libmcrypt.so.4.4.8'

# 允许vhost绑定端口
semanage port -a -t http_port_t -p tcp 8888
# 允许防火墙通过此端口
firewall-cmd --zone=public --add-port=8888/tcp --permanent
```



## SVN Server 安装

```bash
# svn-server:
yum install subversion
# vim /etc/sysconfig/svnserve
# svnserve 修改启动参数
OPTIONS="-r /data/svn"

# 启动:
systemctl start svnserve
# 停止:
systemctl stop svnserve
# 自启动:
systemctl enable svnserve

# 防火墙端口:3690
sudo firewall-cmd --permanent --add-port=3690/tcp
```



### VNC+SSH, 远程桌面

* 服务器端

  ```bash
  # 安装
  yum install tigervnc-server
  # 拷贝配置文件
  cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
  # 修改配置, 将<user>换成相应的user, 不建议使用ROOT用户
  # 设置密码：
  vncpasswd
  # 启动服务：
  	systemctl start vncserver@:1
  # 查看端口：
  	netstat -lnt | grep 590*
  
  # 临时开启防火墙
  firewall-cmd --zone=public --add-service=vnc-server
  # 永久开启：
  firewall-cmd --zone=public --add-service=vnc-server --permanent
  
  # 启动服务
  systemctl start vncserver@:1
  # 开机自启动(不需要,占大量内存，降低安全性)：
  systemctl enable vncserver@:1
  
  # selinux 端口
  semanage port -l | grep vnc
  
  #　用vncviewer64-1.6.90.exe 测试连接远程桌面,地址为：baodev.cn:1
  ```

* 使用VNC Server 透过SSH进行安全连接

  >仔细看配置文件里的英文说明，比在度娘找到的[正确]答案快几百倍

  ```bash
  # 修改配置两行,Root用户, 使VNCServer只侦听本地端口 localhost:5901 (127.0.0.1:5901)
  # 只侦听本地端口,防火墙对此端口不开发,保证安全
  vim /lib/systemd/system/vncserver@\:1.service
  ExecStart=/usr/bin/vncserver -nolisten tcp -nohttpd -localhost %i
  PIDFile=/root/.vnc/%H%i.pid
  # 然后 systemctl start vncserver@:1 开启服务(平时不开启，省内存，提高安全性）
  ```

* 客户端SSH配置

  ```bash
  # windows-xshell配置：
  # SSH连主机不变
  # SSH: root@baodev.cn(阿里云)
  # 端口：22
  
  # 添加隧道：
  # 类型：local(Outgoing)
  # 源主机：baodev.cn(阿里云)
  # 侦听端口：5901
  
  # 目标主机：localhost
  # 目标端口：5901
  
  # 使用过程：
    1. 用xshell SSH+VNC模式连接服务器，此时可以进行远程终端的所有操作
    2. 需要VNC时，在终端运行 systemctl start vncserver@:1, 开启VNC服务
    3. 用vncviewer64-1.6.90.exe 连接远程桌面，连接地址为 localhost:1 [此时会通过SSH加密,转发到baodev.cn:1]
    4.在终端运行 systemctl stop vncserver@:1　关闭VNC
  
  ## MaxOS 配置：
  # 使用 SSL 连接远程，并附加一个隧道
  	ssh -L <local port>:<remote host>:<remote port> <SSH hostname>
  1: 连接远程 SSH，并添加一个隧道转发	<将远程主机上的localhost:5901转发到本地的5901端口>
  ssh -L 5901:localhost:5901 root@baodev.cn
  2：打开服务器上的VNC服务,同上
  	systemctl start vncserver@:1
  3. 用Mac版的vncviewer连接,连接地址localhost:1，同上
  4. 关闭vncserver同上
  ```


