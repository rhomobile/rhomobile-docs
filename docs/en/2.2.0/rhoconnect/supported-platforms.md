Supported Platforms
===
## Support Matrix

<table class="device-caps">
  <tr>
    <th>OS</th>
    <th>Distribution</th>
    <th>Ruby 1.8.7</th>
    <th>Ruby 1.9.3</th>
    <th>JRuby</th>
    <th>Environment</th>    
  </tr>
  <tr>
    <td class='cap'>Linux</td>
    <td> CentOS / RHEL 5.x & 6.x,<br/>Ubuntu 12.x </td>
    <td> ruby-1.8.7-p371 </td>
    <td> ruby-1.9.3-p392 </td>
    <td class='tbd'> TBD </td>
    <td>Development &<br/>Production</td>
  </tr>
  <tr>
    <td class='cap'>Mac OS </td>
    <td> Mac OS X 10.7/10.8 </td>
    <td> ruby-1.8.7-p371 </td>
    <td> ruby-1.9.3-p392 </td>
    <td class='tbd'> TBD </td>
    <td> Development </td>
  </tr>
  <tr>
    <td class='cap'>Windows</td>
    <td> Windows 7 </td>
    <td> ruby-1.8.7-p371 </td>
    <td> ruby-1.9.3-p374 </td>
    <td class='tbd'> TBD </td>
    <td>Development</td>
  </tr>
</table>

Other Ruby versions and releases might work with RhoConnect gem, but there are no guarantees.   
 
## Release Notes

RhoConnect for Windows is supported only in development environments. The components you should have for this environment are:

* Ruby 1.9.3
* Redis 2.6.x
* Latest RhoConnect and Rhodes gems
* Eclipse 3.6 with latest RhoStudio plugin, or RhoStudio for Windows 32-bit
* Make 3.81
* DevKit for Windows (or other Windows development environment)

RhoConnect for Linux and Mac OS X is supported for both development and production environments. The components you should have for this environment are:

* Ruby 1.9.3
* Nginx HTTP server (1.3.x)
* Redis data store (2.6.x)
* Thin application server
* RhoConnect gem with all required dependencies


## Known Issues

* If you deploy your RhoConnect application deploy on <b>Heroku</b>, then use new [Cedar](http://devcenter.heroku.com/articles/cedar) stack. The Bamboo stack is older than the widespread adoption of bundler, 
so on Bamboo your application is not invoked in the context of your bundle and might not works properly.
