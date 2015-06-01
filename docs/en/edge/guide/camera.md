# Camera
From version 5.1 of RhoMobile Suite, you can access the device's Camera capabilities by using the [Camera API](../../latest/api/camera)


## Enabling The Camera API
To use the [Camera API](../../latest/api/camera), include the following extension in your `build.yml`
    :::ruby
    extensions: ["mediacapture"]

After building with this extension, you will have access to the API from within your code

<ul class="nav nav-tabs">
    <li class="active"><a href="#javascriptSend" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby_send" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="javascriptSend">
    <pre class='CodeRay'><code>:::javascript
 	Rho.Camera.takePicture({}, picture_taken_callback);    	
	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby_send">
    <pre class='CodeRay'><code>:::ruby
	Rho::Camera.takePicture({}, :picture_taken_callback)
	</code></pre>
    </div>
</div>


## Choosing the Camera
On most devices there are both front and rear facing cameras. By default, the rear camera is chosen and can be used by calling the `Rho.Camera` namespace. However, the Camera API also supports defining instances of the Camera object in a variety of different ways. This allows you greater control and flexibility in using the API.

### Specifying By Name
One way you can ensure the use of a certain camera on a device is by naming an instance of that camera with the `getCameraByType` method:

<ul class="nav nav-tabs">
    <li class="active"><a href="#js1" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby1" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="js1">
    <pre class='CodeRay'><code>:::javascript
 	var frontCam = Rho.Camera.getCameraByType('front');
 	frontCam.takePicture({}, picture_taken_callback);    	
	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby1">
    <pre class='CodeRay'><code>:::ruby
	frontCam = Rho::Camera.getCameraByType('front');
 	frontCam.takePicture({}, :picture_taken_callback)
	</code></pre>
    </div>
</div> 

>Note: On Windows Mobile/CE the options are `color` for the camera and `imager` for the B/W 2D Imager

## Finding All Cameras
You can also use the `enumerate` method to identify all cameras available on the device. This method will return an array of Camera instances:

<ul class="nav nav-tabs">
    <li class="active"><a href="#js2" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby2" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="js2">
    <pre class='CodeRay'><code>:::javascript
 	var cameras = [];
 	cameras = Rho.Camera.enumerate();

 	// each object in the cameras array will be a Camera object
 	// and can use the properties and methods available

	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby2">
    <pre class='CodeRay'><code>:::ruby
	$cameras = Rho::Camera.enumerate

 	# each object in the cameras array will be a Camera object
 	# and can use the properties and methods available
 	
	</code></pre>
    </div>
</div> 

## Capturing a Picture
The `takePicture` method is used to capture an image and optionally pass in an options object as the first parameter that can control the behavior of the API. The second parameter shown in the example is the executed callback function:

<ul class="nav nav-tabs">
    <li class="active"><a href="#js3" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby3" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="js3">
    <pre class='CodeRay'><code>:::javascript
 	// These properties can also be set individually on the instance
 	// In this example we are setting the properties when 
 	// executing the takePicture method

 	Rho.Camera.takePicture({
 		compressionFormat : "png",
 		desiredWidth :1024,
 		desiredHeight :768,
 		flashMode: "on"
 	}, picture_taken_callback);

	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby3">
    <pre class='CodeRay'><code>:::ruby
 	# These properties can also be set individually on the instance
 	# In this example we are setting the properties when 
 	# executing the takePicture method

 	Rho::Camera.takePicture({
 		compressionFormat => "png",
 		desiredWidth =>1024,
 		desiredHeight =>768,
 		flashMode=> "on"
 	}, picture_taken_callback);
 	
	</code></pre>
    </div>
</div> 


### Callback Status
The callback function will always be executed and will contain an object that will have different properties depending on the result. The `status` property should always be checked to see if the call was successful or if the user canceled the action.

<ul class="nav nav-tabs">
    <li class="active"><a href="#js3a" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby3a" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="js3a">
    <pre class='CodeRay'><code>:::javascript

    function picture_taken_callback(params){

    	// params.status
    	// ok: picture was taken
    	// error: an error occured
    	// cancel: user canceled the action

    	if(params.status =='ok'){

    	}

        if(params.status =='error'){

        }

        if(params.status =='cancel'){

        }

    }
 	

	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby3a">
    <pre class='CodeRay'><code>:::ruby
    def picture_taken_callback

    	// params.status
    	// ok: picture was taken
    	// error: an error occured
    	// cancel: user canceled the action
    	
    	if (@params["status"]=="ok")

    	end

    end
 	
	</code></pre>
    </div>
</div> 


### Retrieving the Image File
In the callback of the `takePicture` method, a parameter called `imageUri` will contain the location of the caputered image

<ul class="nav nav-tabs">
    <li class="active"><a href="#js4" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby4" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="js4">
    <pre class='CodeRay'><code>:::javascript
    Rho.Camera.takePicture({},
    	function(params){
    		console.log(params.imageUri)

    		//Ex on Android: 
    		// -> /data/data/com.rhomobile.rms51/rhodata/db/db-files/IMG_20150512_081051.jpg 
    	});
	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby4">
    <pre class='CodeRay'><code>:::ruby
    Rho::Camera.takePicture({},
    	lambda{ |params|
    		puts(params.imageUri)

    		//Ex on Android: 
    		// -> /data/data/com.rhomobile.rms51/rhodata/db/db-files/IMG_20150512_081051.jpg 
    	});
 	
	</code></pre>
    </div>
</div> 

### Retrieving the Image as DataUri
In some cases, you may want to store the image as a DataURI string instead of an actual file. This is useful when the image size required is a lower resolution and you want to store it directly in a database. To accomplish this, you need to first specify the output format you would like by using the `outputFormat` property. You should specify the ouptput format before you execute the `takePicture` method. The `imageUri` paramter of the callback of the `takePicture` method will contain the dataUri string representation of the image that was captured.

<ul class="nav nav-tabs">
    <li class="active"><a href="#js5" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby5" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="js5">
    <pre class='CodeRay'><code>:::javascript
    Rho.Camera.takePicture({
    		outputFormat:Rho.Camera.OUTPUT_FORMAT_DATAURI
    	},
    	function(params){
    		console.log(params.imageUri)

    		// ->data:image/jpeg;base64,/9j/4WaXRXhpZgAATU0AKgAAA....
    	});
	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby5">
    <pre class='CodeRay'><code>:::ruby
    Rho::Camera.takePicture({
    		outputFormat =>Rho::Camera.OUTPUT_FORMAT_DATAURI
    	},
    	lambda{ |params|
    		puts(params.imageUri)

    		#data:image/jpeg;base64,/9j/4WaXRXhpZgAATU0AKgAAA....
    	});
 	
	</code></pre>
    </div>
</div> 

### Saving to the Gallery
You can also save the image to the device's photo gallery by setting the `saveToDeviceGallery` property to `true`:

<ul class="nav nav-tabs">
    <li class="active"><a href="#js6" data-toggle="tab">JavaScript</a></li>
    <li ><a href="#ruby6" data-toggle="tab">Ruby</a></li>
</ul>

<div class="tab-content">
    <div class="tab-pane fade in active" id="js6">
    <pre class='CodeRay'><code>:::javascript
    Rho.Camera.takePicture({
    		saveToDeviceGallery:true
    	},
    	function(params){
    		//check status
    	});
	</code></pre>
    </div>
    <div class="tab-pane fade " id="ruby6">
    <pre class='CodeRay'><code>:::ruby
    Rho::Camera.takePicture({
    		saveToDeviceGallery=>true
    	},
    	lambda{ |params|
    		
    		#check status
    	});
 	
	</code></pre>
    </div>
</div> 

## Useful Properties

### compressionFormat : STRING

#### Description
The format of the captured image in subsequent calls to takePicture(). If you do not define this property when you use choose_picture with iOS, the type of image in Gallery will be recognized, and the same format will be used for saving the image to applications data. In windows and WP8 devices the format will be always jpg type.  
This Property shall accept/return one among the values mentioned in constant section which starts with [COMPRESSION_FORMAT_](http://docs.rhomobile.com/en/edge/api/camera#Constants)

#### Params
Default: jpg

#### Access

* Instance: This property can be accessed via an instance object of this class:
    `myObject.compressionFormat`

* Default Instance: This property can be accessed via the default instance object of this class

Javascript: `Rho.Camera.compressionFormat`  

Ruby: `Rho::Camera.compressionFormat`

### flashMode : STRING

#### Description
Specifies the flash behavior when taking a picture.  
This Property shall accept/return one among the values mentioned in constant section which starts with [FLASH_](http://docs.rhomobile.com/en/edge/api/camera#Constants)

####Access

* Instance: This property can be accessed via an instance object of this class: `myObject.flashMode`

* Default Instance: This property can be accessed via the default instance object of this class

Javascript: `Rho.Camera.flashMode`  

Ruby: `Rho::Camera.flashMode`