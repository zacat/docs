## Brew 安装配置

* 安装

  ```bash
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```

* 示例

  ```bash
  # 安装 wget
  brew install wget
  # 查看安装选项
  brew options php53
  # 安装php53
  brew install --with-some-options php53
  # 查看安装目录,配置信息等
  brew info nginx
  # 扩展仓库
  brew tap
  
  # 通用命令示例
  brew update                      #更新brew可安装包，建议每次执行一下
  brew list                        #查看都安装了哪些
  brew uninstall                   #卸载相应的模块
  brew cleanup -s                  #清除缓存和老旧版本文件
  
  brew search php55                #搜索php5.5
  brew tap josegonzalez/php        #安装扩展<gihhub_user/repo>   ,可以获得更多的资源
  brew tap                         #查看安装的扩展列表
  brew install php55               #安装php5.5
  brew remove  php55               #卸载php5.5
  brew upgrade php55               #升级php5.5
  brew options php55               #查看php5.5安装选项
  brew info    php55               #查看php5.5相关信息
  brew home    php55               #访问php5.5官方网站
  brew services list               #查看系统通过 brew 安装的服务
  brew services cleanup            #清除已卸载无用的启动配置文件
  brew services restart php55       #重启php-fpm
  ```

* 删除brew

  ```bash
  $ cd `brew --prefix`
  $ rm -rf Cellar
  $ brew prune
  $ rm `git ls-files`
  $ rm -rf .git
  $ rm -rf ~/Library/Caches/Homebrew
  ```


## AMP WebServer速配

### Apache, 系统自带

* 基本使用

  ```bash
  sudo apachectl start # 启动apache
  sudo apachectl stop # 关闭apache
  sudo apachectl restart # 重启apache
  ```

* 相关目录

  ```
  　　apache 日志位置 /private/var/log/apache2/error_log
  　　apache配置主文件 /etc/apache2/httpd-conf
  　　apache的vhost配置 /etc/apache2/extra/httpd-vhost.conf
  ```

* 禁止系统 Apache 自动启动

  ```bash
  sudo launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist
  ```


### Brew Apache/PHP/MySQL

* 新版仓库,版本号与安装参数可能不一样

  ```bash
  # 仓库
  brew tap homebrew/apache
  brew tap homebrew/php
  
  # apache24,可略
  # Brew 安装 PHP 会自动安装apache24并， 使系统自动启动用这个
  brew services start httpd24
  # 实测他会优先使用新版的 apachectl
  
  # 查看安装选项
  brew options httpd24
  brew install httpd24 --参数
  
  # 开机启动
  sudo cp -v /usr/local/Cellar/httpd24/2.4.23_2/homebrew.mxcl.httpd24.plist /Library/LaunchDaemons
  sudo chown -v root:wheel /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
  sudo chmod -v 644 /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
  sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.httpd24.plist
  
  # php56
  # 查看选项
  brew options php56
  
  brew install php56 \
  --with-enchant \
  --with-gmp \
  --with-homebrew-curl \
  --with-homebrew-libressl \
  --with-homebrew-libxml2 \
  --with-homebrew-libxslt \
  --with-httpd \
  --with-imap \
  --with-libvpx \
  --with-mssql \
  --with-pear \
  --with-phpdbg \
  --with-postgresql \
  --with-thread-safety \
  
  # 说明
  --with-cgi 暗示着 --without-fpm
  --with-debug 如果安装 php56-xdebug，则不用此选项，提示 API 版本不符合 (可以手动编译)
  --with-thread-safety (apache使用这个，估计打开with-httpd24会自动设置此选项。fast-cgi(FPM)建议使用nts)
  --with-libmysql (这个不建议。默认是mysqlnd, 使用此选项则表示用旧的libmysql)
  --without-fpm (不安装FastCGI)
  --without-mysql (不安装mysql?!)
  
  # php7, 同上,安装前先 brew unlink php56
  brew install php72 --参数列表
  
  brew info php70 # 查看安装信息以及使用方法
  brew link php70 # 修改 CLI 版本 (备份/usr/bin/php相关)
  
  # MySQL, 默认5.7
  brew info mysql55 # 5.5版本
  # 安装,可根据版本
  brew install mysql
  # 启动
  mysql.server start
  # 配置
  mysql_secure_installation
  # 开机启动
  brew services start mysql
  # 如果开机启动不生效,如下
  mkdir -p ~/Library/LaunchAgents
  cp /usr/local/Cellar/mysql/5.6.16/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents/ #5.6.16是数据库版本号，根据你当时所安装的版本号自己修改
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
  
  # phpMyAdmin
  # 这里很可能会遇到2002错误，就是找不到mysql.sock的问题，用下面方法解决
  sudo mkdir /var/mysql
  sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock
  ```

* PHP-MCRYPT 库

  > 参见:
  >
  > https://jingyan.baidu.com/article/e3c78d644cf1ed3c4c85f5a8.html
  > http://blog.csdn.net/hi_teotong/article/details/49451597

  ```bash
  brew search mcrypt
  brew install mcrypt
  
  # 手动编译
  # 下载源码 http://php.net/downloads.php
  cd ~/Downloads/php-5.5.27/ext/mcrypt/
  phpize # 或者 /usr/bin/phpize, 注意是哪个版本的phpize
  ./configure
  make
  # 复制编译好的文件：
  sudo cp modules/mcrypt.so /usr/lib/php/extensions/no-debug-non-zts-20090626/
  ```

* PHP-XDEBUG

  > 使用brew安装时,无效果.仅供参考
  >
  > 手动编译与非常方便

  ```bash
  # 使用brew安装时,无效果.仅供参考
  brew install php71-xdebug \
  	--without-homebrew-php  # (使用phpize 编译,而不是直接拷贝2进制文件)
  
  # --手动编译--
  # 下载源码
  wget https://xdebug.org/files/xdebug-2.6.0.tgz
  # 安装autoconf
  brew install autoconf
  # 进入源码目录,运行:
  phpize
  ./configure --enable-xdebug --prefix=/usr/local/ijiabao/php71-xdebug/2.6.0
  # 如果不确定当前PHP版本，则指定完整目录：
  /usr/local/Cellar/php71/7.1.8_20/bin/phpize
  ./config --参数列表
  
  ## 添加配置：
  subl /usr/local/etc/php/7.1/conf.d/ext-xdebug.ini
  [xdebug]
  zend_extension="/usr/local/Cellar/php71/7.1.8_20/lib/php/extensions/no-debug-zts-20160303/xdebug.so"
  ```

* REDIS

  ```bash
  brew info redis
  brew install redis
  # 启动：
  redis-server /usr/local/etc/redis.conf
  # 开机自启动:
  　　　　brew services start redis
  # 测试：
  redis-cli
  	set say HelloWorld
  	get say
  	flushall
  redis-cli shutdown
  ```


## 黑苹果环境速配

* 下载新系统,刻盘指令, 使用CloverEFI引导

  ```bash
  sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/Inst --applicationpath /Applications/Install\ macOS\ High\ Sierra.app/ --nointeraction
  ```

* 安装包显示已损坏，应该扔到垃圾筒，其实是来源问题

  ```bash
  sudo spctl --master-disable
  ```

* Home-End键

  ```
  在使用者目錄中的 Library 目錄下建立新目錄: KeyBindings
  在該目錄 (~/Library/KeyBindings/) 建立新檔案: DefaultKeyBinding.dict
  檔案內容如下：
  {
  /* Remap Home / End keys to be correct */
  "\UF729" = "moveToBeginningOfLine:"; /* Home */
  "\UF72B" = "moveToEndOfLine:"; /* End */
  "$\UF729" = "moveToBeginningOfLineAndModifySelection:"; /* Shift + Home */
  "$\UF72B" = "moveToEndOfLineAndModifySelection:"; /* Shift + End */
  "^\UF729" = "moveToBeginningOfDocument:"; /* Ctrl + Home */
  "^\UF72B" = "moveToEndOfDocument:"; /* Ctrl + End */
  "$^\UF729" = "moveToBeginningOfDocumentAndModifySelection:"; /* Shift + Ctrl + Home */
  "$^\UF72B" = "moveToEndOfDocumentAndModifySelection:"; /* Shift + Ctrl + End */
  }
  ```


