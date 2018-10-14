## 安装

### Windows 版

* composer.phar 最新版： https://getcomposer.org/composer.phar
* Windows 安装版：https://getcomposer.org/Composer-Setup.exe
* 墙？ https://dl.laravel-china.org/composer.phar
* 手动安装：

```bash
# 安装目录在 d:\apps\bin, 并添加路程到环境变量.
cd /d d:\apps\bin

# 下载 composer.phar
wget https://getcomposer.org/composer.phar
# 或：
php -r "copy('https://getcomposer.org/composer.phar', 'composer.phar');"

# 新建 composer.bat
@echo OFF
:: in case DelayedExpansion is on and a path contains ! 
setlocal DISABLEDELAYEDEXPANSION
php "%~dp0composer.phar" %*
```

### Linux

~~~bash
# centos/fedora
sudo yum install composer
# ubuntu
sudo apt-get install composer
~~~



## 镜像源

* 默认源是 https://packagist.org

* 官方建议镜像源： https://packagist.org/mirrors

  ```bash
  # 中国镜像源： https://pkg.phpcomposer.com/ (现在需要密码了。)
  composer config -g repo.packagist composer https://packagist.phpcomposer.com
  # 亚洲[印尼]: https://packagist.phpindonesia.id
  composer config -g repos.packagist composer https://packagist.phpindonesia.id
  # 亚洲[日本]: https://packagist.jp/
  composer config -g repos.packagist composer https://packagist.jp
  # 欧洲[巴西]：https://packagist.com.br/
  composer config -g repos.packagist composer https://packagist.com.br
  ```

* Laravel China 源

  > 项目说明：https://laravel-china.org/composer
  >
  > 只要 优帆远扬 和 Laravel China 还活着，这个项目就会一直持续下去。

  ```bash
  composer config -g repo.packagist composer https://packagist.laravel-china.org
  ```

* 恢复官方源

  ```bash
  composer config -g --unset repos.packagist
  ```



## 发布包

* 网址： https://packagist.org/packages/submit

* 输入 github 项目地址如： https://github.com/foo/bar.git

* 示例

  ```
  
  ```

* 手动更新

  ```
  curl -XPOST -H'content-type:application/json' 'https://packagist.org/api/update-package?username=ijiabao&apiToken=wXAmA7oZTFLH6RFAh07b' -d'{"repository":{"url":"https://packagist.org/packages/ijiabao/laravel-dbdump"}}'
  ```
