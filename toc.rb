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



section 'rhoelements', 'RhoElements'

section 'rhoelements-devref', 'RhoElements Reference' do
  topic 'rhoelements/rhoelements-introduction', 'Introduction'
  topic 'rhoelements/rhoelements-app-models', 'Application Approaches'
  topic 'rhoelements/rhoelements-install', 'Installation'
  topic 'rhoelements/rhoelements2-webapps', 'Enabling Web Apps'
  topic 'rhoelements/rhoelements2-native', 'Building Native Apps'
  topic 'rhoelements/ConfigurationSettings', 'Configuration Parameters'
  topic 'rhoelements/licensing', 'Licensing'
  topic 'rhoelements/EMMLOverview', 'EMML Overview'
  topic 'rhoelements/FontsInRhoElements', 'Font Handling'
  topic 'rhoelements/SVGvsHTML', 'SVG Applications'
  topic 'rhoelements/RetrievalEvents', 'Retrieval Events'
  topic 'rhoelements/apd-overview', 'APD Overview'
  topic 'rhoelements/apd-printer-type-codes', 'APD Printer Type Codes'
  topic 'rhoelements/apd-programmers-manual','APD Programmers Manual'
  topic 'rhoelements/apd-printer-demo-user-notes','APD Printer Demo User Notes'
  topic 'rhoelements/apd-release-notes','APD Release Notes'
end

section 'rhodes', 'Rhodes'

section 'rhodes-reference', 'Rhodes Reference' do
  topic 'rhodes/introduction',      'Introduction'
  topic 'rhodes/install',           'Install Rhodes'
  topic 'rhodes/generator',         'App Generator'
  topic 'rhodes/rhodes-command-line',         'Rhodes from Command Line'
  topic 'rhodes/build',             'Build Application'
  topic 'rhodes/application',       'App Structure'
  topic 'rhodes/ui',                'User Interface'
  topic 'rhodes/css-framework',     'CSS Framework'
  topic 'rhodes/configuration',     'Configuration'
  topic 'rhodes/device-caps',       'Device Capabilities'
  topic 'rhodes/rhom',              'Local Database and Rhom'
  topic 'rhodes/synchronization',   'Synchronization'
  topic 'rhodes/connect-to-web-services', 'Connecting Directly to Web Services'
  topic 'rhodes/extensions',        'Extending the Rhodes Framework'
  topic 'rhodes/test-log-debug',    'Testing, Logging and Debugging'
  topic 'rhodes/simulator',         'Using RhoSimulator'
  topic 'rhodes/contributing',      'Contributing'
end

section 'rhodescommonapi-reference', 'Mobile APIs' do
  topic 'rhoelements/apicompatibility',      'Legacy APIs'
  topic 'api/application',      'Application'
  topic 'api/barcode',      'Barcode'
  topic 'api/camera',      'Camera'
  topic 'api/cardreader',      'Cardreader'
  topic 'api/Database',      'Database '
  topic 'api/Log',      'Log'
  topic 'api/Network',      'Network'
  topic 'api/NetworkAccess',      'NetworkAccess'
  topic 'api/RhoConnectClient',      'RhoConnectClient'
  topic 'api/Signature',      'Signature'
  topic 'api/system',      'System'
  topic 'api/webview',      'Webview'
end

section 'rhoconnect', 'RhoConnect'

section 'rhoconnect-reference', 'RhoConnect: Getting Started' do
  topic 'rhoconnect/introduction',      'Introduction'
  topic 'rhoconnect/install',           'Installation'
  topic 'rhoconnect/migration',         'Upgrading RhoConnect'
  topic 'rhoconnect/command-line',      'App Generator and Command Line'
  topic 'rhoconnect/supported-platforms', 'Supported Platforms'
  topic 'rhoconnect/rhoconnect-calculator', 'RhoConnect Calculator'
end

section 'rhoconnect-source-adapter-reference', 'RhoConnect: Source Adapters' do
  topic 'rhoconnect/source-adapters',   'Source Adapters'
  topic 'rhoconnect/authentication',    'Adding Device Authentication'
  topic 'rhoconnect/testing',           'Testing and Debugging'
  topic 'rhoconnect/blob-sync',         'Binary Objects and Blob Sync'
  topic 'rhoconnect/async-jobs',        'Adapter Jobs with Resque'
  topic 'rhoconnect/metadata',          'Dynamic Views with Metadata'
end

section 'rhoconnect-plugin-reference', 'RhoConnect: Plugins' do
  topic 'rhoconnect/plugin-intro',      'Introduction'
  topic 'rhoconnect/rails-plugin',      'Rails Plugin'
  topic 'rhoconnect/net-plugin',        '.Net Plugin'
  topic 'rhoconnect/java-plugin',       'Java Plugin'
end

section 'rhoconnect-push-reference', 'RhoConnect: Push Sync' do
  topic 'rhoconnect/push',      'Introduction to Push'
  topic 'rhoconnect/push-client-setup-rps',       'Setup for RhoConnect Push Service'
  topic 'rhoconnect/push-client-setup-android',       'Setup for Android'
  topic 'rhoconnect/push-client-setup-bb',       'Setup for BlackBerry'
  topic 'rhoconnect/push-client-setup-ios',       'Setup for iOS'
  topic 'rhoconnect/push-client-setup',       'Finishing Setup for all Clients'
  topic 'rhoconnect/push-backend-setup',        'Setup on Backend'
  topic 'rhoconnect/push-testing',      'Testing Push'
end

section 'rhoconnect-administration', 'RhoConnect: Administration' do
  topic 'rhoconnect/settings',          'RhoConnect Settings'
  topic 'rhoconnect/web-console',       'Admin Web Interface'
  topic 'rhoconnect/licensing',         'Licensing your App'
  topic 'rhoconnect/benchmarks',        'Rhoconnect Benchmarking'
  topic 'rhoconnect/benchmarks-running','Running Rhoconnect Benchmarks'
  topic 'rhoconnect/stats-middleware',  'Collecting Runtime Stats'
end

section 'rhoconnect-deployment', 'RhoConnect: Deployment' do
  topic 'rhoconnect/preparing-production',         'Preparing for Production'
  topic 'rhoconnect/hosting-rhohub',         'Hosting on RhoHub'
  topic 'rhoconnect/deploying',         'Deploying RhoConnect'
  topic 'rhoconnect/rhoconnect-redis-stack',  'High Availability Deployment on AWS'
end

section 'rhoconnect-api-reference', 'RhoConnect: APIs' do
  topic 'rhoconnect/rest-api',          'RhoConnect REST API'
  topic 'rhoconnectapi/source-adapter-api', 'Source Adapter API'
  topic 'rhoconnectapi/test-api',     'Source Adapter Test API'
end

section 'rhoconnect-advanced', 'RhoConnect: Advanced Topics' do
  topic 'rhoconnect/bulk-sync',         'Big Datasets and Bulk Sync'
  topic 'rhoconnect/extending-rhoconnect-server', 'Extending Rhoconnect App with custom routes'
  topic 'rhoconnect/cud-conflicts',     'Resolving Conflicts'
end

section 'rhoconnect-nonrhodes-client-reference', 'RhoConnect: Clients' do
  topic 'rhoconnect/client',            'Using RhoConnect without Rhodes'
  topic 'rhoconnect/client-objc',       'RhoConnect Client for iOS'
  topic 'rhoconnect/client-java',       'RhoConnect without Rhodes: Android Java'
  topic 'rhoconnectjs/introduction',      'RhoConnect.JS Client'
  topic 'rhoconnectjs/getting-started',   'RhoConnect.JS Getting Started'
  topic 'rhoconnectjs/reference',         'RhoConnect.JS API Reference'
  topic 'rhoconnectjs/creating-app',      'RhoConnect.JS Creating an App'
end


section 'rhoconnect-service-reference', 'RhoConnect: Hosted Services' do
  topic 'rhoconnect/heroku-addon',      'Heroku Addon'
end

section 'rhoconnect-adapters-reference', 'RhoConnect: Vendor Adapters' do
  topic 'rhoconnect/adapters-intro',    'Introduction'
  topic 'rhoconnect/adapters-crm',      'CRM adapters'
end



