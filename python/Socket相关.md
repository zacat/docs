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

## WebSocket Server 示例

```python
# 使用系统 asyncio 异步并发模型， 第三方websockets组件, 最低支持 Python3.4 (XP)
# 3.6+ 可使用 async, await 关键字

import asyncio
import websockets

# WebServer Handler, 新的连接
@asyncio.coroutine
def hello(websocket, path):
    name = yield from websocket.recv()
    print("< {}".format(name))

    greeting = "Hello {}!".format(name)
    yield from websocket.send(greeting)
    print("> {}".format(greeting))


start_server = websockets.serve(hello, 'localhost', 8765)
loop = asyncio.get_event_loop()
loop.run_until_complete(start_server)
loop.run_forever()
```

## WebSocket Client 示例

```python
import asyncio
import websockets

@asyncio.coroutine
def on_open(ws):
    print('opened')
    # request = "{'event':'addChannel','channel':'ok_sub_spot_bch_btc_ticker'}"
    request = "{'event':'ping'}"
    yield from ws.send(request)
    print("> %s" % request)


@asyncio.coroutine
def on_close(ws):
    print('closed')


@asyncio.coroutine
def on_message(ws, msg):
    print('msg', msg)


@asyncio.coroutine
def client_main():
    # url = 'wss://real.okex.com:10441/websocket'
    client = yield from websockets.connect(url)
    if client.open:
        try:
            yield from on_open(client)
            while True:
                msg = yield from client.recv()
                yield from on_message(client, msg)
        except websockets.ConnectionClosed:
            pass
        finally:
            yield from on_close(client)
            if not client.closed:
                yield from client.close()


loop = asyncio.get_event_loop()
loop.run_until_complete(client_main())
```

