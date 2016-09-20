Setting Up Push on Backend Application
===

A RhoConnect push to the client consists of executing a RhoConnect ping call. There are three ways to execute a ping call: you can use the RhoConnect REST API to remotely call the ping, perform the ping job directly in a blocking ruby call, or enqueue a resque job to ping asynchronously.

The push message can trigger the following actions in the Rhodes client application: alert with a message, sync one or more sources, vibrate, display a badge, and play a sound file.

## Pushing Remotely with the RhoConnect REST API

You can trigger a push remotely using the [RhoConnect API Ping method](rest-api). This is useful if you want to fully control the push process from a remote server, such as when you use a RhoConnect plugin to connect your backend application to the RhoConnect server application.

**NOTE: If you want to sync all the sources, use 'all' for the source list (the source_name parameter) instead of a comma-separated list of the RhoConnect application source names to sync.**

### Example of Ping for Ruby Backend Application

As an example, here is how to send a PUSH message to all the devices of the specified user(s) from a Ruby backend app:

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

### Example of Ping for .NET Backend Application

As an example, here is how to send a PUSH message to all the devices of the specified user(s) from a .NET backend app:

    private static bool perform_ping(String method, String source_name, String the_message, String vibrate_time, String sound_file,  Hashtable reqHash)
        {
            // add meta information
            reqHash.Add("user_id", [array of users]);
            reqHash.Add("source_id", source_name);
            reqHash.Add("message", the_message);
            reqHash.Add("vibrate", vibrate_time);
            reqHash.Add("sound", sound_file);

            JavaScriptSerializer js = new JavaScriptSerializer();
            string requestBody = js.Serialize(reqHash);
            
            Uri address = new Uri(_endpoint_url + "/rc/v1/users /ping");
            HttpWebRequest request = WebRequest.Create(address) as HttpWebRequest;
            request.ContentType = "application/json";
            request.Method = "POST";
			request.Headers.Add("X-RhoConnect-API-TOKEN", _api_token);

            byte[] byteData = UTF8Encoding.UTF8.GetBytes(requestBody);
            request.ContentLength = byteData.Length;
            using (Stream requestStream = request.GetRequestStream())
            {
                requestStream.Write(byteData, 0, byteData.Length);
            }
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                ;
            }

            return true;
        }

### Example of Ping for Java Backend Application

As an example, here is how to send a PUSH message to all the devices of the specified user(s) from a Java backend app:

	:::java
	private boolean performPing(String method, String sourceName, HashMap<String, Object> hash) {
		hash.put("api_token", apiToken);
		hash.put("source_id", sourceName);
		hash.put("user_id", partition);
		hash.put("message", "hello world");
		hash.put("vibrate", "2000");
		hash.put("sound", "hello.mp3");
		

		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);				 
		HttpEntity<Map> entity = new HttpEntity<Map>(hash, headers);

		ResponseEntity<String> response = restTemplate.exchange(
				endpointUrl + "/rc/v1/users/ping", 
				HttpMethod.POST,
				entity,
				String.class);
		HttpStatus statusCode = response.getStatusCode();

		return(statusCode.value() == 200);
	}

## Pushing Directly from a RhoConnect Source Adapter

When you use a RhoConnect source adapter to connect to your backend service, you can use the PingJob.perform method to perform a ping on your mobile client.

	:::ruby
	PingJob.perform(
	  'user_id' => current_user.login,
	  'sources' => ['Product','Customer'],
	  'message' => 'hello world',
	  'vibrate' => 2000,
	  'sound' => 'hello.mp3'
	)

Let's say we want to execute a ping for the `current_user` at the end of your RhoConnect source adapter query.

	:::ruby
	def query(params=nil)
	  parsed = JSON.parse(RestClient.get("#{@base}.json").body)

	  @result = {} 
	  parsed.each do |item|
	    @result[item["product"]["id"].to_s] = item["product"]
	  end if parsed    
	  PingJob.perform(
	    'user_id' => current_user.login,
	    'sources' => ['Product'],
	    'message' => "There are new products!",
	    'vibrate' => 2000
	  )
	  @result
	end

## Queuing a Resque Job to Push Asynchronously

To queue a ping that is executed asynchronously in a job, you can have PingJob queued from anywhere in your RhoConnect application (i.e. at the end of another job or adapter query method).

	:::ruby
	Resque.enqueue(
	  PingJob,
	  'user_id' => current_user.login,
	  'sources' => ['Product','Customer'],
	  'message' => 'hello world',
	  'vibrate' => 2000,
	  'sound' => 'hello.mp3'
	)

**Note: For this job to execute, you will need to have a resque worker running.  See running [async jobs](async-jobs) for more information.**

## Triggering Push Automatically after Updating RhoConnect Data from Plugins

Whenever a backend application modifies RhoConnect data for one of the sources, you can trigger an automatic push notification to be sent to the user's device(s) whose source data was modified. This will force the user's client application to perform a sync on the modified source.
To enable this, you need to specify the following setting in the `settings.yml` file:

	:::yaml
	:push_notify: 'true'

**Note: The automatic push notification will be applied only to the user-partitioned sources. App-partitioned sources can not trigger an automatic push notification.**
