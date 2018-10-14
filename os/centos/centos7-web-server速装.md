## 速装

```
yum install httpd mariadb-server
php扩展很多，使用 php-* 通配, --exclude 表示除外(度娘根本查不到资料)
yum install php-* --exclude php-mysql,php-devel

systemctl enable httpd
systemctl enable mariadb
systemctl start httpd
systemctl start mariadb

mysql_secure_installation
回车 输入两次密码 一路回车

防火墙：
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --reload

all done.

```



## Mysql字符集

```
[mysqld]
# 注意在mysqld下面
# character_set_server = utf8
character-set-server = utf8
```



## vhosts 示例

* vhosts/_default, 最优先

  ```
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
  ```

* vhosts/any.conf

  ```
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
  ```

* 在httpd.conf 中，尾部添加：

  ```
  Include vhosts/_default
  IncludeOptional vhosts/*.conf
  ```
