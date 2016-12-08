Resolving Conflicts
===

Create,Update,Delete Queue and Potential Conflicts
---

By design, your RhoConnect application supports parallel dispatching of the multiple client's requests via the asynchronous Resque jobs. This scenario can lead to a situation where two or more clients will try to perform create,update, and delete operations at the same time, potentially creating the race condition. For example, this can happen when two users will try to insert or delete the same record simultaneously.
To handle this situation, RhoConnect uses the create,update,delete (or CUD) queue, which is being dispatched continuously. You can inspect this queue before the CUD operation is called and mark the conflicting records for special processing. To do this, you need to override the Source Adapter `validate` method that is called before the CUD queue is dispatched. This method has the following parameters:

<table border="1">
	<tr>
		<td>String</td>
		<td><code>operation</code></td>
		<td>CUD operation marker, one of three: create, update, or delete</td>
	</tr>
	<tr>
		<td>Array Of Record Hashes</td>
		<td><code>cud_queue</code></td>
		<td>CUD queue consisting of CUD request hashes, ordered from oldest to newest. Each entry in the queue contains a hash of CUD records to process. (Each CUD client request can contain more than one record)</td>
	</tr>
	<tr>
		<td>Array Of Client Ids</td>
		<td><code>client_queue</code></td>
		<td>This array is used to map the CUD request in the above queue to a corresponding client ID. i.e. cud_queue[n] request was issued by client_queue[n] client. Please note that there may be several entries from the same client - if they came separately in time</td>
	</tr>
</table>

Below you can see the example of the `validate` method parameters indicating two create requests containing the conflicting records:

	:::ruby
	client_1 = 'cid_1'
	cud_request_1 = { 'temp_cid1_1' => {'name' => 'iPhone'}, 'temp_cid1_2' => {'name' => 'Android'}}
	client_2 = 'cid_2'
	cud_request_2 = { 'temp_cid2_1' => {'name' => 'iPhone'}}  # this record seems to be the duplicate of the record 'temp_cid1_1'
	
	operation = 'create'
	cud_queue = [ cud_request_1, cud_request_2 ]
	client_ids = [ client_1, client_2 ]

Detecting the Conflict and Forcing an Error
---

Using the above `validate` method you can iterate through the queue and detect CUD conflicts based on the desired application logic. Once the conflicting record is found (for example, duplicate create request), you need to mark it by inserting the conflicting record parameters into the special hash structure that is returned by the `validate` method:

	:::ruby
	def validate(operation, cud_queue, client_ids)
	  resulting_meta_hash = {}
	
	  # iterating through the queue
	  cud_queue.each_with_index do |cud_request, index|
	    cud_request_client = client_ids[index]
			
		# iterating through the request records
		cud_request.each do |record_id, record_hash|
		  # ... detecting the conflict here ....
				
		  # !!! found a conflict - force an error
		  error_record_id = record_id
		  record_meta_data = { error_record_id => { :error => 'my_error_string: conflict is detected!!!' }}
	      resulting_meta_hash[index] ||= {}
		  resulting_meta_hash[index].merge!(record_meta_data)
		end
	  end	
      resulting_meta_hash
	end
				
Once the `validate` method returns a non-empty validation metadata hash structure, it will be used in processing the CUD queue. All marked records will not be processed, but instead an error will be sent back to the originating client with the user-provided error message.
 