Binary Objects and Blob Sync
===
Synchronizing images or binary objects between RhoConnect and the client is declared by having a 'blob attribute' on the [Rhom model](../guide/local_database).  This instructs the client to download the blob attribute's value (in this case a url) separately from the rest of the data and save it to the device file system.

**NOTE: The example below shows how to synchronize an image created by the device's camera, but could be applied to any arbitrary files on the device.**

## Synchronizing from Device to RhoConnect
Suppose you have a [Rhom model](../guide/local_database) called "Image" and you have a [camera callback function](../guide/camera) defined in the Rhodes Image model's controller:

    :::ruby
    def camera_callback
      if @params['status'] == 'ok'
        #create image record in the DB
        image = Image.new({'image_uri'=>@params['image_uri']})
        image.save
        SyncEngine.dosync
      end  
      #reply on the callback
      render :action => :ok, :layout => false
    end
  
When this is executed in a Rhodes application:

* This callback triggers a sync after saving saving an image.  

* Then Rhodes will push the image file to the RhoConnect application by HTTP POST.

* `image.rb#store_blob` is called for pre-processing of the file. 
NOTE: You must implement this method inside of your Source Adapter Model and do not use the tempfile provided by Rack, because RhoConnect processing is asynchronous and there is no guarantee that the temporary file will exist at the actual time when `create` is called.  

The following example stores the file permanently and keeps its `:filename` argument as another object attribute.

    :::ruby
    def store_blob(obj,field_name,blob)
      # ... custom code to store the blob file ...
      my_stored_filename = do_custom_store[blob[:filename]]
      obj['filename'] = my_stored_filename
    end

* The RhoConnect source adapter model tied to this Rhom model processes the blob in the `create` method.

The following example takes the blob and stores it in S3:

    :::ruby
    def create(create_hash)
      # this would be a blob attribute, points to a tempfile
      # containing the raw post data
      name = create_hash["image_uri"]
      # filename we saved in application.rb#store_blob method
      basename = create_hash["filename"]
      S3Object.store(
        basename,
        open(name),
        @bucket,
        :access => :public_read
      )
      basename #=> object id here is the filename
    end

In this example, we store the image blob to s3 so we can query it later.  See the "image" source adapter that comes with [the rhodes-samples-server](https://github.com/rhomobile/rhodes-samples-server/blob/master/sources/image.rb).

## Query for Blobs in the Source Adapter Model

In your query call, you should store the URL to images in the blob attribute so that the device can fetch the image when it synchronizes.

    :::ruby
    def query(params=nil)
      @result={}
      Bucket.find(@bucket).objects.each do |entry|
        new_item = {
        'image_uri-rhoblob' => @baseurl+@bucket+'/'+File.basename(entry.key)
        }
        @result[entry.key] = new_item
      end
      @result
    end

Here we save the image URL to an attribute `image_uri-rhoblob`.  This will correspond to the `image_uri` attribute in our Rhom model above.

**NOTE: In order for Rhodes to automatically recognize a blob attribute, the attribute name must end with "-rhoblob".  In the above example, `image_uri` was our Rhom attribute, so our source adapter model assigned `image_uri-rhoblob` with the blob URL.**

### Blob file name and extension on client
File name is generated on client when downloading. File extension is determine by:

* To specify blob file extension add extension parameter to the blob URL. For example: '&extension=jpg'
* If no extension parameter the blob URL then extension is extracted from blob URL itself(looking for '.' from the end of the URL)
* If still no file extension found, then '.bin' is used

A complete image source adapter model that stores files in S3 might look like:

    :::ruby
    require 'aws/s3'
    class Image < Rhoconnect::Model::Base
      include AWS::S3


      def initialize(source,credential)
        AWS::S3::Base.establish_connection!(
          :access_key_id      => ENV['AMAZON_ACCESS_KEY_ID'],
          :secret_access_key  => ENV['AMAZON_SECRET_ACCESS_KEY']
        )
        @baseurl = 'http://s3.amazonaws.com/'
        @bucket = 'rhodes-samples-images'
        super(source,credential)
      end

      def query(params=nil)
        @result={}
        Bucket.find(@bucket).objects.each do |entry|
          new_item = {
          'image_uri-rhoblob' => @baseurl+@bucket+'/'+File.basename(entry.key)
          }
          @result[entry.key] = new_item
        end
        @result
      end

      def create(create_hash)
        puts "Creating: #{create_hash.inspect}"
        name = create_hash["image_uri"]
        basename = create_hash["filename"]
        S3Object.store(
          basename,
          open(name),
          @bucket,
          :access => :public_read
        )
        basename
      end

      def delete(delete_hash)
        puts "Removing: #{delete_hash.inspect}"
        S3Object.delete delete_hash['id'], @bucket
      end

      def store_blob(obj,field_name,blob)
        # ... custom code to store the blob file ... 
        my_stored_filename = do_custom_store(blob)
        obj['filename'] = my_stored_filename
      end

      def do_custom_store(blob)
        S3Object.store(blob[:filename], blob[:tempfile], @bucket)
      end
    end

## Rhodes Sample Code
See controller and view in the [app/Blob directory](https://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/Blob) of the [System API Samples application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master) for a complete Rhodes code sample.