# Source Adapter Model API (Ruby)

Your RhoConnect source adapter model can use any of these methods to interact with your backend service. Refer to the [source adapter sample](../rhoconnect/source-adapters#sample-adapter) for a complete example.

## login

Login to your backend service (optional).

	:::ruby
	def login
	  MyWebService.login(current_user.login)
	end

## logoff
Logoff from your back-end service (optional).

	:::ruby
	def logoff
	  MyWebService.logoff(current_user.login)
	end

## query
Query your back-end service and build a hash of hashes (required). The `query_params` parameter in this method is nil by default but you can use it to pass custom data from the client to the RhoConnect server using [`RhoConnectClient.doSyncSource()`](../api/RhoConnectClient#mdoSyncSource) method. Typically this is done when you want to implement some custom query behavior.

**NOTE: This method must assign `@result` to a hash of hashes.  If @result is `nil` or `{}`, the master document will be erased from redis.**

	:::ruby
	def query(query_params = nil)
	  parsed = JSON.parse(RestClient.get("#{@base}.json").body)

      @result = {}
	  parsed.each do |item|
	    @result[item["product"]["id"].to_s] = item["product"]
	  end if parsed
	end

## search
Search your back-end based on params and build a hash of hashes (optional).  Similar to query, however the master document accumulates the data in `@result` instead of replacing when it runs.

	:::ruby
	def search(params)
	  parsed = JSON.parse(RestClient.get("#{@base}.json").body)

      @result = {}
	  parsed.each do |item|
		if item["product"]["name"].downcase == params['name'].downcase
	      @result[item["product"]["id"].to_s] = item["product"]
	    end
	  end if parsed
	end

Next, you will need to add search to your Rhodes application. For details, see the [Rhodes search section](../guide/using_rhoconnect#filtering-datasets-with-search).

## create
Create a new record in the back-end (optional).

**NOTE: RhoConnect can establish a 'link' between the local record id provided by the client and the new record id provided by the backend service.  To enable this link, return the new record id as a string.**

	:::ruby
	def create(create_hash)
	  res = MyWebService.create(create_hash)

	  # return new product id so we establish a client link
	  res.new_id
	end

## update

Update an existing record in the backend (optional).

	:::ruby
	def update(update_hash)
	end

## delete

Delete an existing record in the backend (optional).

	:::ruby
	def delete(delete_hash)
	  MyWebService.delete(delete_hash['id'])
	end

## current_user

Returns the current user which called the adapter.  For example, you could filter results for a specific user in  your query method:

	:::ruby
	def query
	  @result = MyWebService.get_records_for_user(current_user.login)
	end

## stash_result

Saves the current state of `@result` to redis and assigns it to `nil`.  Typically this is used when your adapter has to paginate through backend service data.

 	:::ruby
	def query
	  @result = {}
	  ('a'..'z').each_with_index do |letter,i|
		@result ||= {}
	    @result.merge!( DictionaryService.get_records_for(letter) )
		stash_result if i % 2 == 0
	  end
	end

## store_blob

If your Rhodes application sends blobs as a part of the create/update operation - you must implement this method inside of your Source Adapter Model and do not use default implementation where blob is stored in the tempfile provided by Rack, because RhoConnect processing is asynchronous and there is no guarantee that the temporary file will exist at the actual time when `create` is called.  

The following example stores the file permanently and keeps its `:filename` argument as another object attribute.

	:::ruby
	def store_blob(obj,field_name,blob)
	  # ... custom code to store the blob file ... 
	  my_stored_filename = do_custom_store[blob[:filename]]
      obj['filename'] = my_stored_filename
    end

## self.partition_name

Sometimes, different groups of users share the common source data. To leverage this, you can implement the following method in your Source Adapter Model to provide custom partition names for the users with shared data. In this case, RhoConnect will store the data for MD of the grouped users using your custom partition name, which will reduce the memory footprint in Redis. From this standpoint, `app` partition is the edge-case of the custom user partitioning where all users share the same data for the particular source. 

To use the custom user partitioning, implement the following class method in your Source Adapter's model:

	:::ruby
	class Product < Rhoconnect::Model::Base
		# group users by the first letter
		def self.partition_name(user_id)
		 	return user_id[0]
		end
	end

## get_data

You can access your model's document data by with `get_data` method. By default, when called without arguments - it returns the Master Document (:md).

	:::ruby
	# some custom controller's method that has access to model
	def my_custom_method
	  my_model_md = @model.get_data
	end