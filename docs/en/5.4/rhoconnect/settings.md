# RhoConnect settings
All RhoConnect application and source settings located in the `settings/settings.yml` file.
There are two main categories: application environment settings and source settings.

## Application settings
Application-wide settings are specified per deployment environment (`:test`, `:development`, `:production`).
Each of the environment categories must have the following entries:

	:::yaml
	:syncserver: <url>
	:redis: <url|array_of_urls>
	:licensefile: <filename>

`:licensefile`: application's license file.

`:redis`: Redis url. Can be specified as an Array of URLs. In that case, RhoConnect will use several Redis servers (this can be used in case of high-volume data)

`:syncserver`: application's base url.

In addition, you can specify the following settings:

	:::yaml
	:connection_pool_size: <number_of_redis_connections>
	:connection_pool_timeout: <secs>
	:redis_timeout: <secs>
	:poll_interval_default: <secs>
	:bulk_sync_poll_interval: <secs>
	:gcm_api_key: your_gcm_api_key_here
	:node_channel_timeout: <secs>

`:connection_pool_size`: By default, RhoConnect maintains multiple concurrent connections to Redis organized in Connection Pool. This setting allows you to specify the size of the pool. By default, RhoConnect starts with five (5) Redis connections.

`:connection_pool_timeout`: The timeout value for the Redis Connection Pool, in seconds. Specifies how much time a request will wait for an available Redis connection. Default is 30 seconds.

`:redis_timeout:` - timeout setting for Redis commands. Default is 30 seconds.

`:poll_interval_default`: default sync poll interval setting for source adapters, in seconds. This setting is used as a default if source doesn't specify its own value. Also, it is applied to dynamic adapters as a default sync poll interval.

`:bulk_sync_poll_interval`: poll interval setting for bulk data sync, in seconds.

`:gcm_api_key`: The [API key for Google Cloud Messaging](push-client-setup-android#setting-up-android-google-cloud-messaging).

`:node_channel_timeout`: The timeout, in seconds, for requests made from ruby framework to node.js. The default value is __30 seconds__ and is usually fine but it can be modified using this setting if the network requires more time to respond.

## Source settings

All source-specific settings are specified under the corresponding source name entry in the `:sources` category.
Typical source settings include:

	:::yaml
	:poll_interval: <secs>
	:force_default: <true|false>
    :partition_type: <app|user>
    :priority: <num>  

`:poll_interval`: source's sync poll interval in seconds.

`:force_default`: true or false. If specified, this setting forces use of the default application poll interval even if source has its own setting.

`:partition_type`: app or user. default partition type for the source.

`:priority:` A priority number used to determine the order in which the models are processed and synchronized. This is useful when there are a set of linked together sources and the client needs to know in which order to process them.  Priority starts from lower value 1. If priorities are not specified, then there is no guarantee that models will be listed and processed in natural order.