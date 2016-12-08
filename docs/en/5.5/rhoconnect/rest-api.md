# RhoConnect REST API
The RhoConnect REST API allows you to control, monitor, and debug a running RhoConnect application using a simple HTTP API.

Below we describe the REST API using ruby sample code.

> Note: All routes that require admin privileges must pass the API token using the special header

    :::ruby
    'X-RhoConnect-API-TOKEN':api_token_string

## API Errors

All API calls will return http 200 and requested data (if applied). Otherwise, API will return http error code and specific error message in the http message body.

    :::ruby
    def handle_api_error(error_message)
      @errors ||= []
      begin
        yield
      rescue RestClient::Exception => re
        if re.response.body.nil? or re.response.body.length == 0
          @errors << "#{error_message}: [#{re.http_code}] #{re.message}"
        else
          @errors << "#{error_message}: #{re.response.body}"
        end
      rescue Exception => e
        @errors << "#{error_message}: #{e.message}"
      end
    end

    handle_api_error("Can't get license information") do
      @license_info = JSON.parse(
      RestClient.get(
        "#{server}/rc/v1/system/license",
         {'X-RhoConnect-API-TOKEN' => @api_token}
        ).body
      )
    end

## System Resource - POST login

    :::ruby
    POST /rc/v1/system/login

Before you can use RhoConnect API you should login to the RhoConnect server and get API token:

    :::ruby
    require 'rest_client'
    require 'json'

    server = "http://localhost:9292"
    login = "rhoadmin"
    password = ""

    @api_token = RestClient.post("#{server}/rc/v1/system/login", { :login => login, :password => password }.to_json, :content_type => :json)

## System Resource - GET license

    :::ruby
    GET /rc/v1/system/license

Returns license information of the currently used license

    :::ruby
    license_info = RestClient.get(
      "#{server}/rc/v1/system/license",
        {'X-RhoConnect-API-TOKEN' => @api_token}
      ).body

## System Resource - POST reset

    :::ruby
    POST /rc/v1/system/reset

Reset the server: flush db and re-bootstrap server

    :::ruby
    RestClient.post("#{server}/rc/v1/system/reset",
        {}.to_json,
        {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
      )

## System  Resource - GET appserver

    :::ruby
    GET /rc/v1/system/appserver

Returns the url of the plugin's backend from the RhoConnect server.

    :::ruby
    adapter_url = RestClient.get(
      "#{server}/rc/v1/system/appserver",
        {'X-RhoConnect-API-TOKEN' => @api_token}
      ).body

## System Resource - POST appserver

    :::ruby
    POST /rc/v1/system/appserver

Saves the url of the plugin's backend to the RhoConnect server.

    :::ruby
    RestClient.post(
      "#{server}/rc/v1/system/appserver",
        {
          :adapter_url => url
        }.to_json,
        {:content_type => :json,
         'X-RhoConnect-API-TOKEN' => @api_token}
      )

## System Resource - GET stats

    :::ruby
    GET /rc/v1/system/stats

Retrieves stats for a given metric key:

    :::ruby
    RestClient.get(
      "#{server}/rc/v1/system/stats",
      {
      :params => {:metric => 'foo', :start => 0, :finish => -1},
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    )

Retrieves a list of metric keys matching a given pattern.  This supports 'glob' or '*' style pattern matching.  For example, all metric keys associated with 'Product' source adapter methods:

    :::ruby
    RestClient.get(
      "#{server}/rc/v1/system/stats",
      {
      :params => {:names => 'sources:*:Product'},
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    )

## Store Resource - GET doc

    :::ruby
    GET /rc/v1/store/:doc

Return content of a given document stored in Redis.

    :::ruby
    res = RestClient.get(
      "#{server}/rc/v1/store/<docname>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## Store Resource - POST doc

    :::ruby
    POST /rc/v1/store/:doc

Sets the content of the specified server document. Data should be either a string or hash of hashes.
If `append` flag is set to `true` , the data is appended to the current doc (if it exists) instead of replacing it.

    :::ruby
    RestClient.post(
      "#{server}/rc/v1/store/<docname>",
      {
      :data => data,
      :append => false
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
      )

## User Resource - POST user

    :::ruby
    POST /rc/v1/users

Create a user in this RhoConnect application.

    :::ruby
    RestClient.post("#{server}/rc/v1/users",
      {
        :attributes => {
        :login => login,
        :password => password
      }
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    )

## User Resource - DELETE user_id

    :::ruby
    DELETE /rc/v1/users/:user_id

Delete User and all associated devices from the RhoConnect application.

    :::ruby
    RestClient.delete(
      "#{server}/rc/v1/users/<user_id>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    )

## User Resource - PUT user_id

    :::ruby
    PUT /rc/v1/users/:user_id

Update attributes for a user on this RhoConnect application.

    :::ruby
    RestClient.put(
      "#{server}/rc/v1/users/<user_id>",
      {
      :attributes => {
        :a_user_specific_attribute => a_user_specific_attribute_value
      }
      }.to_json,
     {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    )

## User Resource - GET users

    :::ruby
    GET /rc/v1/users

List users registered with this RhoConnect application.

    :::ruby
    users = RestClient.get(
      "#{server}/rc/v1/users",
        {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
      ).body

## User Resource - GET user_id

    :::ruby
    GET /rc/v1/users/:user_id

Returns the information for the specified user.

    :::ruby
    user_info = RestClient.get(
      "#{server}/rc/v1/users/<user_id>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## User Resource - GET clients

    :::ruby
    GET /rc/v1/users/:user_id/clients

List clients (devices) associated with given user.

    :::ruby
    clients = RestClient.get("#{server}/rc/v1/users/<user_id>/clients",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

Returns list of client ids.

## User Resource - DELETE client_id

    :::ruby
    DELETE /rc/v1/users/:user_id/clients/:client_id

Deletes the specified client (device) for the given user.

    :::ruby
    RestClient.delete(
      "#{server}/rc/v1/users/<user_id>/clients/<client_id>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
      )

## User Resource - GET source_id docnames

    :::ruby
    GET /rc/v1/users/:user_id/sources/:source_id/docnames

Return list of document keys associated with given source and user.

If `:user_id` set to '*', this call will return list of keys for 'shared' documents.

    :::ruby
    docs = RestClient.get(
      "#{server}/rc/v1/users/<user_id>/sources/<source_id>/docnames",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## User Resource - POST ping

    :::ruby
    POST /rc/v1/users/ping

Sends PUSH message to all devices of the specified user(s):

    :::ruby
    # :message - message which will be used to display notification popup dialog on the device
    # :badge - iphone specific badge
    # :sound - name of the sound file to play upon receiving PUSH notification
    # :vibrate - number of seconds to vibrate upon receiving PUSH notification
    # :sources - list of data source names to be synced upon receiving PUSH notification
    ping_params = {
        :api_token => token,
        :user_id => [array_of_users],
        :sources => source_name,
        :message => 'hello world',
        :vibrate => 2000,
        :sound => 'hello.mp3'
      }

    RestClient.post(
      "#{server}/rc/v1/users/ping", ping_params.to_json,
      { :content_type => :json,
      'X-RhoConnect-API-TOKEN' => @api_token }
    )

## User Resource - GET source_id doc

    :::ruby
    GET /rc/v1/users/:user_id/sources/:source_id/docs/:doc

Return content of a given source document for the specified user.

    :::ruby
    res = RestClient.get(
      "#{server}/rc/v1/users/<user_id>/sources/<source_id>/docs/<docname>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## User Resource - POST source_id doc

    :::ruby
    POST /rc/v1/users/:user_id/sources/:source_id/docs/:doc

Sets the content of the specified source document for the given user. Data should be either a string or hash of hashes.
If `append` flag is set to `true` , the data is appended to the current doc (if it exists) instead of replacing it.

    :::ruby
    RestClient.post(
      "#{server}/rc/v1/users/<user_id>/sources/<source_id>/docs/<docname>",
      {
      :data => data,
      :append => false
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
      )

## Read State - PUT user source_id

    :::ruby
    PUT /rc/v1/readstate/users/:user_id/sources/:source_id

Sets source poll interval to "current time plus x seconds".

    :::ruby
    RestClient.put(
      "#{server}/rc/v1/readstate/users/<user_id>/sources/<source_id>",
      {
        :refresh_time => 100
      }.to_json,
      { :content_type => :json,
      'X-RhoConnect-API-TOKEN' => @api_token }
    )

This will set the refresh time to 100 seconds from the current time.  Calling `set_refresh_time` with no `:refresh_time` will trigger a refresh on the sync request for the source.

## Source Controller - GET partition_type

    :::ruby
    GET /rc/v1/sources/type/:partition_type

Return list of source adapters for this RhoConnect application for the given partition type.
Partition type can be either `app` or `user`.

    :::ruby
    sources = RestClient.get("#{server}/rc/v1/sources/type/<partition_type>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## Source Controller - GET source_id

    :::ruby
    GET /rc/v1/sources/:source_id

Return attributes associated with a given source:

* `name` - name of the data source
* `poll_interval` - query poll interval; defines how often RhoConnect will call source adapter to query for new data, set to -1 to disable polling, 0 to always poll
* `partition_type` - to share data across all users, set partition to :app; otherwise use `:user` partition (default)
* `sync_type` - set to `:bulk_only` to disable `:incremental` sync; regular sync is `:incremental` (default)
* `queue` - name of the queue for both query and create/update/delete (CUD) jobs (used if no specific queues not specified)
* `query_queue` - name of query queue
* `cud_queue` - name of CUD queue

> Note: query or create/update/delete methods of the source adapter will be executed [asynchronously](async-jobs) if a queue name is defined.

    :::ruby
    attributes = RestClient.get("#{server}/rc/v1/sources/<source_id>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## Source Controller - PUT source_id

    :::ruby
    PUT /rc/v1/sources/:source_id

Updates attributes associated with a given source:

`poll_interval` - query poll interval; defines how often RhoConnect will call source adapter to query for new data, set to -1 to disable polling, 0 to always poll.

    :::ruby
    RestClient.put("#{server}/rc/v1/sources/<source_id>",
      {
      :user_name => user,
      :data => {:poll_interval => 25}
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    ).body

## Client Resource - GET client_id

    :::ruby
    GET /rc/v1/clients/:client_id

Returns client (device) attributes, such as `device_type`, `device_pin`, `device_port`. These attributes are used by [RhoConnect push](push).

    :::ruby
    client_attributes = RestClient.get(
      "#{server}/rc/v1/clients/<client_id>",
      {
       'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## Client Resource - GET source_id docnames

    :::ruby
    GET /rc/v1/clients/:client_id/sources/:source_id/docnames

Returns list of document keys associated with particular client for a given source. These documents are used by the server to sync data with the client.

    :::ruby
    docs = RestClient.get(
      "#{server}/rc/v1/clients/:client_id/sources/:source_id/docnames",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## Client Resource - GET source_id doc

    :::ruby
    GET /rc/v1/clients/:client_id/sources/:source_id/docs/:doc

Return content of a given source document for the specified client.

    :::ruby
    res = RestClient.get(
      "#{server}/rc/v1/clients/<client_id>/sources/<source_id>/docs/<docname>",
      {
      'X-RhoConnect-API-TOKEN' => @api_token
      }
    ).body

## Client Resource - POST source_id doc

    :::ruby
    POST /rc/v1/clients/:client_id/sources/:source_id/docs/:doc

Sets the content of the specified source document for the given client. Data should be either a string or hash of hashes.
If `append` flag is set to `true` , the data is appended to the current doc (if it exists) instead of replacing it.

    :::ruby
    RestClient.post(
      "#{server}/rc/v1/clients/<client_id>/sources/<source_id>/docs/<docname>",
      {
        :data => data,
        :append => false
      }.to_json,
      { :content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token }
    )

## Plugin source_name - POST push_objects

    :::ruby
    POST /app/v1/:source_name/push_objects

Push new objects or object updates to RhoConnect. These changes will be sent to the device the next time it synchronizes.

> Note: you may use [ping](push) to notify client and trigger sync.

    :::ruby
    # list of objects in the canonical hash of hashes structure
    data = {
      '5' => {
        'name' => 'iPhone'
      }
    }
    RestClient.post(
      "#{server}/app/v1/<source_name>/push_objects",
      {
          :user_id => user_id,
        :objects => data
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    )

> Note: Normally, `push_objects` method will refresh the whole :md document in Redis. However, in case of large-size
documents, `push_objects` method can be optimized by invoking only the necessary updates. This can help reducing
the number of transactions with Redis. To force the optimization, user can use the `:rebuild_md => false` flag
in the `push_objects` parameters hash.

## Plugin source_name - POST delete_objects

    :::ruby
    POST /app/v1/:source_name/push_deletes

Delete objects from RhoConnect. These objects will be deleted from the device the next time it synchronizes.

> Note: You may use [ping](push) to notify client and trigger sync.

    :::ruby
    # object_ids is an array of objects to be deleted
    RestClient.post(
      "#{server}/app/v1/<source_name>/push_deletes",
      {
        :user_id => user_id,
        :objects => object_ids
        }.to_json,
       {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    )

> Note: Normally, `push_deletes` method will refresh the whole :md document in Redis. However, in case of large-size
documents, `push_deletes` method can be optimized by invoking only the necessary updates. This can help reducing
the number of transactions with Redis. To force the optimization, user can use the `:rebuild_md => false` flag
in the `push_deletes` parameters hash.

## Plugin sourece_name - POST fast_insert

    :::ruby
    POST /app/v1/:source_name/fast_insert

Push new objects to RhoConnect. Changes are inserted into the Redis set without any checking for previous existence.
This way, the insert is very fast, but user must ensure that the object didn't exist before. No safeguards are implemented.
Use this method only when you can ensure the integrity of the data.

> Note: you may use [ping](push) to notify client after the insert and trigger sync.

    :::ruby
    # list of objects in the canonical hash of hashes structure
    data = {
      '5' => {
        'name' => 'iPhone'
      }
    }
    RestClient.post(
      "#{server}/app/v1/<source_name>/fast_insert",
      {
          :user_id => user_id,
        :objects => data
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    )

## Plugin source_name - POST fast_update

    :::ruby
    POST /app/v1/:source_name/fast_update

Push object updates to RhoConnect. This method doesn't involve pulling the existing data out of Redis. Instead it required user to provide the previous state of the data. This way, this method allows for very fast updates (since it just removes the previous data from set and adds new ones). However, no data integrity checks are performed. Therefore, this method must be used only if user can ensure the integrity of the data (i.e. previous state must exist, otherwise it won't be properly deleted). Also, this method can be used to perform fast appends and deletes for any of the object's attributes (However, you shouldn't use this method to remove all of the attributes, `fast_delete` should be used instead.)

> Note: you may use [ping](push) to notify client after the update and trigger sync.

    :::ruby
    # list of objects in the canonical hash of hashes structure
    # delete_data contains previous state of the object (to be deleted)
    delete_data = {
      '5' => {
        'name' => 'iPhone'
      }
    }
    # data contains new state of the object
    # to be inserted
    data = {
      '5' => {
        'name' => 'HTC'
      }
    }
    RestClient.post(
      "#{server}/app/v1/<source_name>/fast_update",
      {
          :user_id => user_id,
      :delete_data => delete_data,
        :data => data
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    )

## Plugin source_name - POST fast_delete

    :::ruby
    POST /app/v1/:source_name/fast_delete

Push object deletes to RhoConnect. This method doesn't involve pulling the existing data out of Redis and removing all of its attributes. Instead it requires the user to provide all of the object's data in the hash to be removed. This way, this method allows for very fast deletes (since it just removes the object's data from set). However, no data integrity checks are performed. Therefore, this method must be used only if user can ensure the integrity of the data (i.e. supply all of the object's data to be removed, otherwise some object's data will remain in Redis).

> Note: you may use [ping](push) to notify client after the delete and trigger sync.

    :::ruby
    # list of objects in the canonical hash of hashes structure
    # data contains all of the object's data (to be deleted)
    data = {
      '5' => {
        'name' => 'iPhone'
      }
    }
    RestClient.post(
      "#{server}/app/v1/<source_name>/fast_delete",
      {
          :user_id => user_id,
        :data => data
      }.to_json,
      {:content_type => :json,
       'X-RhoConnect-API-TOKEN' => @api_token}
    )