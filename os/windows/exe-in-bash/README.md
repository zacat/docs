## 子系统运行exe, 创建符号链接

- 创建exe文件的符号链接, 例如 sublime text

  ```bash
  # 例如 C:\Program Files\Sublime Text 3\subl.exe
  ln -sv /mnt/c/Program\ Files\Sublime\ Text\ 3\subl.exe /usr/local/bin/subl
  
  # 打开/编辑文件
  subl path/file.txt
  ```

- 修复 exe 参数路径问题, 如果exe命令带参数（该参数指定文件或路径），使用`winpath`进行转换

  - 创建文件 `/usr/local/bin/winpath`, 内容如下, 结尾不要带换行

    ```bash
    #!/bin/bash
    # 将参数1转换为windows路径 (子系统用)
    # by ijiabao
    
    path=`readlink -f $1 2>/dev/null`
    echo -e "$path\c" | sed -e 's@^/mnt/\(\w\)/@\1:/@' -e 's@/@\\@g'
    ```

  - 创建Sublime Text的启动器, 文件名 `/usr/local/bin/subl`， 内容如下

    ```bash
    /mnt/c/Program\ Files/Sublime\ Text\ 3/subl.exe `winpath $1`
    ```

  - 修改权限 `chmod -Rv 777 /usr/local/bin`

  - Bash下打开文件: `subl ./test.txt`

- pass