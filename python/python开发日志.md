# Python 开发日志

* 此为日常开发常用到的,做为记录



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

* Python 3 语言

* Python Completions 代码自动完成

* Python PEP8 Autoformat

* Python Open Module



### 常用

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

### 以管理员身份运行程序

```python
import os,sys,ctypes

```




