#! /usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: iJiabao
# @Date:   2018-10-15 04:45:31
# @Last Modified by:   iJiabao
# @Last Modified time: 2018-10-15 04:45:54

import os
import re
import sys
from getopt import getopt
import time
import traceback
import threading
from urllib.parse import urlparse, urljoin, urlunparse, parse_qs
from queue import Queue
# from lxml.html import HtmlElement

import requests
from pyquery import PyQuery as pq

headers = {
    "User-Agent": "Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101 Firefox/45.0"
}

root_dir = os.path.join(os.getcwd(), 'sites')
asset_dir = 'assets'


def absolute_url(base_url, link):
    return urljoin(base_url, link)


# url转本地
def url_to_local(abs_url):
    info = urlparse(abs_url)
    path = '/' + info.path.lstrip('/')
    dir_, file = os.path.split(path)
    name, ext = os.path.splitext(file)
    if not name:
        name = 'index'
    if not ext:
        ext = '.html'
    if info.query:
        name += '[%s]' % info.query

    uri = os.path.join(dir_, name + ext)
    uri = uri.replace('\\', '/')

    file = os.path.join(root_dir, uri.lstrip('/'))
    file = os.path.normpath(file)
    # uri = urlunparse((info.scheme, info.netloc, path, info.params, info.query, info.fragment))
    return uri, file


# 资源url转本地
def asset_to_local(base_url, abs_url):
    info = urlparse(abs_url)
    path = '/' + info.path.lstrip('/')

    # 外部资源
    i = urlparse(base_url)
    if i.netloc != info.netloc:
        path = '/' + re.sub(r'[\.\:]', '_', info.netloc) + path

    if asset_dir:
        path = '/' + asset_dir + path

    file = os.path.join(root_dir, path.lstrip('/'))
    file = os.path.normpath(file)

    uri = path
    if info.query:
        uri += '?' + info.query
    if info.fragment:
        uri += '#' + info.fragment
    return uri, file
    pass


# 非正规URL, tel:number, javascript:; data:type/mime
def is_url(url):
    if not url:
        return False
    # 非正规URL, tel:number, javascript:;
    mat = re.match(r"^([^\:\/\;\?\#]+)\:", url)
    if mat:
        scheme = mat.group(1)
        if not (scheme == 'http' or scheme == 'https'):
            return False
    return True


# 处理页面链接，转换之， 并添加下载任务
def translate_dom_links(task, base_url, dom):
    href = pq(dom).attr('href')
    # 非正规URL, tel:number, javascript:;
    if not is_url(href):
        return

    full_url = absolute_url(base_url, href)
    # 不下载外链
    i0 = urlparse(base_url)
    i1 = urlparse(full_url)
    if i0.netloc != i1.netloc:
        return False

    uri, file = url_to_local(full_url)
    pq(dom).attr('href', uri)
    task = {'url': full_url, 'uri': uri, 'file': file, 'depth': task['depth'] - 1}
    add_task(task)
    pass


# 处理资源链接，转换之，并添加下载任务
def translate_dom_assets(task, base_url, dom):
    attr = 'href' if dom.tag == 'link' else 'src'
    href = pq(dom).attr(attr)

    full_url = absolute_url(base_url, href)
    uri, file = asset_to_local(base_url, full_url)
    pq(dom).attr(attr, uri)
    # 文件已存在,且不为空
    if os.path.isfile(file):
        # if os.path.getsize(file) > 0:
        return
    task = {
        'url': full_url,
        'uri': uri,
        'file': file,
        'type': 'asset'
    }
    add_task(task)

    pass


def translate_css_assets(content, base_url, force_full_uri=False):
    def check_url(url):
        url = url.strip()
        url = url.strip('"\'')
        if not is_url(url):
            return url

        full_url = absolute_url(base_url, url)
        uri, file = asset_to_local(base_url, full_url)

        info = urlparse(url)
        # 跨域 import CSS，不转换，不下载
        f, ext = os.path.splitext(file)
        if ext == '.css' and info.netloc:
            base_info = urlparse(base_url)
            if base_info.netloc != info.netloc:
                return url

        # 相对Url不需要转换. force_full_uri表示页面内嵌css/style, 必须全路径
        if not force_full_uri:
            if (not url.startswith('/')) and (not info.netloc):
                uri = url

        task = {
            'url': full_url,
            'uri': uri,
            'type': 'asset',
            'file': file
        }
        add_task(task)

        return uri

    def repl_url(mat):
        url = mat.group(2)
        uri = check_url(url)
        return '%surl("%s")' % (mat.group(1), uri)

    def repl_import(mat):
        uri = check_url(mat.group(1))
        return '@import url("%s");' % uri

    # result = re.sub(r'([\s\:\,])url\((.+?)\)', repl_url, content)
    result = re.sub(r'([^\d\w_-])url\((.+?)\)', repl_url, content)
    result = re.sub(r'\@import\s+(.+?)\;', repl_import, result)
    return result
    pass


# 失败重试（可使用独立线程）
def retry_task(task):
    retry = task.get('retry', 3)
    if retry <= 0:
        return False
    task['retry'] = retry - 1
    task['delay'] = 2
    add_task(task)
    return True


# 页面任务
def process_html_task(task):
    url = task.get('url')
    retry = task.get('retry', 0)
    s = '抓取' if retry < 1 else '重试[%d]' % retry
    print('%s：%s' % (s, url))
    try:
        r = requests.get(url, headers=headers)
    except Exception as e:
        print('无法连接：%s' % url)
        retry_task(task)
        return
    status = r.status_code
    if status != 200:
        print('错误[%d]：%s' % (status, url))
        retry_task(task)
        return

    r.encoding = 'utf-8'
    if not r.text:
        print('无回应: %s' % url)
        retry_task(task)
        return

    # print(task)
    # print('处理: %s => %s' % (url, task.get('file')))

    html = r.text
    doc = pq(html)

    # 处理资源
    doc('link[href], script[src], img[src]').each(lambda i, dom: translate_dom_assets(task, url, dom))

    # 处理内嵌CSS, <style>...</style> <tag style=""></tag>
    def translate_dom_css(dom):
        if dom.tag == 'style':
            txt = pq(dom).html()
            txt = translate_css_assets(txt, url, True)
            pq(dom).html(txt)
        else:
            txt = pq(dom).attr('style')
            txt = translate_css_assets(txt, url, True)
            pq(dom).attr('style', txt)
        pass

    doc('[style], style').each(lambda i, dom: translate_dom_css(dom))

    # 处理子链接
    depth = task.get('depth', 0)
    if depth > 0:
        doc('a[href]').each(lambda i, dom: translate_dom_links(task, url, dom))

    txt = doc.outer_html()
    # PyQuery丢失<!doctype ..>，再补上
    mat = re.match(r'^([\s\S]+?)\<html', html, flags=re.IGNORECASE)
    if mat:
        s = mat.group(1).strip()
        if s.startswith('<!'):
            txt = s + '\n' + txt

    file = task.get('file')
    os.makedirs(os.path.dirname(file), 0o777, True)
    with open(file, mode='wb') as f:
        f.write(bytes(txt, 'utf-8'))

    # print(task)
    pass


# 资源任务
def process_asset_task(task):
    url = task.get('url')
    print('资源: %s' % url)
    try:
        r = requests.get(url, headers=headers)
    except Exception as e:
        print('资源失败,无法连接：[%s]' % url)
        return
    if not r.content:
        print('资源失败: [%s]' % url)
        return

    r.encoding = 'utf-8'
    text = None
    file = task.get('file')
    # 处理Css内部资源
    f, ext = os.path.splitext(file)
    if ext == '.css':
        text = translate_css_assets(r.text, url)

    os.makedirs(os.path.dirname(file), 0o777, True)
    with open(file, mode='wb') as f:
        c = r.content if not text else bytes(text, 'utf-8')
        f.write(c)
    pass


# 线程模型
class TaskMan:
    def __init__(self, max_threads=10, handler=None):
        self.tasks = Queue()
        self.max_threads = max_threads
        self.mutex = threading.Lock()
        self.running_threads = 0
        self.handler = handler

    def setup(self, max_threads, handler):
        self.max_threads = max_threads
        self.handler = handler

    def worker(self):
        while True:
            task = self.tasks.get()
            try:
                self.handler(task)
            except Exception as e:
                traceback.print_exc()
            self.tasks.task_done()

    def add(self, task):
        with self.mutex:
            if self.running_threads < self.max_threads:
                threading.Thread(target=TaskMan.worker, args=(self,), daemon=True).start()
                self.running_threads += 1
        self.tasks.put(task)

    def wait_done(self):
        self.tasks.join()


html_tasks = TaskMan(10, process_html_task)
asset_tasks = TaskMan(30, process_asset_task)
retry_tasks = Queue()
task_mutex = threading.Lock()
tasks_map = {}


def add_task(task):
    url = task.get('url', '')
    if not url:
        return
    # 使用单线程处理重试
    if task.get('retry', 0) > 0:
        retry_tasks.put(task)
        return

    i = urlparse(url)
    # 排序query, 去重比较
    query = i.query
    if query:
        qs = parse_qs(query)
        arr = []
        for k, v in qs.items():
            for vv in v:
                arr.append('%s=%s' % (k, vv))
        query = '&'.join(arr)
    # scheme, netloc, url, params, query, fragment
    true_url = urlunparse((i.scheme, i.netloc, i.path, i.params, query, None))
    with task_mutex:
        # 简单去重
        if true_url in tasks_map:
            if task.get('retry', 0) > 1:
                return
        tasks_map[true_url] = task
    if task.get('type', 'html') == 'html':
        html_tasks.add(task)
    else:
        asset_tasks.add(task)
    pass


def wait_tasks_done():
    html_tasks.wait_done()
    asset_tasks.wait_done()
    with task_mutex:
        print('页面线程数: %d' % html_tasks.running_threads)
        print('资源线程数: %d' % asset_tasks.running_threads)

    man = TaskMan(1, process_html_task)
    # 单线程处理重试
    while not retry_tasks.empty():
        man.add(retry_tasks.get())
    man.wait_done()


def usage():
    s = """
使用说明：
    --url=http://www.baidu.com  指定Url
    --depth=2   指定抓取子链接深度(默认只抓取单个页面)
    --asset-dir=assets  为资源指定二级目录(css/js/image/fonts)，默认assets,例如原来的 /foo/bar.css 会变为 /assets/foo/bar.css
    --html-threads=10   页面抓取线程数目，默认10（如果服务器拒绝[请求过快],设置为1)
    --ignore-query=page 忽略'page'参数，即：foo/bar.php&a=1 foo/bar.php?a=1&page=5 视为同一页面，不重复抓取
    --delay=3           每三秒抓取一个页面(仅用于单线程，防止请求过快)
    --asset-threads=30  资源抓取线程数目，默认30 (这个大部分服务器不会拒绝)
    --allow-hosts=baidu.com 通常带www和不带www的域名视为跨域（不下载），这里指定允许下载跨域的域名
    """
    print(s)


def main():
    global root_dir
    global asset_dir

    arg_keys = [
        'help', 'url=', 'depth=', 'asset-dir=', 'html-threads=','ignore-query=', 'delay=', 'asset-threads=', 'allow-hosts='
    ]
    opts, args = getopt(sys.argv[1:], '', arg_keys)
    cfg = {}
    for k, v in opts:
        cfg[k.lstrip('-')] = v
    if 'help' in cfg:
        return usage()

    # 字符转数字
    def s2i(s, default_, min_, max_):
        try:
            a = int(s)
        except Exception as e:
            return default_
        return max(min(a, max_), min_)

    # url = 'http://www.mertel.cn/m'
    # url = 'http://test.pc'
    url = cfg.get('url', '')
    if not opts:
        url = '' if len(args) < 1 else args[0]

    if not url:
        return usage()

    depth = s2i(cfg.get('depth'), default_=0, min_=0, max_=10)

    if cfg.get('asset-dir'):
        asset_dir = cfg['asset-dir']

    html_tasks.max_threads = s2i(cfg.get('html-threads'), default_=10, min_=1, max_=50)
    asset_tasks.max_threads = s2i(cfg.get('asset-threads'), default_=30, min_=1, max_=50)

    # 开始
    if not url.startswith('http'):
        url = 'http://' + url
    info = urlparse(url)

    # 'user:pwd@localhost:88' => user[pwd]@host.com[port]
    dir_ = re.sub(r'\:(\d+)', '[\\1]', info.netloc)
    dir_ = re.sub(r'\:(.*?)\@', '[\\1]@', dir_)
    root_dir = os.path.join(root_dir, dir_)

    uri, file = url_to_local(url)
    add_task({'url': url, 'depth': depth, 'file': file, 'uri': uri})
    wait_tasks_done()


if __name__ == '__main__':
    main()
