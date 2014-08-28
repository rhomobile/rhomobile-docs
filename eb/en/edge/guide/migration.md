#Common Migration Issues

Enterprise Browser provides backwards compatibility for PocketBrowser, RhoElements 2.x and RhoMobile 4.x Shared Runtime applications. This part of the migration section is to provide migrations notes on what is common across either Pocket Browser, RhoElements 2.x and RhoMobile 4.x Shared Runtime applications (Non Ruby Only). For specific application migration notes please consult the following guides:

* [PocketBrowser 2.x](../guide/pb2)
* [PocketBrowser 3.x](../guide/pb3)
* [RhoElements 2.x](../guide/elements)
* [RhoMobile 4.x Shared Runtime](../guide/rhomobile)


##Configuration
Although the Enterprise Browser is backwards compatible with RhoElements and PocketBrowser, the configuration file `Config.xml` is not. Do not attempt to use a PocketBrowser or RhoElements configuration file on an Enterprise Browser installation.
All configuration options are available from Config.xml, which on a default installation can be located:

* Windows: `\Program Files\EnterpriseBrowser\Config\Config.xml`
* Android: `/mnt/sdcard/Android/data/com.symbol.enterprisebrowser/Config.xml`

See the Enterprise Browser [Configuration Reference](../guide/configreference) for more details.
