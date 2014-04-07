# Using RhoConnect

RhoConnect is the part of RhoMobile Suite that synchronizes data between a server and a mobile application. It consists of two parts: RhoConnect Server, which interfaces with your back-end systems and/or database, and RhoConnect Client, integrated in RhoMobile by means of the [RhoConnectClient API](../api/RhoConnectClient).

Adding data synchronization via RhoConnect to your RhoMobile application is as simple as enabling the `:sync` flag in your models. This triggers the internal sync system to synchronize data for the model and transparently handle bi-directional updates between the application and the RhoConnect server. By default, the system will automatically keep your data updated in the background but the provided `RhoConnectClient` class allows you to trigger the sync process programmatically and offers fine-grained control of which models to sync.


## Prerequisite

Before you can make use of RhoConnectClient on the device, you need to include the `rhoconnect-client` extension in your `build.yml`

    :::yaml
    extensions: ["rhoconnect-client"]

This extension is added to all newly generated RhoMobile applications by default. If it is missing in yours, you can add it manually.

## Authenticating

The first step in making use of RhoConnect is to authenticate with the RhoConnect server using the [RhoConnectClient.login](../api/RhoConnectClient#mlogin) method.

Ruby syntax:
    :::ruby
    Rho::RhoConnectClient.login('guest', 'password', url_for(:action => :login_callback))
    
    def login_callback
        error_code = @params['error_code'].to_i
        if error_code == Rho::RhoError::ERR_NONE
            # login success, start sync
            Rho::RhoConnectClient.doSync
        else
            if error_code == Rho::RhoError::ERR_CUSTOMSYNCSERVER
                # application defined error message
                msg = @params['error_message']
            end
            if not msg or msg.length == 0
                msg = Rho::RhoError.new(error_code).message
            end
            
            # do something for the login error
        end
    end
            

JavaScript syntax:
    :::javascript
    Rho.RhoConnectClient.login('guest', 'password', function(result) {
        var errorCode = parseInt(result.error_code);
        if (errorCode == Rho.RhoError.ERR_NONE) {
            // login success, start sync
            Rho.RhoConnectClient.doSync();
        } else {
            var errorMessage = result.error_message;
            // do something for the login error
        }
    });


## Setting up notifications

RhoConnectClient uses notifications to provide information about the sync process to the application: which model is currently being processed, how many items have been completed and how many remain. Notifications can be setup once for the entire application lifetime or each time a sync is triggered; your application can use this information to provide feedback to the user displaying different indicators, progress bars etc.

To setup notifications for a model

Ruby syntax:
    :::ruby
    def sync_notify
        # handle the notification
    end
    
    # Request notifications for the "Account" model
    Rho::RhoConnectClient.setNotification('Account',  url_for(:action => :sync_notify))    
    
JavaScript syntax:
    :::javascript
    function syncNotify(params) {
        // handle the notification
    }
    Rho.RhoConnectClient.setNotification('Account', syncNotify);
    
You can also set notifications for all models at once:
    
Ruby syntax:
    :::ruby
    Rho::RhoConnectClient.setNotification('*', url_for(:action => :sync_notify))

JavaScript syntax:
    :::javascript
    Rho.RhoConnectClient.setNotification('*', syncNotify);

## Controlling synchronization programmatically

Call the [RhoConnectClient.doSync](../api/RhoConnectClient#mdoSync) method to start the sync process

Ruby syntax:
    :::ruby
    # start the RhoConnectClient sync process
    Rho::RhoConnectClient.doSync()

    # start sync process with status popup
    Rho::RhoConnectClient.doSync(true)

    # dont show status popup and pass parameters to sync server
    Rho::RhoConnectClient.doSync(false, "param1=abc")

    # sync only sources that have local changes 
    Rho::RhoConnectClient.doSync(false, "", true)

JavaScript syntax:
    :::javascript
    // start the sync process
    Rho.RhoConnectClient.doSync();

    // start sync process with status popup
    Rho.RhoConnectClient.doSync(true);

    // dont show status popup and pass parameters to sync server
    Rho.RhoConnectClient.doSync(false, "param1=abc");

    // sync only sources that have local changes 
    Rho.RhoConnectClient.doSync(false, "", true);

Use the `doSyncSource` method to start the sync process for only one source

Ruby syntax:
    :::ruby
    # start the RhoConnectClient sync process
    Rho::RhoConnectClient.doSyncSource('Account')

    # start sync process with status popup
    Rho::RhoConnectClient.doSyncSource('Account', true)

    # dont show status popup and pass parameters to sync server
    Rho::RhoConnectClient.doSyncSource('Account', false, "param1=abc")

JavaScript syntax:
    :::javascript
    // start the sync process for given source
    Rho.RhoConnectClient.doSyncSource('Account');

    // start sync process with status popup
    Rho.RhoConnectClient.doSyncSource('Account', true);

    // dont show status popup and pass parameters to sync server
    Rho.RhoConnectClient.doSyncSource('Account', false, "param1=abc");

## Handling Notifications

RhoConnectClient returns information about the ongoing synchronization via the notification callback in the form of a `hash`.

The below parameters are included in all notifications:

* `source_id`   – The id of the current model that is synchronizing.
* `source_name` – Name of the model (i.e. “Account”)
* `sync_type`   – Type of sync used for this model: “incremental” or “bulk”
* `status`      – Status of the current sync process. See below for the possible values:

Additionally, depending on the value of `status`, additional information will be present:

### Status "in_progress"

The parameters returned for `in_progress` status vary according to the sync type

#### "incremental" sync parameters

* `total_count`      – Total number of records that exist for this RhoConnect source.
* `processed_count`  – Number of records included in the sync page.
* `cumulative_count` – Number of records processed so far for this source.

#### "bulk" sync parameters

* `partition`     – Current bulk sync partition.
* `bulk_status`   – The state of the bulk sync process as a `hash` with the below values:
    * `start`     – Bulk sync has started for a specific partition
    * `download`  – Bulk sync file download has started
    * `change_db` – New bulk sync database change has started
    * `blobs`     – Bulk sync blob files have started to download
    * `ok`        – Current partition has completed
    * `complete`  – All partitions have completed

### Status "error"

* `error_code`           – HTTP response code of the RhoConnect server error: 401, 500, 404, etc.
* `error_message`        – Response body (if any)
* `server_errors`        – Hash of Type objects of RhoConnect adapter error (if exists):
    * `login-error`          – An error in adapter login method
    * `query-error`          – An error in adapter query method
    * `create-error`         – An error in adapter create method
    * `update-error`         – An error in adapter update method
    * `delete-error`         – An error in adapter delete method
    * `logoff-error`         – An error in adapter logoff method
    * `unknown-client-error` - An error wherein the server cannot find the client ID.
    
Each error contains a `message` key with the error message. For example:

Ruby syntax:
    :::ruby
    err_msg = @params["server_errors"]["query-error"]["message"]

JavaScript syntax:
    :::javascript
    var errMsg = params["server_errors"]["query-error"]["message"];
    

### Status "ok"

* `total_count`      – Total number of records that exist for this RhoConnect source.
* `processed_count`  – Number of records included in the last sync page.
* `cumulative_count` – Number of records processed so far for this source.

### Status "complete"

This status is returned only when the synchronization is complete (all partitions are done synchronizing).

### Status "schema-changed"

This value is present if a `FixedSchema` model has changed during the current sync run. A new bulk sync run should be triggered (by setting `RhoConnectClient.bulksyncState` to 0 followed by a call to `RhoConnectClient.doSync`) and the user should be alerted in the UI.

## Using search

If you have a large dataset in your backend service, you can use the `RhoConnectClient.search` method to perform a server-side search and receive the models that match your query, without having to fetch the whole dataset.

NOTE: this method is available for Ruby only.

Ruby syntax:
    :::ruby
    RhoConnectClient.search(
        {
            'Account',
            :from => 'search',
            :search_params => {
                :FirstName => 'FirstName',
                :LastName => 'LastName'
            },
            :offset => 0,
            :max_results => 10
        },
        url_for(:action => :search_callback)
    )
    
    def search_callback
        status = @params["status"]
        if (status == "ok")
            # success, local database will contain the matching records
        else
            # search error 
        end
    end    

## Stopping Synchronization

Call the `RhoConnectClient.stopSync` method to stop any sync operations currently in progress.

Ruby syntax:
    :::ruby
    Rho::RhoConnectClient.stopSync

JavaScript syntax:
    :::javascript
    Rho.RhoConnectClient.stopSync();

## Logging out

To logout the user from the RhoConnect server and remove the local user session, use the `RhoConnectClient.logout` method.

Ruby syntax:
    :::ruby
    Rho::RhoConnectClient.logout

JavaScript syntax:
    :::javascript
    Rho.RhoConnectClient.logout();

## Related reading

* The [RhoConnectClient API reference](../api/RhoConnectClient) contains the documentation for the `RhoConnectClient` class and its methods
* Detailed documentation for RhoConnect Server is available in the [RhoConnect Guides](../rhoconnect/introduction)
