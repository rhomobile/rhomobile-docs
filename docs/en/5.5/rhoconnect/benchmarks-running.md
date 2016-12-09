Running RhoConnect Benchmarks
===

## Introduction

You can execute benchmark tests against your deployment and verify the performance of your Rhoconnect application using the provided `rhoconnect-benchmark` command.
During the test the Rhoconnect benchmark framework will dynamically create a special ephemeral source adapter inside of
your application and perform the 5-step query use-case mimicking the typical device-to-server communication.

Currently, the Rhoconnect Benchmark measures two primary system-wide metrics: Average Time and Throughput.

- Average time (milliseconds per request) is calculated as sum_of_executed_http_request_times/number of http requests.
- Throughput is an integral metric (number of requests per second) calculated as: cumulative_number_of_http_requests_processed/(finish_time_for_last_test - start_time_of_first_test).

NOTE: Both metrics implicitly include the network latency and therefore represent the performance of the whole system `device-network-server`.

## Rhoconnect Benchmark Command

To execute the Rhoconnect Benchmark test, use the `rhoconnect-benchmark` command. This command has the following options:

<table border="1">
	<tr>
		<td width="20">-u</td>
		<td width="200"><code>--url URL</code></td>
		<td>Use URL to specify the targeted Rhoconnect server for benchmarking. If this option is not specified, <code>http://localhost:9292</code> will be used as a default.</td>
	</tr>
	<tr>
		<td width="20">-p</td>
		<td width="200"><code>--payload NUMBER</code></td>
		<td>This options specifies the amount of data to be simulated in the query request (in number of records). Default: 100, which roughly translates into 20 kilobytes.</td>
	</tr>
	<tr>
		<td width="20">-C</td>
		<td width="200"><code>--nclients NUMBER</code></td>
		<td>Specifies how many concurrent clients to emulate during the test. If this option is omitted, then the number of simulated clients will be determined based on the number of available seats in your Rhoconnect application's license.</td>
	</tr>
	<tr>
		<td width="20">-R</td>
		<td width="200"><code>--niterations NUMBER</code></td>
		<td>Specifies how many times each emulated client will perform the test. Default: 10. The more iterations you specify, the more time your test will take, but it will lessen the test result's statistical fluctuations.</td>
	</tr>
	<tr>
		<td width="20">-S</td>
		<td width="200"><code>--save PATH</code></td>
		<td>This option saves the test results in the PATH sub-directory and run the post-processing on the saved files (for example, generate the EXCEL spreadsheet). All the results will be saved under the PATH root directory.</td>
	</tr>
	<tr>
		<td width="20">-x</td>
		<td width="200"><code>--maxpayloadloops NUMBER</code></td>
		<td>This option runs several tests in a loop varying the payload between 1 and NUMBER. The specified interval will be split by 10. For example: -m 500 will produce 10 test executions , first for payload of 1 record, then - for 56, 112, 167, 223, 278, 334, 389, 445, and 500</td>
	</tr>
	<tr>
		<td width="20">-m</td>
		<td width="200"><code>--maxclientloops NUMBER</code></td>
		<td>This option runs several tests in a loop varying number of concurrent clients between 1 and NUMBER. The specified interval will be split by 5. For example: -m 10 will produce 5 test executions , first for 1 client, then - for 3, 6, 8, and 10</td>
	</tr>
	<tr>
		<td width="20">-S</td>
		<td width="200"><code>--simtime NUMBER</code></td>
		<td>This option allows to enforce NUMBER of seconds delay in the source adapter, thus simulating the backend communication round-trip.</td>
	</tr>
	<tr>
		<td width="20">-A</td>
		<td width="200"><code>--advanced</code></td>
		<td>This convenience option combines -m 10, -x 500, and -S <cur_dir/bench_results> - thus running a matrix of tests varying in payload and number of concurrent clients. Also, it saves the results into the `bench_results` subdirectory and runs the available post-processing.</td>
	</tr>
	<tr>
		<td width="20">-D</td>
		<td width="200"><code>--distributed AWSFILE</code></td>
		<td>This option executes the advanced benchmark test using the remote AWS EC2 clients. Currently, this option is only available for the Linux/MacOS machines. See Distributed Benchmark section below for details.</td>
	</tr>
</table>

## Result post-processing
By default, all results are displayed in the console during the test. However, it is possible to save all the results into the file and, additionally, generate the EXCEL files and/or PNG images using the `--save PATH` option. The results are saved for two benchmark metrics: Average Time and Throughput.

### Generate EXCEL spreadsheet
To enable the automatic generation of the EXCEL spreadsheets from the test results, please install the `spreadsheet` gem by using:

	:::term
	$ [sudo] gem install spreadsheet
	
You can read more about the `spreadsheet` gem [here](http://rubygems.org/gems/spreadsheet).
	
### Generate PNG images
To enable the automatic generation of the PNG images from the test results, install the `gruff` gem.
Installation of the GRUFF gem requires an additional installation of several components.
Use [this](http://nubyonrails.com/pages/gruff) guide to install the GRUFF on your machine.

## Distributed Benchmark test
To fully simulate the distributed nature of the device-to-server system, the Rhoconnect Benchmark command allows to you to create distributed clients through the [AWS Cloud Formation](http://aws.amazon.com/cloudformation/).

NOTE: Distributed Rhoconnect Benchmark test will be executed via the AWS Cloud Formation and EC2 services using your account and therefore you will be billed for its usage by Amazon.

In order to run the distributed Benchmark test, you need to have an AWS account and specify its settings in a YAML file, which should have the following structure:

	:::ruby
	:default:
	  :region: desired_aws_region
	  :aws_access_key_id: your_aws_account_key_id
	  :aws_secret_access_key: your_aws_account_secret_access_key
	  :aws_key_pair_name: your_aws_ec2_security_key_pair
	  :aws_ssh_pem_file: location_of_your_aws_ssh_pem_file

Here is the description of each entry in the AWS settings file:

<table border="1">
	<tr>
		<td width="300"><code>:region</code></td>
		<td>Specify the desired AWS region for your EC2 clients. Default is 'us-west-1'. Typically, you need to specify the same region as the location of your Rhoconnect server to minimize the network impact (since communications between different regions will take more time).</td>
	</tr>
	<tr>
		<td width="200"><code>:aws_access_key_id</code></td>
		<td>Your AWS access key ID.</td>
	</tr>
	<tr>
		<td width="200"><code>:aws_secret_access_key</code></td>
		<td>Your AWS secret access key.</td>
	</tr>
	<tr>
		<td width="200"><code>:aws_key_pair_name</code></td>
		<td>In order to create EC2 clients, you will need to create EC2 KeyPair in the desired region. After that KeyPair is created, you will have its name, which should be specified here.</td>
	</tr>
	<tr>
		<td width="200"><code>:aws_ssh_pem_file</code></td>
		<td>For the above KeyPair, you will have the corresponding keypair .PEM file. Download this file to your machine and reference its location here.</td>
	</tr>
</table>
	
Once the AWS settings file is created, you need to make sure that the following gems are installed on your machine:

- fog
- net-ssh-multi

You can install those gems using the `[sudo] gem install <gemname>` command.

Once all the pre-requisites are met, you can run the distributed Rhoconnect Benchmark test with the following command:

	:::term
	$ rhoconnect-benchmark -u `server_url` -D `path_to_aws_settings_file`
	

NOTE: In order to run the distributed Benchmark test, you must provide public server's URL accessible from the outside clients.




