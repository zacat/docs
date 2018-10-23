# Sublime Text 全栈配置

> 官网: https://www.sublimetext.com/3



## 可能需要的系统软件

* NodeJs
* Python



### linux下安装

```bash
cd /opt
wget https://download.sublimetext.com/sublime_text_3_build_3176_x64.tar.bz2
tar -xvf sublime_text_3_build_3176_x64.tar.bz2

ln -sv /opt/sublime_text_3/sublime_text /usr/local/bin/subl
```



## 包管理器

```
# ctrl+`
import urllib.request,os; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); open(os.path.join(ipp, pf), 'wb').write(urllib.request.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ','%20')).read())
```



## 必装插件

* Soda Theme

* ConvertToUTF8

  linux/macos需要安装 Codecs33

  ConvertChineseCharacters  // for mac

* TrailingSpaces (去除空格， 强迫症患者)

* Sidebar Enhancements

* INI  (语法)

* Generic Config (语法)

* BracketHightlighter (语法高亮)

  ```json
  // 从 bracket seggings default 复制 bracket_styles 项目，主要修改style
  //	   - underline
  //     - thin_underline
  //     - solid		实心方框
  //     - outline	空心方框
  //     - squiggly	波浪
  //     - stippled
  {
  	"bracket_styles": {
  
          "default": {
              "icon": "dot",
              "color": "region.yellowish brackethighlighter.default",
              "style": "underline"
          },
  
          "unmatched": {
              "icon": "question",
              "color": "region.redish",
              "style": "outline"
          },
          // ...
      }
  }
  ```

* SublimeCodeIntel 代码提示

  * 官网 https://github.com/SublimeCodeIntel/SublimeCodeIntel
  * 如果Package Control 安装不了，以下：
    * Sublime菜单，打开目录 `Preferences -> Browse Packages...`
    * 下载 https://codeload.github.com/SublimeCodeIntel/SublimeCodeIntel/zip/master
    * 或 git clone git://github.com/SublimeCodeIntel/SublimeCodeIntel.git
    * 上述放入目录

  ```
  Install Python and pip (Python 3 requires pip3).
  
  Install CodeIntel by typing the following in a terminal:
  
  # For Python 2
  [sudo] pip install --upgrade --pre CodeIntel
  
  # For Python 3
  [sudo] pip3 install --upgrade --pre CodeIntel
  Note: SublimeCodeIntel requires CodeIntel 2.0 or later.
  
  ```

* SublimeLinter 语法检查

  ```
  需要 nodejs 支持
  # 对应的语言安装相关的Linter, 如：
  SublimeLinter-php
  SublimeLinter-jshint
  SublimeLinter-csslint
  
  ```

* FileHeader (空文件自动生成头部)

* Tag (代码格式化)

* pass



## 建议安装

* Function Name Display
* GotoDocumentation
* Emmet (各种片段模板，需花时间学习和记忆)

## 前端

* Javascript Snippets

* JavaScriptEnhancements	// need nodejs

* JQuery

* CSSFormat

* Minifier

* Javascript Beautify
  HTMLBeautify

* HTML-CSS-JS Prettify

* 语法检查

  ```
  SublimeLinter-php		// 需要配置环境变量php目录
  SublimeLinter-jshint	// 需要 npm install -g jshint
  SublimeLinter-csslint	// npm install csslint -g
  ```

## 后端相关

* SQL Beautifier



## PHP

* Laravel
  * Laravel 5 Snippets
  * Laravel Blade Highlighter
  * Laravel Blade Spacer
  * Blade Snippets
* 语法检查
  * SublimeLinter-php	// 需要配置PHP目录到环境变量
* PHP CodeBeautifier
* PHPNamespace



## Python

* Python 3

* Python Completions

* Python PEP8 Autoformat

* Python Open Module

* FileHeader 配置

  ```python
  # 修改 Data/Packages/FileHeader/template/header/Python.tmpl
  # 内容如下:
  #! /usr/bin/env python
  # -*- coding: utf-8 -*-
  # @Author: {{author}}
  # @Date:   {{create_time}}
  # @Last Modified by:   {{last_modified_by}}
  # @Last Modified time: {{last_modified_time}}
  ```

* 

