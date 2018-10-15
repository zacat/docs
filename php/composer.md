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

* 输入 `github` 项目地址如： https://github.com/foo/bar.git

* `git`项目示例

  ```bash
  # 登录 github 创建一个仓库. 或其它支持git代码管理的网站上。
  git clone https://github.com/foo/bar.git
  cd foo/bar
  # 建立composer.json
  composer init
  # name 即是项目名称， 如 "ijiabao/foo-bar"
  
  # 添加项目文件
  git add some/files
  git add other/files
  
  # 提交修改
  git commit -m "init files"
  # 推送 master(主线、开发版dev)
  git push origin master
  
  # 发行v1.0版 (stable版)
  git tag -a v1.0 -m "stable v1.0"
  # 推送 stable v1.0
  git push origin v1.0
  ```

* 手动更新

  ```
  curl -XPOST -H'content-type:application/json' 'https://packagist.org/api/update-package?username=ijiabao&apiToken=wXAmA7oZTFLH6RFAh07b' -d'{"repository":{"url":"https://packagist.org/packages/ijiabao/laravel-dbdump"}}'
  ```



## 本地包开发

* 本地path，软链接

  ```json
  // composer.json, ijiabao/dbdump为相对路径
  "repositories": {
      "ijiabao/laravel-dbdump": {
      "type": "path",
      "url": "ijiabao/dbdump"
      }
  }
  ```
