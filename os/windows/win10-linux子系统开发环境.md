# Ubuntu Linux 子系统开发环境

* 文档写时子系统版本号为 LTS1804



## 安装速配

- 以root做为默认用户，进入终端添加新用户：

  ```bash
  useradd -m -r ijiabao
  passwd ijiabao
  ```

- `sudo`免密

  ```bash
  # 必须使用root用户，修改 /etc/sudoers
  ijiabao ALL=(ALL:ALL) NOPASSWD:ALL
  ```

- 设置默认登录用户

  ```bash
  # 在CMD命令行下。 ubuntu可能为ubuntu1803,根据安装的子系统名称。具体参见appStore的帮助页面。
  ubuntu config --default-user ijiabao
  
  # 设置owner目录，不需要sudo
  sudo chown -Rv ijiabao /usr/local
  sudo chown -Rv ijiabao /opt
  ```

- 开机启用：

  ```
  # 创建 wsl.vbs
  Set ws = CreateObject("Wscript.Shell")
  ws.run "bash /usr/anyesu/boot.sh",vbhide
  # 设置计划任务，开机时运行此wsl.vbs
  ```

- 使用前必做

  ```bash
  # 更新
  sudo apt-get update
  sudo apt upgrade
  # 语言
  sudo apt-get install language-pack-zh-hans
  sudo dpkg-reconfigure locales
  
  # 字体配置器
  sudo apt install fontconfig
  
  # 字体包 (apt-get update)
  sudo apt install fonts-wqy-*
  # 可选
  sudo apt install ttf-wqy-*
  sudo apt install xfonts-wqy
  ```

- 终端环境，替代CMD，下载安装 `ConEmu`

- pass



## 开发工具、编辑器

* 常用

  ```bash
  # SVN
  sudo apt install subversion
  
  # 配置
  vim /etc/profile
  export SVN_EDITOR=vim
  
  ```

* Python

  ```bash
  # python, 默认是2.7
  sudo apt install python
  
  # 安装 python3, 默认是3.6
  sudo apt install python3
  
  # 如需3.7
  sudo add-apt-repository ppa:jonathonf/python-3.7
  
  # 版本管理
  sudo update-alternatives --install /usr/bin/python python /usr/bin/python2 100
  sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 150
  ```

* pass



## 子系统运行exe, 创建符号链接

* 创建exe文件的符号链接, 例如 sublime text

  ```bash
  # 例如 C:\Program Files\Sublime Text 3\subl.exe
  ln -sv /mnt/c/Program\ Files\Sublime\ Text\ 3\subl.exe /usr/local/bin/subl
  
  # 打开/编辑文件
  subl path/file.txt
  ```

* 修复 exe 参数路径问题, 如果exe命令带参数（该参数指定文件或路径），使用`winpath`进行转换

  * 创建文件 `/usr/local/bin/winpath`, 内容如下, 结尾不要带换行

    ```bash
    #!/bin/bash
    # 将参数1转换为windows路径 (子系统用)
    # by ijiabao
    
    path=`readlink -f $1 2>/dev/null`
    echo -e "$path\c" | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'
    ```

  * 创建Sublime Text的启动器, 文件名 `/usr/local/bin/subl`， 内容如下

    ```bash
    /mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe `winpath $1`
    ```

  * 修改权限 `chmod -Rv 777 /usr/local/bin`

  * Bash下打开文件: `subl ./test.txt`

* pass



## AMP环境搭建

* 此环境虽为子系统，但Server/PHP/Mysql的执行效率远比 Windows原始环境高。

- Apache HTTP Server

  ```bash
  # 使用 apache2 包
  sudo apt install -y apache2
  
  # 使用以下命令可快速开启和关闭 conf, mod, site
  # a2enconf  a2enmod   a2ensite
  # a2disconf  a2dismod   a2dissite
  
  # 切换apache功能模块
  sudo a2enmod rewrite
  sudo a2dismod rewrite
  
  # 切换php for apache版本
  sudo a2dismod php7.2	// disable
  sudo a2enmod php5.6		// enable
  
  # 配置文件在
  vim /etc/apache2/apache2.conf
  
  # apache 警告APR_TCP_DEFER_ACCEP
  # 修改 httpd.conf
  AcceptFilter http none
  ```

- PHP 多版本

  ```bash
  # php
  sudo add-apt-repository ppa:ondrej/php
  sudo apt-get update
  
  # 5.6示例：(除php5.6-dev不安装)
  sudo apt install libapache2-mod-php5.6 php5.6-cgi php5.6-fpm php5.6-cli php5.6-common php5.6-gd php5.6-mbstring php5.6-curl php5.6-mysql php5.6-mcrypt php5.6-xmlrpc php5.6-xml php5.6-zip php5.6-opcache php5.6-phpdbg php5.6-imap php5.6-intl php5.6-ldap php5.6-pgsql php5.6-pspell php5.6-recode php5.6-snmp php5.6-sqlite3 php5.6-sybase php5.6-tidy php5.6-json php5.6-bz2 php5.6-odbc php5.6-readline php5.6-interbase php5.6-enchant php5.6-gmp php5.6-xsl php5.6-bcmath php5.6-soap php5.6-dba libphp5.6-embed
  
  # 收集所有php5.6的包名称
  apt-cache search php | grep 5.6 > php56.txt
  subl php56.txt, 正则替换 (.*?\s+)[^\n]+\n => $1 
  # php7参照上述方法
  
  # 切换php版本
  update-alternatives --config php
  ```

* Composer, 详细配置参见 `docs/php/composer.md`

  ```bash
  # composer 配置
  sudo apt install composer
  ```

* MySQL

  ```bash
  # 使用 Mariadb 包, MYSql的开源分支。因mysql被收购，随时有可能闭源收费
  sudo apt install -y mariadb-server
  ```

* pass



## GUI图形环境

* 不安装桌面，用处不大

* 安装 `Window VcXsrv`, 并运行

* 配置

  ```bash
  vim /etc/profile
  export DISPLAY=:0.0
  
  source /etc/profile
  ```

* 如需 `SublimeText For Linux`, 用于编辑 `/etc` 等目录下的文件, `exe`访问不了的

  ```bash
  # 安装依赖包
  sudo apt install libgtk2.0-0
  
  # 下载 sublime text for linux
  # 官网 https://www.sublimetext.com/3
  # 注意权限
  
  cd /opt
  wget https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2
  tar -xvf sublime_text_3_build_3176_x64.tar.bz2
  
  ln -sv /opt/sublime_text_3/sublime_text /usr/local/bin/subll
  
  # 运行测试
  subll /etc/profile
  
  ```

* FireFox 浏览器

  ```bash
  sudo apt install firefox
  sudo apt install firefox-locale-zh-hans
  ```

* pass



## pass

