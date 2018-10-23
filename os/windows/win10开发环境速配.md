# Win10 开发环境速配



## 装后必做

* cmd-runas.reg 右键“使用管理员运行cmd"
* cmd-win7.reg 右键终端for win7
* cmd-win10.reg 右键终端for win10
* win10-image-open.reg 右键自带图片浏览器打开图片
* copyto.reg, moveto.reg 右键菜单添加 "移动、复制到..."
* 取消休眠.cmd
* 自动登录.cmd
* 添加中文-美式键盘0804.reg



## 常用工具

* 添加 apps/bin 到环境变量 PATH

* runadm.exe, 管理员身份打开程序

  例： `runadm notepad 1.txt`

* edithosts.cmd, 打开hosts文件

* openhosts.py, 管理员权限打开 hosts文件

* composer组件


## Windows Defender 白名单

* 某情况需下载有威胁文件，会自动删除

- 添加白名单目录，如：`d:\safedir`
- Windows Defender设置=>病毒和威胁防护=>排除项=>添加或删除=>选择目录，即可



## Linux 子系统

- 参见 win10-linux子系统开发环境.md


## WebServer AMP速配

* 配置参见 centos-amp

* httpd/apache2.4, 下载地址：https://www.apachelounge.com/download/

  ```
  # 下载 httpd, mod_fcgid
  httpd.exe -k install [-n 服务名称]
  httpd.exe -k uninstall [-n 服务名称]
  如： httpd.exe -k install -n httpd
  # 启用、禁用服务
  net start httpd
  net stop httpd
  # 开机启用
  sc config httpd start= auto
  
  # 检查配置
  httpd.exe -t 
  ```

* mysql/mariadb

  ```
  # 安装、删除
  mysqld.exe --install [服务名称]
  mysqld.exe --remove [服务名称]
  # 服务启用、禁用、自启动，参见httpd
  ```

* php

  ```
  # for apache 下载线程安全版
  
  # php.conf for apache
  LoadModule php5_module d:/apps/server/php/php-5.6.34-Win32-VC11-x64/php5apache2_4.dll
  PHPIniDir d:/apps/server/php/php-5.6.34-Win32-VC11-x64/
  
  #LoadModule php7_module D:/apps/server/php/php-7.2.3-Win32-VC15-x64/php7apache2_4.dll
  #PHPIniDir D:/apps/server/php/php-7.2.3-Win32-VC15-x64
  
  AddType application/x-httpd-php .php
  AddType application/x-httpd-php .php3
  
  <IfModule dir_module>
      DirectoryIndex index.php index.html
  </IfModule>
  
  # 在httpd.conf 中添加:
  Include "php.conf"
  ```

* fcgid.conf for apache

  ```
  # http://httpd.apache.org/mod_fcgid/en/mod/mod_fcgid.html
  LoadModule fcgid_module modules/mod_fcgid.so
  
  AddType application/x-httpd-php .php
  
  FcgidInitialEnv PHP_FCGI_MAX_REQUESTS 1000
  FcgidMaxRequestsPerProcess 1000
  FcgidMaxProcesses 15
  FcgidIOTimeout  600
  FcgidIdleTimeout  600
  
  # 默认php-cgi
  FcgidInitialEnv PHPRC "D:/apps/server/php/php-7.2.7-nts-Win32-VC15-x64"
  FcgidWrapper "D:/apps/server/php/php-7.2.7-nts-Win32-VC15-x64/php-cgi.exe" .php
  FcgidMaxRequestLen 104857600
  
  # 全局使用php-cgi
  # AddHandler fcgid-script .php
  # AddType application/x-httpd-php .php
  
  
  # 联合php_module in vhosts:
  
  # 添加此行强制使用php-cgi:
  # AddHandler fcgid-script .php
  # Options ExecCGI # +ExecCgi 注意加号可能会报错
  # 可设置不同版本php
  # FcgidWrapper "D:/apps/server/php/php-7.2.7-nts-Win32-VC15-x64/php-cgi.exe" .php
  
  
  # 示例vhosts with fcgi:
  <VirtualHost *:80>
      ServerName baocms.pc
  	DocumentRoot "d:/web/www/php7"
  
      # 此为关键
      AddHandler fcgid-script .php
  
      <Directory "d:/web/www/php7">
  	# ExecCGI 不带加号
          Options Indexes FollowSymLinks ExecCGI
          AllowOverride All
          Require all granted
      </Directory>
  
  </VirtualHost>
  
  ```


