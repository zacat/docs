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

* 自动更新(for github)

  > github的service服务已停止, 使用新的webhook来实现自动推送更新
  >
  > 参见: https://packagist.org/about#how-to-update-packages

  * 退出登录(github, packagist)

  * 登录packagist, 使用 github OAuth登录(第三方登录), 并开启所有权限

  * 进入profile页 https://packagist.org/profile/

  * 页面有显示 GitHub Hook Sync 和时间, 表示成功,以后github更新时,会自动推送到packagist.

    另可点击 "retry hook sync" 对你的github进行同步挂钩 (为github项目添加webhook). 

    ```
    GitHub Hook Sync
    
    Completed at 2018-10-17 02:51:29 UTC, retry hook sync.
    0 hooks setup/updated
    0 hooks already setup and left unchanged
    ```

  * 她的原理获得权限,在你的github项目里添加一个 webhook,  当PUSH代码时告之`packagist`进行更新

    可查看你的github项目=> settings => Webhooks , 如果有packagist.org/api/github, 则表示成功.

    ```
    Webhooks
    
    Webhooks allow external services to be notified when certain events happen. When the specified events happen, we’ll send a POST request to each of the URLs you provide. Learn more in our Webhooks Guide.
    
    https://packagist.org/api/github (push)
    ```

  * 笔者写了个webhook demo, 能实现同样效果, 参见: https:github.com/ijiabao/

* 手动更新

  ```
  curl -XPOST -H'content-type:application/json' 'https://packagist.org/api/update-package?username=ijiabao&apiToken=wXAmA7oZTFLH6RFAh07b' -d'{"repository":{"url":"https://packagist.org/packages/ijiabao/laravel-dbdump"}}'
  ```



## 本地包开发

* 本地path，建议此法 (新版composer才支持)

  > 可将包目录放在本地, 假设 ./ijiabao/dbdump, 即时修改即时生效. 必须 require dev-master
  >
  > 使用 `path` 指定目录, 则会在 `vendor` 创建一个软链接, 无须`composer update`

  ```json
  "require": {
      "ijiabao/laravel-dbdump": "@dev"
  },
  "repositories": {
      "ijiabao/laravel-dbdump": {
      "type": "path",
      "url": "ijiabao/dbdump"
      }
  }
  ```

* 远程git,  直接拉取 https://github.com 对应的包内容, 系统须预安装git软件

  > 此法绕过 packagist 而直接使用github仓库,为测试节省时间.
  >
  > 包有变更时,须使用 `composer update` 更新

  ```json
  "require": {
      "ijiabao/laravel-dbdump": "@dev"
  },
  "repositories": {
      "ijiabao/laravel-dbdump": {
      "type": "git",
      "url": "https://github.com/ijiabao/laravel-dbdump"
      }
  }
  ```

* 本地git, 用于开发测试与发布. 此法意义不大.

  > 此法会在vendor添加一个目录拷贝, 包有变更时,使用`composer update`才能更新
  >
  > 先`git clone` 拉取包内容, 或 `git init` 生成一个本地包, 假设目录在./ijiabao/laravel-dbdump

  ```json
  "require": {
      "ijiabao/laravel-dbdump": "@dev"
  },
  "repositories": {
      "ijiabao/laravel-dbdump": {
      "type": "git",
      "url": "ijiabao/dbdump"
      }
  }
  ```
