# Python Socket 相关



## SocketServer 示例

```python
from socketserver import ThreadingMixIn, TCPServer, BaseRequestHandler

class ThreadingTCPServer(ThreadingMixIn, TCPServer):
    daemon_threads = True

class RequestHandler(BaseRequestHandler):
    def handle(self):
        data = self.request.recv(1024)
        print(data.decode('utf-8'))
        self.request.sendall("test2".encode('utf-8'))
	pass

server = ThreadingTCPServer(('127.0.0.1', 18001), RequestHandler)
server.serve_forever()
pass

# client:
def client_test():
    sock = socket.socket()
    sock.connect(('localhost', 18001))
    sock.send('test'.encode('utf-8'))
    data = sock.recv(1024)
```



## WebServer 示例

```python
import os
import socketserver
from http.server import CGIHTTPRequestHandler, HTTPServer

# 新版已有此函数
class ThreadingHTTPServer(socketserver.ThreadingMixIn, HTTPServer):
    daemon_threads = True
	pass

httpd = ThreadingHTTPServer(('localhost', 8080), CGIHTTPRequestHandler)
httpd.serve_forever()

# 如果想处理请求
class MyCGIHandler(CGIHTTPRequestHandler):
    # 修改默认根目录, 新版只需重载构造函数即可
    def translate_path(self, path):
        result = super().translate_path(path)
        curr = os.getcwd()
        return os.path.join('./htdocs', result[len(curr)+1])
    def do_GET(self):
        super().do_GET()
    def do_POST(self):
        super().do_POST()
httpd = ThreadingHTTPServer(('localhost', 8080), MyCGIHandler)


# 如果不想支持CGI
httpd = ThreadingHTTPServer(('localhost', 8080), SimpleHTTPRequestHandler)
```



