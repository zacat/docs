## 安装

~~~bash
composer create-project laravel/laravel=5.5.* --prefer-dist
~~~



## laravel专用镜像

```json
	"repositories": {
        "packagist": {
            "type": "composer",
            "url": "https://packagist.laravel-china.org"
        }
    }
```



## 必要配置

```php
// AppServiceProvider.php

public function boot()
{
    //
    \Schema::defaultStringLength(191);
    \DB::enableQueryLog();
}

```

## 数据库

~~~bash
mysql -uroot -p
create database cms_test;
subl .env
~~~



## 修改User Model 目录

```php
// 修改之前可"Find Usages" 查找引用
// app/User.php => app/Models/User.php
namespace App\Models;

// config/auth.php
'providers' => ['users'=> ['model'=> App\Models\User::class]];

// config/services.php
'model' => App\Models\User::class,


// app/Http/Controllers/Auth/RegisterController.php
use App\Models\User;

// database/factories/UserFactory.php
$factory->define(App\Models\User::class, function (Faker $faker) {
     // ...
}
```



## 用户认证-脚手架

```bash
php artisan make:auth
# 添加数据
php artisan make:seeder UsersTableSeeder
```

```php
// file: database/seeds/DatabaseSeeder.php
$this->call(UsersTableSeeder::class);

// file: database/seeds/UsersTableSeeder.php
public function run()
{
    //
    $user = \App\Models\User::create([
        'name'=>'admin',
        'email'=>'admin@test.com',
        'password'=>bcrypt('123456'),
    ]);
    echo 'user id['.$user->id .'] created' . PHP_EOL;

}
```

```bash
php artisan migrate --seed
php artisan vendor:publish
```



## SVN/GIT 版本控制

```bash
mv -v storage storage-example	# 初始化时的可写目录
mv -v vendor ../bak-vendor		# package目录，临时移走
# 导入所有文件到库

# 检出
checkout
mv -v storage-example storage
mv -v ../bak-vendor vendor

# 设置 ignore 文件、目录
.env,  .idea, storage, vendor
composer update

```



## 伪静态

* 如果使用二级目录,例如localhost/test-laravel

  .htaccess: `RewriteBase /test-laravel`


## 常用插件

```bash
composer require caouecs/laravel-lang:~3.0
composer require barryvdh/laravel-ide-helper
composer require mews/captcha
composer require overtrue/laravel-pinyin
composer require intervention/image

```



## 插件配置

* 语言包

  ~~~bash
  composer require caouecs/laravel-lang:~3.0
  cp -rv vendor/caouecs/laravel-lang/src/zh-CN resources/lang/
  ~~~

  ```php
  // config/app.php
  'timezone'=>'PRC',
  'locale'=>'zh-CN'
  ```

* PhpStrom IDE 插件

  ```bash
  composer require barryvdh/laravel-ide-helper
  php artisan vendor:publish
  ```

  ```php
  // config/ide-helper.php
      'model_locations' => array(
          'app',
          'app/Models',
      ),
  ```

  ```bash
  php artisan ide-helper:generate
  # model, nowrite, reset
  php artisan ide-helper:model -RN
  ```



## 创建高级Artisan命令

```php
// 先创建一个DbDumpCommand类:
// php artisan make:command DbDump

// 文件: app/Console/Commands/DbDumpCommand.php

class DbDumpCommand extends Command{
    // protected $signature = 'cms:db';	// 不要这个
    protected $name = 'cms:db';
    
    // 定义开关参数
    // 不要覆盖以下默认值: -h --help, -q --quiet, -V --version --ansi, --no-ansi -n, --no-interaction --env, -v|vv|vvv, --verbose
    // VALUE_NONE: 不可设置值, 如　--all, -a
    // VALUE_OPTIONAL: 可带值, 如: --name=user, -N 5
    protected function getOptions()
    {
        return [
            ['all', 'a', InputOption::VALUE_NONE, 'import/export all tables'],
            ['name', 'N', InputOption::VALUE_OPTIONAL, 'table name']
        ];
    }

	// 定义附加参数, 即 cms:db 后面附加的参数, REQUIRED表示必须存在
    // 如: cms:db abc def, 则$this->arguments() = ['foo'=>'abc', 'bar'=>'def']
    protected function getArguments()
    {
        return [
            ['foo', InputArgument::REQUIRED, 'test arguments1'],
            ['bar', InputArgument::OPTIONAL, 'test arguments2']
            
        ];
    }
    
    public function handle()
    {
        //
        dd($this->options(), $this->arguments());
        dd($this-option('all'));
        dd($this->argument('action'));
    }
    
    // 运行以下示例, 看options() 与 arguments() 即可了解:
    // php artisan cms:db --help
    // php artisan cms:db export -a
    // php artisan cms:db import --all	
    // php artisan cms:db export --name=users
    
    
}
```

### 前后端

```html
<meta name="csrf-token" content="{{ csrf_token() }}">
<script>
    WINDOW.CSRF_TOKEN = $('meta[name="csrf-token"]').attr('content');
    $.ajaxSetup({
        
    })
</script>
```



## 数据模型

* 关联速记

  ```php
  # 以下是默认值,方便修改非默认值时做参考
  
  # 用户表User, 资料表UserInfo, 一对一, 默认值如下:
  User::hasOne(UserInfo::class, "user_id", "id");
  
  # 用户表User, 角色表Role, 一对多
  User::hasMany(Role::class, "user_id", "id");
  
  # 栏目 对 文章, 一对多
  Category::hasMany(Article::class, "category_id", "id")
      
  # belongsTo 文章表 对 栏目表 
  Article::belongsTo(Category::class, "category_id", "id");
  ```


```js


```



