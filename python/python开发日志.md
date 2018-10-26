# Python 开发日志

* 此为日常开发常用到的,做为记录



## 安装

* Linux需另装模块和工具, pip, wheel, setuptools

  ```bash
  # UBUNTU 示例
  sudo apt install python3-pip python3-wheel python3-setuptools
  ```

* 更新插件

  ```bash
  python3 -m pip install --upgrade pip,wheel,setuptools
  ```

* ubuntu pip3 升级后有BUG:

  ```
  from pip import main
  
  ImportError: cannot import name main
  ```

  修改 /usr/bin/pip3

  ```python
  sys.exit(main())
  ```

  改为

  ```python
  sys.exit(__main__._main())
  ```

* 


### Sublime Text 编辑器插件

* FileHeader 新文件模板,自动添加头

  ```python
  # 安装 File Header
  # 修改 Data/Packages/FileHeader/template/header/Python.tmpl
  # 内容如下:
  #! /usr/bin/env python
  # -*- coding: utf-8 -*-
  # @Author: {{author}}
  # @Date:   {{create_time}}
  # @Last Modified by:   {{last_modified_by}}
  # @Last Modified time: {{last_modified_time}}
  ```

* Python 3 (语法)

* Python Completions 代码自动完成

* Python PEP8 Autoformat

* Python Open Module



## byte 与 string

> 速记:  二进制是通用格式, 需要"解码"为字符串, decode, 文本相反 encode

```python
# 二进制转字符串使用 decode()
with open(file, 'rb') as f:
    raw = f.read()
    txt = raw.decode('utf-8')
# 字符串转二进制使用 encode()
with open(file, 'wb') as f:
    raw = txt.encode('utf-8')
```



## Win兼容性

### 字符编码

* print, 标准IO(不限于文件读写), 以及默认encode和decode时会自动使用uncode编码, 'gbk', 这是一个大坑

* 所有IO读写时,指定encode, decode时使用'utf-8', 没问题; 问题出在print 会再次将utf-8转为gbk

* 错误示例

  ```python
  # 以下在linux下都是正常的, Windows下各种不兼容
  
  # 标准IO, 默认会encode('gbk')
  with open(file, 'r') as f:
      txt = f.read()	# error, 内部会自动encode('gbk')
    
  # 设置了utf-8并不是解决方案,对于任何字符格式, 在print时会自动转换unicode
  with open(file, 'r', encoding='utf-8') as f:
      txt = f.read()
      print(txt) # error
  
  # 二进制
  with open(file, 'rb') as f:
      bin = f.read()
      txt = bin.decode('utf-8')
      print(txt) # error, 会再次编码为gkb
      
  ```

* 对于print错误,可设置cmd.exe 属性,设置代码页为65001

* 对于IO读写,或有隐含的encode/decode时, 必须指定encoding='utf-8', 如果为unicode, 指定 'ignore'

* pass

### 文件操作

* 使用shutil复制文件时, 相当于新建了一个文件(时间戳变了)

  ```python
  # 使用 copy2, 保持时间戳
  shutil.copy2(src, dest)
  # 使用系统copy命令
  os.system('copy /y "%s" "%s"' % (src, dest))
  ```

* pass



## 常用

* 判断版本号

  ```python
  import os,sys,ctypes
  
  if sys.version_info < (3, 4):
      ctypes.windll.user32.MessageBoxW(0, "python版本必须高于3.4.4", "提示", 0)
  	exit(0)
  ```

* Win下判断并以管理员身份运行

  ```python
  import os,sys,ctypes
  
  if __name__ == '__main__':
      if not ctypes.windll.shell32.IsUserAnAdmin():
          ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, __file__, None, 1)
          exit(0)
      # main()
  
  # python2.7，使用u"runas", unicode(sys.executable), unicode(__file__)
      
  # 以管理员身份运行其它程序
  ctypes.windll.shell32.ShellExecuteW(None, "runas", "notepad", "1.txt", None, 0)
  ```

* pass



## 遍历目录

```python
# os.walk(top[, topdown=True[, onerror=None[, followlinks=False]]])
for root, dirs, files in os.walk('.'):
    for name in files:
        fullpath = os.path.join(root, name)
        # do something
# 默认参数
# topdown=True, 先根遍历
# onerror=func, 指定异常时的回调
# followlinks=False, 遍历软链接或快捷方式
```



## 文件操作

> 对文件进行操作时, 注意时间戳

```python
# 创建目录
os.makedirs('somepath', mode=0o777, exist_ok=True)

# 复制文件, 建议使用copy2
shutil.copyfile(src, dest) # 相当与读写, 会覆盖dest
shutil.copy(src, dest)	# 复制,修改时间戳
shutil.copy2(src, dest) # 复制,保持时间戳, 但目录相同时, 为重命名

# 复制目录, 参数三:仅复制符号链接, 否则复制指向的内容
shutil.copytree(path, dest_path, True|False)

# 重命名,移动 (文件/文件夹)
os.rename(src, dest)
shutil.move(src, dest)

# 删除文件
os.unlink(full_path)
# 删除目录
os.rmdir(dir) # 必须非空
os.removedirs(dir) # 递归
shutil.rmtree(dir) # 递归删除

```



## 正则

```python
import re
# match
re.match(r'', txt)

# 取组
mat = re.match(r'^(.*?)\s(.*?)$', 'abc def')
mat.groups() # ('abc def', 'abc', 'def')
mat.group(0) # abc def
mat.group(1) # abc
mat[0] # alias of mat.groups(0)
mat[1] # abc


# 替换时, 组使用 \0 \1 \2..
txt = re.sub(r'^(.*?)$', '\1', txt)

# 高级替换
def impl(matched):
    orig = matched.group(0) #
    a = matched.group(1) # \1
    return orig

txt = re.sub(regex, impl, txt)

# lambda 额外传参
def impl(somearg, matched):
    pass
txt = re.sub(regex, lambda mat: repl_x(some_arg, mat), txt)
```



### 定义和获取命令行参数

* 示例

  ```python
  # 一个网页抓取脚本, 参数如下:
  # clone_url.py http://www.baidu.com --depth=2 --save=my.html --force
  
  import argparse
  
  parse = argparse.ArgumentParser()
  # 第一个参数, 必填
  parse.add_argument('url')
  # 选项参数, --depth, 非必填, 如果未填, 默认2
  parse.add_argument('--depth', '-D', type=int, default=2)
  # 选项, --save 必填
  parse.add_argument('--save', '-S', required=True)
  # 选项, 不带值
  parse.add_argument('-f', '--force', action="store_true")
  
  # 互斥, -v 和 -q二选一
  group = parser.add_mutually_exclusive_group()
  group.add_argument('-v', action="store_true")
  group.add_argument('-q', action="store_true")
  
  args = parser.parse_args()
  
  # 取url
  url = args.url
  
  # --force 不带值
  if args.force:
      pass
  
  ```



## shell/子程序

```python
os.system("cmd")

# 获取子程序的输出
output = os.popen('dir/w')
info = output.read()

```






