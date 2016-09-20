RhoConnect.js Getting Started
===
Here is a brief description on how to get started with RhoConnect.js. You may use code from
*samples/app-template* directory as a template to start your own application.

## Getting Started
Load the `rhoconnect.js` library:

	<head>
        <script type="text/javascript" charset="utf-8" src="external/jquery/jquery-1.6.1.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="external/jquery/jquery.base64.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="external/jquery/json.js"></script>

        <script type="text/javascript">
            RhoConfig = {
                // is used to form the websql database name as <appName>_<login>
                appName: 'rhoPGapSenchaDataSample',
                // RhoConnect application URL
                syncServer: 'http://rhohub-lars-692f63a7.rhoconnect.com/application'
            };
        </script>

        <script type="text/javascript" charset="utf-8" src="js/rhoconnect-0_9.min.js"></script>
        <script type="text/javascript" charset="utf-8" src="js/your_application.js"></script>
	</head>

## Usage
To use rhoconnect.js, you need to login and initialize rhoconnect.js with model definitions as in the following example.

    function onSomeClick() {
        loginRhoConnect("someUser", "somePass", false).done(function(){
            // start you business logic here, say..

            var syncInterval = setInterval(function(){

                RhoConnect.syncAllSources().done(function(){
                    // performSomeRealWork();
                    // updateSomeUI();
                }).fail(function(errCode, err){
                    alert('Data sync error: ' +errCode);
                    clearInterval(syncInterval);
                    syncInterval = null;
                });

            }, 3 * 1000)
        });
    }

    var modelDefinitions = [
        {
            name: 'Customer',
            fields: [
                {name: 'id',      type: 'int'},
                {name: 'first',   type: 'string'},
                {name: 'last',    type: 'string'},
                {name: 'phone',   type: 'string'},
                {name: 'email',   type: 'string'},
                {name: 'address', type: 'string'},
                {name: 'city',    type: 'string'},
                {name: 'state',   type: 'string'},
                {name: 'zip',     type: 'string'},
                {name: 'lat',     type: 'string'},
                {name: 'long',    type: 'string'}
            ]
        }
    ];

    function loginRhoConnect(username, password, doDataReset) {
        return $.Deferred(function(dfr){

            RhoConnect.login(username, password,
                    new RhoConnect.SyncNotification(), doDataReset).done(function(){

                // Init DB for the user on success
                RhoConnect.init(modelDefinitions /*, dataApiType, syncProgressCallback */).done(function(){
                    dfr.resolve();
                }).fail(function(errCode, errMessage){
                    alert('DB init error: ' +errCode);
                    dfr.reject(errCode, errMessage);
                });

            }).fail(function(errCode, err){
                alert('RhoConnect login error: ' +errCode);
                dfr.reject(errCode, err);
            });

        }).promise();
    }

You can use *RhoConnect.dataAccessObjects()* to obtain data API specific objects to access your data. See the [API reference](reference).