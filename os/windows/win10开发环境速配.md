## Linux子系统速配(Ubuntu)

* 安装， 以root做为默认用户，进入终端添加新用户：

  ```bash
  useradd -m -r ijiabao
  passwd ijiabao
  ```

* sudo免密

  ```bash
  # 必须使用root用户，修改 /etc/sudoers
  ijiabao ALL=(ALL:ALL) NOPASSWD:ALL
  ```

* 设置默认登录用户

  ```bash
  # 在CMD命令行下。 ubuntu可能为ubuntu1803,根据安装的子系统名称。具体参见appStore的帮助页面。
  ubuntu config --default-user ijiabao
  ```

* 开机启用：

  ```
  # 创建 wsl.vbs
  Set ws = CreateObject("Wscript.Shell")
  ws.run "bash /usr/anyesu/boot.sh",vbhide
  # 设置计划任务，开机时运行此wsl.vbs
  ```

* 速配

  ```bash
  # 更新
  sudo apt upgrade
  # 语言
  apt-get install language-pack-zh-hans
  sudo dpkg-reconfigure locales
  # 字体包
  sudo apt install fonts-wqy-*
  sudo apt install ttf-wqy-*
  sudo apt install xfonts-wqy
  # for 1804-LTS, 包名
  fonts-wqy-microhei - Sans-serif style CJK font derived from Droid
  fonts-wqy-zenhei - "WenQuanYi Zen Hei" A Hei-Ti Style (sans-serif) Chinese font
  xfonts-wqy - WenQuanYi Bitmap Song CJK font for X
  
  # php
  sudo add-apt-repository ppa:ondrej/php
  sudo apt-get update
  # 5.6示例：(除php5.6-dev不安装)
  sudo apt install libapache2-mod-php5.6 php5.6-cgi php5.6-fpm php5.6-cli php5.6-common php5.6-gd php5.6-mbstring php5.6-curl php5.6-mysql php5.6-mcrypt php5.6-xmlrpc php5.6-xml php5.6-zip php5.6-opcache php5.6-phpdbg php5.6-imap php5.6-intl php5.6-ldap php5.6-pgsql php5.6-pspell php5.6-recode php5.6-snmp php5.6-sqlite3 php5.6-sybase php5.6-tidy php5.6-json php5.6-bz2 php5.6-odbc php5.6-readline php5.6-interbase php5.6-enchant php5.6-gmp php5.6-xsl php5.6-bcmath php5.6-soap php5.6-dba libphp5.6-embed
  # 收集所有php5.6的包名称
  apt-cache search php | grep 5.6 > php56.txt
  subl php56.txt, 正则替换 (.*?\s+)[^\n]+\n => $1 
  # php7参照上述方法
  
  # apache 使用 apache2包
  sudo apt install -y apache2
  # mysql 使用 mariadb-server 包
  sudo apt install -y mariadb-server
  
  # 切换php版本
  update-alternatives --config php
  
  # 切换php for apache版本
  sudo a2dismod php7.2	// disable
  sudo a2enmod php5.6		// enable
  
  # 切换apache模块
  sudo a2enmod rewrite
  sudo a2dismod rewrite
  
  # apache 警告APR_TCP_DEFER_ACCEP
  # 修改 httpd.conf
  AcceptFilter http none
  
  # composer
  sudo apt install composer
  
  # svn
  sudo apt install subversion
  
  # python
  sudo apt install python 为2.7
  sudo apt install python3 为3.6
  # 3.7
  sudo add-apt-repository ppa:jonathonf/python-3.7
  # 版本管理
  sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
  sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
  
  # gui
  # 安装 windows VcXsrv
  vim /etc/profile
  export DISPLAY=:0.0
  
  # sublime text, 配置系统（windows无法访问的文件), 无法输入中文
  # 下载tar to /opt/sublime
  # 须安装：
  apt install libgtk2.0-0
  
  # 使用 sublime_text.exe 
  ln -sv /mnt/c/Program\ Files\Sublime\ Text\ 3/subl.exe /usr/local/bin/subl
  # 使用winpath.sh 配合windows编辑器, 修复参数路径问题, 将c:\foo\bar 自动转换为 /mnt/c/foo/bar
  参见： https://github.com/ijiabao/exe-in-bash
  
  # firefox
  sudo apt install firefox
  sudo apt install firefox-locale-zh-hans
  
  # 终端
  # 使用 ConEmu
  
  ```


## 避免Windows Defender 强制删除有威胁文件

* 添加白名单目录，如：`d:\safedir`, 设为下载目录
* Windows Defender设置=>病毒和威胁防护=>排除项=>添加或删除=>选择目录，即可



## 常用脚本、注册表

* cmd-runas.reg 右键“使用管理员运行cmd"
* cmd-win7.reg 右键终端for win7
* cmd-win10.reg 右键终端for win10
* win10-image-open.reg 右键自带图片浏览器打开图片
* copyto.reg, moveto.reg 右键菜单添加 "移动、复制到..."
* 取消休眠.cmd
* 自动登录.cmd
* 添加中文-美式键盘0804.reg



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


