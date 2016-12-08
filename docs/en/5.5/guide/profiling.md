# Performance Profiling

To perform performance measurements or found applications bottlenecks you can use RhoMobile Profiler tool.

RhoMobile Profiler use performance counters to calculate execution time of specific function/code. There are 2 types of counters: global and local:

* Global counters created once and can be stopped/started many times. When Global counter destroyed, it log accumulative time of all start/stop intervals.
* Local counters can be stopped/started only once. While stopped, counter will log time interval between start and stop.

## Profiler log.
When Counter stopped (Local counters) or destroyed(Global counters) information from counter will be logged in the following format:

(log prefix) PRFILER| (counter name)( (counter time Minutes:Seconds:Milliseconds) ): START/STOP

For example:

I 06/18/2012 23:27:20:311 00002ffc             PROFILER| BROWSER_PAGE (0:03:104) : STOP

## Enable Profiler.
Profiler is configurable at build time in build.yml file(Turned Off by default):

    profiler: 1

Will turn on Profiler

After Profiler ON/OFF - full rebuild is required.

## Built-in performance counters.

These counters start working after you turn on Profiler in build.yml:

* ERB_RENDER - ERB-file render (Ruby)
* CTRL_ACTION - Controller action (Ruby)
* INDEX_ACTION - Index page render
* ERB_RENDER - ERB-file render (Ruby)
* BROWSER_PAGE  - Browser page loading time (Native)
* SyncEngine components has several native counters:

    'Sync' - Full sync time
    
    'DB' - Time spend for database insert/update/delete while sync
    
    'Net' - Time spend for network communication while sync

These counters works only if you create them in application. You can create counter in controller action and destroy it after some operations:

* Sqlite database (Native)

    'SQLITE' - counter for whole time processing SQL query including data conversion , sqlite3_step and prepare statement
    
    'SQLITE_EXEC' - sqlite3_step time only. 

To Enable Ruby Garbage collector logging modify rhoconfig.txt(set log level to Trace):

    MinSeverity = 0

There are two Profiler API available: Ruby and Native(C/C++).

## RhoProfiler Ruby API Examples

The [RhoProfiler Ruby API](..rhodesapi/rhoprofiler-api) contains the following static methods.

* [create_counter](../rhodesapi/rhoprofiler-api#createcounter) creates a Global counter.
* [destroy_counter](../rhodesapi/rhoprofiler-api#destroycounter) destroys a Global counter.
* [start_counter](../rhodesapi/rhoprofiler-api#startcounter) starts a Local or Global counter. If a Global counter with this name exists, this global counter will be started. If no global counter exists, a local counter will be created and started.
* [stop_counter](../rhodesapi/rhoprofiler-api#stopcounter) stops a Global or local counter.
* [flush_counter](../rhodesapi/rhoprofiler-api#flushcounter) logs information from a counter (Local or Global). Counter does not stop or start.
* [start_created_counter](../rhodesapi/rhoprofiler-api#startcreatedcounter) - The counter will start only if it is already created previously (Global counter).

Example of custom counter:<a id="rhomsource-examples"></a>

	:::ruby
	def index
		RhoProfiler.create_counter('Counter1')

        RhoProfiler.start_counter('Counter1')
        function1()
        RhoProfiler.stop_counter('Counter1')

        #do something
        
        RhoProfiler.start_counter('Counter1')
        function2()
        RhoProfiler.stop_counter('Counter1')
                            		
		RhoProfiler.destroy_counter('Counter1') #Will log summary of function1 and function2 execution time
	end

Example using 'SQLITE' built-in counter:

	:::ruby
    def some_method

     RhoProfiler.create_counter('SQLITE')

     #do something: create/update objects for example

     RhoProfiler.destroy_counter('SQLITE')

    end
 
## RhoProfiler C/C++ API.
RhoProfiler C/C++ API contains several defines to manipulate Performance Counters.  Here is the list of defines:

    //Global accumulative counters
    #define PROF_CREATE_COUNTER(name)     // Create Global counter
    #define PROF_DESTROY_COUNTER(name)    // Destroy Global counter
    #define PROF_START(name) //Start Local or Global counter. If Global counter with this name exist , this global counter will started. If no global counter exists, local counter will be created and started.

    #define PROF_STOP(name) // Stop Global or local counter. 
    #define PROF_FLUSH_COUNTER(name,msg) //Log information from counter(Local or Global). Counter does not stopped or started. 
    #define PROF_START_CREATED(name) //Counter will start only if it is already created previously(Global counter)

Example:

	:::ruby
	#include "statistic/RhoProfiler.h"
	void testFunction()
	{
		PROF_CREATE_COUNTER("Counter1");

        PROF_START("Counter1");
        function1();
        PROF_STOP("Counter1");

        //do something
        
        PROF_START("Counter1")
        function2();
        PROF_STOP("Counter1")
                            		
		PROF_DESTROY_COUNTER("Counter1") #Will log summary of function1 and function2 execution time
	}
