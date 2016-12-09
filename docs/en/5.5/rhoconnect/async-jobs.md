Adapter Jobs with Resque
===

RhoConnect uses the [resque](http://github.com/defunkt/resque) library for managing and executing asynchronous jobs.  Using async jobs are especially useful when your application requires processing large amounts of data, pinging devices using the built-in push support, or you just want to perform some task that will take a long period of time.

## Async Job Types
RhoConnect supports three job types: BulkDataJob, PingJob, SourceJob

### BulkDataJob
[Bulk Data](bulk-sync) jobs are used by RhoConnect to prepare the [bulk sync data files](bulk-sync#data-files).  These jobs are automatically queued by the RhoConnect application, so it is not necessary to queue them manually.

### PingJob
Ping jobs are used to execute a [device ping](push).  A PingJob can be queued from anywhere in your RhoConnect application (i.e. at the end of another job or adapter query method).

Example: 
  
    :::ruby
    Resque.enqueue(
      PingJob,
      {
        "user_id" => current_user.login,
        "message" => "New products available!", 
        "badge" => 1, 
        "sources" => ['Product']
      }
    )

### SourceJob
Source jobs are used to execute source adapter queues asynchronously. 

To make your source adapters always run asynchronously, define a queue in `settings/settings.yml`:

    :::yaml
    Product:
      :queue: product

Then run a resque worker so the job will execute.

Example that queues a new source adapter job manually:

    :::ruby
    Resque.enqueue(
     SourceJob,
     :query,
     APP_NAME,
     'Joe',
     'some-client-id
    )

## Running Async Jobs
Running RhoConnect jobs requires one or more [resque](http://github.com/defunkt/resque) workers running.  For example, to start one resque worker listening for all job queues:

    :::term
    $ cd <your rhoconnect app>
    $ QUEUE=* rake resque:work

To start multiple workers(in this case 5):
  
    :::term
    $ cd <your rhoconnect app>
    $ QUEUE=* COUNT=5 rake resque:workers
  
For more information on the options available when running resque workers, please refer to the [resque readme](https://github.com/defunkt/resque#readme).

If you want to run resque workers in daemon mode, we recommend using [nohup](http://en.wikipedia.org/wiki/Nohup), [god](http://github.com/defunkt/resque/tree/master/examples/god/), or [monit](http://github.com/defunkt/resque/tree/master/examples/monit):

    :::term
    $ mkdir log/; touch log/resque_worker_QUEUE.log # if it doesn't exist
      $ nohup QUEUE=* rake resque:work & &> log/resque_worker_QUEUE.log