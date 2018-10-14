# WebClone 快速仿站工具（Python)

使用说明：

python webclone.py

    --url=http://www.baidu.com  指定Url
    --depth=2   指定抓取子链接深度(默认只抓取单个页面)
    --asset-dir=assets  为资源指定二级目录(css/js/image/fonts)，默认assets,例如原来的 /foo/bar.css 会变为 /assets/foo/bar.css
    --html-threads=10   页面抓取线程数目，默认10（如果服务器拒绝[请求过快],设置为1)
    --ignore-query=page 忽略'page'参数，即：foo/bar.php&a=1 foo/bar.php?a=1&page=5 视为同一页面，不重复抓取
    --delay=3           每三秒抓取一个页面(仅用于单线程，防止请求过快)
    --asset-threads=30  资源抓取线程数目，默认30 (这个大部分服务器不会拒绝)
    --allow-hosts=baidu.com 通常带www和不带www的域名视为跨域（不下载），这里指定允许下载跨域的域名



临时使用而写的，源码仅供参考，有很多细节未完善。