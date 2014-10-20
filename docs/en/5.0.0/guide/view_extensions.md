# Native View Extensions

The Native View interface allows developers to implement a custom native view and seamlessly integrate it into the Rhodes framework. (This is currently only supported on iPhone; Android, WM and Blackberry is coming soon).

To access implemented view navigate to a url where url schema is the register type name of your view: 
  
	view_type_name:path?query_string#anchor

Example:

	:::ruby
	WebView.navigate("my_video_view:/app/files/barak_obama_0123.mpg")


When Rhodes application navigates to a native view it will replace current view (WebView in most cases) with requested native view and pass path?query_string#anchor to created native view. If application navigate to that view again new instance of the view will not be created but the rest of url will be passed to the view.

To provide custom native view native extension should implement NativeViewFactory interface and register it with Rhodes framework using `RhoNativeViewManager::registerViewType(const char* viewType, NativeViewFactory* factory)` call (or similar call on BB, see definition below). Rhodes framework will use registered factory to create and display view of given type.  

## Native view manager, factory, and view interface definitions on iPhone, Android, Windows Mobile

	:::cpp
	class NativeView {
	public:
		// that function must return native object provided view functionality :
		// UIView* for iPhone
		// jobject for Android - jobject must be android.view.View class type
		// HWND for Windows Mobile 
		virtual void* getView() = 0;
		// Used by Rhodes to pass path?query_string#anchor to the view
		virtual void navigate(const char* url) = 0;
	};

	class NativeViewFactory {
	public:
		virtual NativeView* getNativeView(const char* viewType) = 0;
		virtual void destroyNativeView(NativeView* nativeView) = 0;
	};

	class RhoNativeViewManager {
	public: 
		static void registerViewType(const char* viewType, NativeViewFactory* factory);
		static void unregisterViewType(const char* viewType);
	};

## Native view manager, factory, and view interface definitions on Blackberry

	:::java
	interface NativeView {
	  net.rim.device.api.ui.Field getView();
	  void navigate(String url);
	}

	interface NativeViewFactory {
	  NativeView getNativeView(String viewType);
	};

	class RhoNativeViewManager extends Object{
	public: 
	  static void registerViewType(String viewType, NativeViewFactory factory);
	  static void unregisterViewType(String viewType);
	};

## Sample
See [Rhodes-System-Api-Samples](http://github.com/rhomobile/rhodes-system-api-samples) for details of how to implement and use the native view interface. This sample implements a "rainbow_view" native view; you should add rainbow to the list of extensions to include it to the application. 

See [/app/NativeView/controller.rb](http://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/NativeView/controller.rb) and [/app/NativeView/index.erb](http://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/NativeView/index.erb) for details how to call native view from your controller.

** NOTE:  Windows Mobile: Visual Studio 2008 has issues with long paths. If you have problems with building rainbow extension, move your rhodes folder to a shorter path. **

* To navigate to rainbow view in your controller, call `WebView.navigate('rainbow_view:red')`. In your url schema indicates view type you want to open and rest of the url (red) passed to the after it was created. 

* To pass parameters to created view you may call WebView.navigate again: `WebView.navigate('rainbow_view:green')`. In your native code you may pass parameters to the native view by calling `pNativeView->navigate(url)` where pNativeView is an instance of native view created by the `RhoNativeViewManager` using registered factory. 

* To close the view you created, navigate to any other url.

See [/extensions/rainbow](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/extensions/rainbow/) for implementation of the "rainbow" native view. 

* See how to register your view type with Rhodes here: [RainbowViewFactoryRegister.cpp](http://github.com/rhomobile/rhodes-system-api-samples/blob/master/extensions/rainbow/ext/rainbow/platform/iphone/Classes/RainbowViewFactoryRegister.cpp)

* See implementation of native view factory here: [RainbowViewFactory.mm](http://github.com/rhomobile/rhodes-system-api-samples/blob/master/extensions/rainbow/ext/rainbow/platform/iphone/Classes/RainbowViewFactory.mm)

* See sample implementation of native view object here: [RainbowView.h](http://github.com/rhomobile/rhodes-system-api-samples/blob/master/extensions/rainbow/ext/rainbow/platform/iphone/Classes/RainbowView.h) and [RainbowView.m](http://github.com/rhomobile/rhodes-system-api-samples/blob/master/extensions/rainbow/ext/rainbow/platform/iphone/Classes/RainbowView.m).

	* In the "rainbow" view you can see several buttons:
		* [Red], [Green], [Blue] buttons change color by calling controller action using rho_net_request(url). Controller in turn execute WebView.navigate("rainbow_view:color") on the same view to change color.
		* [Stop] and [Play] buttons execute native code inside native view object.
		* [Close Native View] button return you to the web view by executing rho_webview_navigate(url, tab_index).

This sample extension uses functionality provided by Rhodes framework and therefore include few framework header files:

* [$(RHO_ROOT)/platform/shared/common/RhoNativeViewManager.h](http://github.com/rhomobile/rhodes/blob/master/platform/shared/common/RhoNativeViewManager.h)
* [$(RHO_ROOT)/platform/shared/common/RhodesApp.h](http://github.com/rhomobile/rhodes/blob/master/platform/shared/common/RhodesApp.h)
* [$(RHO_ROOT)/platform/shared/rubyext/WebView.h](http://github.com/rhomobile/rhodes/blob/master/platform/shared/rubyext/WebView.h)

Make sure the following folders are added to your compiler include path:

* [$(RHO_ROOT)/platform/shared/rubyext](http://github.com/rhomobile/rhodes/tree/master/platform/shared/rubyext/)
* [$(RHO_ROOT)/platform/shared/ruby/include](http://github.com/rhomobile/rhodes/tree/master/platform/shared/ruby/include/)
* [$(RHO_ROOT)/platform/shared](http://github.com/rhomobile/rhodes/tree/master/platform/shared/)
* [$(RHO_ROOT)/platform/shared/ruby/iphone](http://github.com/rhomobile/rhodes/tree/master/platform/shared/ruby/iphone/)
* [$(RHO_ROOT)/platform/shared/common](http://github.com/rhomobile/rhodes/tree/master/platform/shared/common/)

## url_for_nativeview
Examples of how to use the url_for_nativeview method:
    
	url_for_nativeview :name => 'rainbow_view', :param => 'red'
	==> rainbow_view:red


