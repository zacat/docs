## Windows下简单使用

* 安装 git for windows

  网址：https://gitforwindows.org/

* 安装 TortoiseGit (依赖 Git for windows)

  网址：https://tortoisegit.org/download/



## 配置

* 修改默认编辑器

  ```bash
  # /etc/profile
  export GIT_EDITOR=vim
  ```

* 记住用户名和密码

  ```
  git config --global credential.helper store
  ```

## 流程示例

~~~bash
# 检出
git clone https://github.com/ijiabao/test.git
cd test

# 添加文件
git add .

# 提交本地库
git commit -m '说明'

# 推送到服务器
git push

~~~

