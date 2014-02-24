Data Partitioning & Pass-Through
===

## Data Partitioning

Data is stored in RhoConnect using [redis sets](http://redis.io/commands#set).  The `@result` hash from the `query` method is stored in redis and referred to as the Master Document or MD.

The MD is referenced in RhoConnect by a corresponding partition.  Source adapters can partition data in two ways: user and app.  As you might have guessed, user partitioning stores a copy of the source adapter MD for each user (one copy shared across all devices for a given user).

Likewise, app partitioning stores one copy of the source adapter MD for the entire application (all users and devices share the same data).  App partitioning can be particularly useful if you have source adapter models which retrieve large amounts of data that is fixed from user to user, for example a global product catalog.  Using app partitioning wherever possible ***greatly reduces*** the amount of data in redis.

### App Partition
Enable app partitioning the same way:

    :::yaml
    :sources:
      Product:
      :poll_interval: 300
      :partition_type: app

Now you have a single copy of the `Product` source adapter dataset for all users.

### User Partition
User partitioning is the default mode for source adapters, however you can explicitly define it in `settings/settings.yml` with:

    :::yaml
    :sources:
      Product:
      :poll_interval: 300
      :partition_type: user

### Custom User partitioning
Sometimes, different groups of users share the common source data. To leverage this, you can implement the following method in your Source Adapter Model to provide custom partition names for the users with shared data. In this case, RhoConnect will store the data for MD of the grouped users under your custom name, which will reduce the memory footprint in Redis. From this standpoint, `app` partition is the edge-case of the custom user partitioning where all users share the same data for the particular source. 

To use the custom user partitioning, implement the following class method in your Source Adapter's model:

    :::ruby
    class Product < Rhoconnect::Model::Base
      # group users by the first letter
      def self.partition_name(user_id)
        return user_id[0]
      end
    end

## Pass Through
RhoConnect provides a simple way to keep data out of redis.  If you have sensitive data that you do not want saved in redis, add the `pass_through` option in settings/settings.yml for each source:

**NOTE: When enabling pass_through for a model in your RhoConnect app, it is necessary to also enable pass_through for your client-side app. See the [Rhom Ruby Doc](../guide/rhom_ruby#using-models) section on using models for more information.**

    :::yaml
    :sources:
      Product:
      :pass_through: true

**NOTE: When running query or search the entire data set will be returned from your backend service. **
