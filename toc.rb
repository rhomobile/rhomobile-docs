section 'intro', 'Introduction'

section 'getting-started', 'Getting Started' do
  topic 'home',                 'Home'
  topic 'rhomobile-install',   'RhoMobile Suite Install'
  topic 'rhoelements/rhoelements-tutorial',   'RhoElements Tutorial'
  topic 'rhostudio.tutorial',   'RhoStudio Tutorial'
  topic 'rhoconnect/tutorial',  'RhoConnect Tutorial'
  topic 'rhohub/tutorial',      'RhoHub Tutorial'
  topic 'rhostudio-rhohub',      'Building RhoStudio Apps on RhoHub'
  topic 'tutorials',            'How To'
  topic 'architecturefaq',      'Architecture FAQ'
  topic 'faq',                  'Programming FAQ'
  topic 'credits',                  'Credits'
end



section 'rhomobile', 'RhoMobile'

section 'rhodescommonapi-reference', 'Mobile APIs' do
  topic 'api/apiusage',      'API Summary'
  topic 'api/Application',      'Application'
  topic 'api/barcode',      'Barcode'
  topic 'api/camera',      'Camera'
  topic 'api/cardreader',      'CardReader'
  topic 'api/Database',      'Database '
  topic 'api/Log',      'Log'
  topic 'api/Network',      'Network'
  topic 'api/Orm',      'Orm'
  topic 'api/OrmModel',      'OrmModel'
  topic 'api/RhoConnectClient',      'RhoConnectClient'
  topic 'api/signature',      'Signature'
  topic 'api/system',      'System'
  topic 'api/webview',      'Webview'
end


section 'rhomob-setup', 'Setup & Architecture' do
  topic 'rhodes/introduction',      'Introduction'
  topic 'rhomobile-install',   'RhoMobile Suite Install'
  topic 'rhodes/build',             'Native SDK Setup'
  topic 'rhoelements/rhoelements-app-models', 'Application Approaches'
  topic 'rhoelements/rhoelements2-webapps', 'Enabling Web Apps'
  topic 'rhoelements/rhoelements-introduction', 'Motorola Webkit'
  topic 'rhodes/application',       'App Structure'
  topic 'rhodes/ui',                'User Interface'
  topic 'rhodes/css-framework',     'CSS Framework'

end

section 'rhomob-apps', 'Developing Apps' do
  topic 'rhodes/generator',         'App Generator'
  topic 'rhoelements/rhoelements2-native', 'Building Apps With RhoStudio'
  topic 'rhostudio-rhohub',      'Building Apps on RhoHub'
  topic 'rhodes/rhodes-command-line',         'Rhodes from Command Line'
  topic 'rhodes/configuration',     'Configuration'
  topic 'rhoelements/ConfigurationSettings', 'Configuration Parameters'
  topic 'rhodes/extensions',        'Extending the Rhodes Framework'
  topic 'rhoelements/licensing', 'Licensing'
end

section 'rhomob-test', 'Testing & Debugging' do
  topic 'rhodes/test-log-debug',    'Testing, Logging and Debugging'
  topic 'rhodes/simulator',         'Using RhoSimulator'
end

section 'rhomob-dev', 'Device Capabilities' do
  topic 'guide/orientation',       'Accelerometer'
  topic 'guide/alerts',       'Alerts'
  topic 'guide/android',       'Android Usage'
  topic 'guide/barcode',       'Barcode'
  topic 'guide/blackberry',       'Blackberry Usage'
  topic 'guide/bluetooth',       'Bluetooth'
  topic 'guide/camera',       'Camera'
  topic 'guide/pim',       'Contacts & Calendar'
  topic 'guide/apps',       'External Apps'
  topic 'guide/filesystem',       'File System'
  topic 'guide/geolocation',       'Geolocation'
  topic 'guide/html5',       'Html5 Features'
  topic 'guide/localization',       'Localization'
  topic 'guide/maps',       'Mapping'
  topic 'guide/media',       'Media'
  topic 'guide/nfc',       'NFC'
  topic 'guide/printing',       'Printing'
  topic 'guide/push',       'Push Notifications'
  topic 'guide/ringtone',       'Ringtone'
  topic 'guide/signature',       'Signature'
  topic 'guide/system',       'System'
  topic 'guide/timer',       'Timer'
  
end  

section 'rhomob-data', 'Data Handling' do
  topic 'rhodes/rhom',              'Local Database and Rhom'
  topic 'rhodes/synchronization',   'Synchronization'
  topic 'rhodes/connect-to-web-services', 'Connecting Directly to Web Services'
end  

section 'rhoconnect', 'RhoConnect'

section 'rhoconnect-reference', 'Getting Started' do
  topic 'rhoconnect/introduction',      'Introduction'
  topic 'rhoconnect/install',           'Installation'
  topic 'rhoconnect/migration',     'Migrating to RhoConnect 4.0'
  topic 'rhoconnect/command-line',      'App Generator and Command Line'
  topic 'rhoconnect/supported-platforms', 'Supported Platforms'
  topic 'rhoconnect/rhoconnect-calculator', 'RhoConnect Calculator'
end

section 'rhoconnect-source-adapter-reference', 'Source Adapters' do
  topic 'rhoconnect/source-adapters-intro', 'Introduction'
  topic 'rhoconnect/source-adapters',   'Source Adapters (Ruby)'
  topic 'rhoconnect/source-adapters-js',   'Source Adapters (JavaSctipt)'
  topic 'rhoconnect/authentication',    'Adding Device Authentication'
  topic 'rhoconnect/testing',           'Testing and Debugging'
  topic 'rhoconnect/blob-sync',         'Binary Objects and Blob Sync'
  topic 'rhoconnect/async-jobs',        'Adapter Jobs with Resque'
  topic 'rhoconnect/metadata',          'Dynamic Views with Metadata'
  topic 'rhoconnect/data-partitioning',     'Data Partitioning & Pass-Through'
end

section 'rhoconnect-plugin-reference', 'Plugins' do
  topic 'rhoconnect/plugin-intro',      'Introduction'
  topic 'rhoconnect/rails-plugin',      'Rails Plugin'
  topic 'rhoconnect/net-plugin',        '.Net Plugin'
  topic 'rhoconnect/java-plugin',       'Java Plugin'
end

section 'rhoconnect-push-reference', 'Push Sync' do
  topic 'rhoconnect/push',      'Introduction to Push'
  topic 'rhoconnect/push-client-setup-rps',       'Setup for RhoConnect Push Service'
  topic 'rhoconnect/push-client-setup-android',       'Setup for Android'
  topic 'rhoconnect/push-client-setup-bb',       'Setup for BlackBerry'
  topic 'rhoconnect/push-client-setup-ios',       'Setup for iOS'
  topic 'rhoconnect/push-client-setup',       'Finishing Setup for all Clients'
  topic 'rhoconnect/push-backend-setup',        'Setup on Backend'
  topic 'rhoconnect/push-testing',      'Testing Push'
end

section 'rhoconnect-administration', 'Administration' do
  topic 'rhoconnect/settings',          'RhoConnect Settings'
  topic 'rhoconnect/web-console',       'Admin Web Interface'
  topic 'rhoconnect/licensing',         'Licensing your App'
  topic 'rhoconnect/benchmarks',        'Rhoconnect Benchmarking'
  topic 'rhoconnect/benchmarks-running','Running Rhoconnect Benchmarks'
  topic 'rhoconnect/stats-middleware',  'Collecting Runtime Stats'
end

section 'rhoconnect-deployment', 'Deployment' do
  topic 'rhoconnect/preparing-production',         'Preparing for Production'
  topic 'rhoconnect/hosting-rhohub',         'Hosting on RhoHub'
  topic 'rhoconnect/deploying',         'Deploying RhoConnect'
  topic 'rhoconnect/rhoconnect-redis-stack',  'High Availability Deployment on AWS'
end

section 'rhoconnect-api-reference', 'APIs' do
  topic 'rhoconnect/rest-api',          'RhoConnect REST API'
  topic 'rhoconnectapi/source-adapter-controller-api-ruby', 'Source Adapter Controller API (Ruby)'
  topic 'rhoconnectapi/source-adapter-model-api-ruby', 'Source Adapter Model API (Ruby)'
  topic 'rhoconnectapi/test-api-ruby',     'Source Adapter Test API (Ruby)'
  topic 'rhoconnectapi/source-adapter-controller-api-js', 'Source Adapter Controller API (JavaScript)'
  topic 'rhoconnectapi/source-adapter-model-api-js', 'Source Adapter Model API (JavaScript)'
end

section 'rhoconnect-advanced', 'Advanced Topics' do
  topic 'rhoconnect/bulk-sync',         'Big Datasets and Bulk Sync'
  topic 'rhoconnect/extending-rhoconnect-server', 'Extending Rhoconnect App with custom routes'
  topic 'rhoconnect/cud-conflicts',     'Resolving Conflicts'
end

section 'rhoconnect-nonrhodes-client-reference', 'Clients' do
  topic 'rhoconnect/client',            'Using RhoConnect without Rhodes'
  topic 'rhoconnect/client-objc',       'RhoConnect Client for iOS'
  topic 'rhoconnect/client-java',       'RhoConnect without Rhodes: Android Java'
  topic 'rhoconnectjs/introduction',      'RhoConnect.JS Client'
  topic 'rhoconnectjs/getting-started',   'RhoConnect.JS Getting Started'
  topic 'rhoconnectjs/reference',         'RhoConnect.JS API Reference'
  topic 'rhoconnectjs/creating-app',      'RhoConnect.JS Creating an App'
end


section 'rhoconnect-service-reference', 'Hosted Services' do
  topic 'rhoconnect/heroku-addon',      'Heroku Addon'
end

section 'rhoconnect-adapters-reference', 'Vendor Adapters' do
  topic 'rhoconnect/adapters-intro',    'Introduction'
  topic 'rhoconnect/adapters-crm',      'CRM adapters'
end



