Source Adapter Store API (Ruby)
===
RhoConnect provides a simple redis interface for saving/retrieving arbitrary data. This is useful if you want to save data in your application to be used later (i.e. in an async job or a subsequent source adapter execution).

## get_value(key)
Retrieve a simple value from redis.

    :::ruby
    key = 'hello'

    value = Store.get_value(key)

## put_value(key, value)
Add a simple value to redis. The first array item is the key, the second is the value.

    :::ruby
    key = 'hello'
    value = 'world'

    Store.put_value(key, value)

**NOTE: To delete a value from redis, simply use `put_value(key, nil)`**

## get_data(key)
Retrieve an array or hash from redis.

    :::ruby
    key = 'foo'
    # assuming 'foo' references { '1' => { 'name' => 'iPhone' }}

    data = Store.get_data(key)
    # data now contains { '1' => { 'name' => 'iPhone' }}

## put_data(key, data)
Add an array or hash to redis.

    :::ruby
    key = 'foo'
    data = { '1'=> {'name' => 'iPhone' }}

    Store.put_data(key, data)
    # 'foo' key now contains { '1' => { 'name' => 'iPhone' }}

**NOTE: To delete data from redis, simply use `put_data(key, nil)`**