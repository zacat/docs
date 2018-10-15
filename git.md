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

* 设置用户

  ```bash
  git config --global user.email "ijiabao@qq.com"
  git config --global user.name "ijiabao"
  ```

* 记住用户名和密码

  ```
  git config --global credential.helper store
  ```

## 主线流程示例

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



## 分支流程示例

* 主线趋于稳定时, 或需要大量修改时,建议使用分支进行开发,一旦分支开发造成破坏性灾难时,还可以还原

```bash
# 检出
ijiabao@PC:~$ git clone https://github.com/ijiabao/test.git
ijiabao@PC:~$ cd test

# 查看分支
ijiabao@PC:~/test$ git branch
* master

# 新建分支并切换
ijiabao@PC:~/test$ git checkout -b dev
切换到一个新分支 'dev'

# 查看分支
ijiabao@PC:~/test$ git branch
* dev
  master

# 分支开发
# 添加文件"testdev.txt"
ijiabao@PC:~/test$ touch testdev.txt
ijiabao@PC:~/test$ git add testdev.txt

# 提交修改
ijiabao@PC:~/test$ git commit -m "branch test"
[dev e434c35] bransh test
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 testdev.txt

# 分支开发结束

# 切换到主线
ijiabao@PC:~/test$ git checkout master
切换到分支 'master'
您的分支与上游分支 'origin/master' 一致。

# 查看来自分支的文件"testdev.txt", 文件不存在
ijiabao@PC:~/test$ cat testdev.txt
cat: testdev.txt: 没有那个文件或目录

# 合并分支到主线
ijiabao@PC:~/test$ git merge dev
更新 1564eef..e434c35
Fast-forward
 testdev.txt | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 testdev.txt

# 查看文件 "testdev.txt", 文件存在(来自分支,已合并)
ijiabao@PC:~/test$ cat testdev.txt

# 删除支线
ijiabao@PC:~/test$ git branch -d dev
已删除分支 dev（曾为 e434c35）。

# 查看分支
ijiabao@PC:~/test$ git branch
* master
ijiabao@PC:~/test$

```



## 打标签

~~~bash
# 打标签
git tag -a v1.0 -m "release 1.0"

# 删除标签(本地)
git tag -d v1.0

# 推送标签
git push origin v1.0

# 删除远程标签
git push origin --delete v1.0
# or
git push origin :refs/tags/v1.0

# 列出标签
git tag

# 切换到某个标签, 标签相当于快照,并不可修改代码
git checkout v1.0

# 在v1.0处创建一个分支
git checkout -b new_branch v1.0

~~~



## 回滚

```bash
# 查看提交的log, 记下CommitID
git log -3

# 回滚到指定版本
git reset --hard commit_id

# 强制提交
git push -f origin master

# 回滚到某个tag
git show v1.0

# 记下commit_id
git reset --hard commit_id
git push -f origin master

```



## 与SVN相比

```bash
# 合并
	切换到主线, 点击合并, 选择一个支线, 测试,OK
# 反向合并(回滚)
	同上,切换到主线,点击合并,选择支线(反向合并), 此时会将支线替换到主线, 删除已有的主线
```



## 推荐教程

> https://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000