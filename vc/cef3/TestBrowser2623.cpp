// TestBrowser2623.cpp : 定义控制台应用程序的入口点。
//

#define WIN32_LEAN_AND_MEAN
#include <Windows.h>
#include <iostream>

#include <include/cef_app.h>
#include <include/cef_client.h>

#include <include/wrapper/cef_helpers.h>
#include <include/wrapper/cef_message_router.h>

#pragma comment(lib, "libcef.lib")
#pragma comment(lib, "libcef_dll_wrapper.lib")


class CefQueryHandler :public CefMessageRouterBrowserSide::Handler {
public:
	CefQueryHandler() {};
	virtual ~CefQueryHandler() { }
	virtual bool OnQuery(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame,
		int64 query_id, const CefString& request, bool persistent, CefRefPtr<Callback> callback) OVERRIDE
	{
		callback->Success(std::wstring(request) + L": ok");
		return true;
	}

	virtual void OnQueryCanceled(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, int64 query_id) OVERRIDE {
	}
};

class ClientHandler : public CefClient,
	public CefLifeSpanHandler,
	public CefDisplayHandler,
	public CefRequestHandler
{
protected:
	int _browsers;
	CefRefPtr<CefMessageRouterBrowserSide> _msg_router;
	CefQueryHandler* _msg_handler;
public:
	virtual bool OnProcessMessageReceived(CefRefPtr<CefBrowser> browser, CefProcessId source_process, CefRefPtr<CefProcessMessage> message) OVERRIDE {
		return _msg_router->OnProcessMessageReceived(browser, source_process, message);
	}

	virtual CefRefPtr<CefLifeSpanHandler> GetLifeSpanHandler() {
		return this;
	}
	virtual CefRefPtr<CefRequestHandler> GetRequestHandler() OVERRIDE { return this; }
	virtual CefRefPtr<CefDisplayHandler> GetDisplayHandler() OVERRIDE { return this; }

	virtual void OnAfterCreated(CefRefPtr<CefBrowser> browser) OVERRIDE{
		++_browsers; 
		if (!_msg_router) {
			CefMessageRouterConfig config;
			_msg_handler = new CefQueryHandler;
			_msg_router = CefMessageRouterBrowserSide::Create(config);
			_msg_router->AddHandler(_msg_handler, false);
		}
	}
	virtual void OnBeforeClose(CefRefPtr<CefBrowser> browser) OVERRIDE {
		if (--_browsers == 0) {
			if (_msg_router) {
				_msg_router->RemoveHandler(_msg_handler);
				delete _msg_handler;
				_msg_router = 0;
			}
			//_msg_router->RemoveHandler()
			::CefQuitMessageLoop();
		}
	}

	virtual bool OnBeforeBrowse(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, CefRefPtr<CefRequest> request, bool is_redirect) OVERRIDE {
		_msg_router->OnBeforeBrowse(browser, frame);
		return false;
	}
	virtual void OnRenderProcessTerminated(CefRefPtr<CefBrowser> browser, TerminationStatus status) OVERRIDE {
		_msg_router->OnRenderProcessTerminated(browser);
	}

private:
	IMPLEMENT_REFCOUNTING(ClientHandler);
};

class ClientApp : public CefApp,
	public CefRenderProcessHandler,
	public CefBrowserProcessHandler
{
protected:
	// Renderer
	CefRefPtr<CefMessageRouterRendererSide> _msg_router;
public:
	virtual CefRefPtr<CefBrowserProcessHandler> GetBrowserProcessHandler()	{ return this; }
	virtual CefRefPtr<CefRenderProcessHandler> GetRenderProcessHandler()	{ return this; }
	virtual void OnContextInitialized() {
		//CEF_REQUIRE_UI_THREAD();
		CefWindowInfo win;
		win.SetAsPopup(NULL, L"测试浏览器");
		CefRefPtr<ClientHandler> client(new ClientHandler);
		CefBrowserSettings settings;
		//CefBrowserHost::CreateBrowser(win, client.get(), L"chrome://version", settings, 0);
		CefBrowserHost::CreateBrowser(win, client.get(), L"http://127.0.0.1/", settings, 0);
	}


	// Renderer
	virtual void OnWebKitInitialized() {
		CefMessageRouterConfig config;
		_msg_router = CefMessageRouterRendererSide::Create(config);
	}
	virtual void OnContextCreated(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, CefRefPtr<CefV8Context> context) OVERRIDE {
		_msg_router->OnContextCreated(browser, frame, context);
		//frame->ExecuteJavaScript(L"cefQuery({request:'test', onSuccess:function(msg){alert(msg);}});", frame->GetURL(), 0);
	}
	virtual void OnContextReleased(CefRefPtr<CefBrowser> browser, CefRefPtr<CefFrame> frame, CefRefPtr<CefV8Context> context) OVERRIDE {
		_msg_router->OnContextReleased(browser, frame, context);
	}
	virtual bool OnProcessMessageReceived(CefRefPtr<CefBrowser> browser, CefProcessId source_process, CefRefPtr<CefProcessMessage> message) OVERRIDE {
		return _msg_router->OnProcessMessageReceived(browser, source_process, message);
	}
private:
	// Include the default reference counting implementation.
	IMPLEMENT_REFCOUNTING(ClientApp);
};



int main(int argc, wchar_t* argv[])
{
	setlocale(LC_ALL, "");
	wprintf(L"测试");

	CefMainArgs main_args(GetModuleHandle(0));
	CefRefPtr<CefApp> app(new ClientApp);
	int succ = CefExecuteProcess(main_args, app.get(), 0);
	if (succ >= 0) {
		return succ;
	}
	CefSettings settings;

	settings.no_sandbox = true;
	//settings.single_process = true;
	//settings.remote_debugging_port = 8088;
	CefString locale(L"zh-CN");
	cef_string_from_wide(locale.c_str(), locale.length(), &settings.locale);


	CefInitialize(main_args, settings, app.get(), 0);
	CefRunMessageLoop();
	CefShutdown();
	return 0;
}


