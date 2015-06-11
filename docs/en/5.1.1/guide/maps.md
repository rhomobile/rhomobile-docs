# MapView

The MapView class provides an embeddable map interface, similar to the one provided by the Maps application. Click the links below for detailed information about the [MapView API methods](../rhodesapi/mapview-api).

 * [create](../rhodesapi/mapview-api#create) - Create a map on your device.
 * [set_file_caching_enable](../rhodesapi/mapview-api#setfilecachingenable) - Enable file caching for map tiles. The file cache can be used for offline map browsing.
 * [preload_map_tiles](../rhodesapi/mapview-api#preloadmaptiles) - Preload a map tiles for a region defined by a zoom level range.

### MapView Settings

The supported providers are 'Google', 'ESRI', "RhoGoogle" and "OSM".<a id="mapview-settings"></a>

To use ESRI maps in your projects on iPhone:

* Install [ESRI iOS SDK](http://resources.arcgis.com/content/arcgis-iphone/api) - use default folders during installations !
* Add "esri" to your applications extensions list in build.yml file.

To use native Google map view on Android:

* Install Google Add-on API using Android SDK Manager
* Setup Google Play Map service and create [Google Maps V2 API key](https://developers.google.com/maps/documentation/android/start#the_google_maps_api_key)
* Add 'apikey' parameter and 'gmaps' extension to your build.yml
    
        android:
            apikey: <YOUR-GOOGLE-PLAY-API-KEY>
            extensions: [gmaps]

* Add 'network_state' and 'sdcard' capabilities to your build.yml.

        capabilities:
            - network_state

Map settings in rhoconfig.txt :

* ESRI_map_url_roadmap - URL of ESRI roadmap tile map server (example:  'http://server.arcgisonline.com/ArcGIS/rest/services/World_Street_Map/')
* ESRI_map_url_satellite - URL of ESRI satellite tile map server (example:  'http://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/')
* OSM_map_url_roadmap - URL of OSM tile map server (example:  'http://tile.openstreetmap.org/')

### MapView Examples

The following code in your controller has the map appear on a whole page.<a id="mapview-example-create"></a>

Ruby example:

	:::ruby
	map_params = {
	     :provider => 'Google',
	     :settings => {:map_type => "hybrid",:region => [@params['latitude'], @params['longitude'], 0.2, 0.2],
	                   :zoom_enabled => true,:scroll_enabled => true,:shows_user_location => false,
	                   :api_key => 'Google Maps API Key'},
	     :annotations => [{:latitude => @params['latitude'], :longitude => @params['longitude'], :title => "Current location", :subtitle => ""},
	                      {:street_address => "Cupertino, CA 95014", :title => "Cupertino", :subtitle => "zip: 95014", 
	                       :url => "/app/GeoLocation/show?city=Cupertino"},
	                      {:street_address => "Santa Clara, CA 95051", :title => "Santa Clara", :subtitle => "zip: 95051", 
	                       :url => "/app/GeoLocation/show?city=Santa%20Clara", :pass_location => true}]
	}
	MapView.create map_params

JavaScript example:

	var map_params = {
	  provider: 'Google',
	  settings: {
	    map_type: 'hybrid',
	    region: [@params['latitude'], @params['longitude'], 0.2, 0.2],
	    zoom_enabled: true,
	    scroll_enabled: true,
	    shows_user_location: false,
	    api_key: 'Google Maps API Key'
	    }, 
	  annotations: [
	    {latitude: @params['latitude'], longitude: @params['longitude'], title: "Current location", subtitle: ""},
	    {street_address: "Cupertino, CA 95014", title: "Cupertino", subtitle: "zip: 95014", url: "/app/GeoLocation/show?city=Cupertino"},
	    {street_address: "Santa Clara, CA 95051", title: "Santa Clara", subtitle: "zip: 95051", url: "/app/GeoLocation/show?city=Santa%20Clara"}
	    ]
	  };
	Rho.MapView.create(map_params);

You can enable file caching for map tiles - file cache can use for offline map browsing.<a id="mapview-example-preload"></a>

	:::ruby
	MapView.set_file_caching_enable(1)

Preload map tiles for region (0<=zoom<=18):
	:::ruby
	  def preload_callback
	       puts '@@@@@@@@@      Preload Callback       STATUS['+@params['status']+']   PROGRESS['+@params['progress']+']'
	  end
	
	  def preload_map
	      options = { :engine => 'OSM',
	          :map_type => 'roadmap',
	          :top_latitude => 60.1,
	          :left_longitude => 30.0,
	          :bottom_latitude => 59.7,
	          :right_longitude => 30.6,
	          :min_zoom => 9,
	          :max_zoom => 11
	        }
	      total_tiles_for_preload_count = MapView.preload_map_tiles(options, url_for(:action => :preload_callback))    
	      redirect :action => :index
	  end

### Sample
See GeoLocation/controller.rb of [system API sample application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/GeoLocation/controller.rb) for some of the examples of how to use MapView class.
