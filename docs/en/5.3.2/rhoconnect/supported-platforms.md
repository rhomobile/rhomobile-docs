Supported Platforms
===
## Support Matrix

RhoConnect gem is available on the following platforms:

<table class="device-caps">
  <tr>
    <th>OS</th>
    <th>Distribution</th>
    <th>Ruby 1.9.3</th>
    <th>Ruby 2.0.0</th>
    <th>JRuby</th>
    <th>Environment</th>
  </tr>
  <tr>
    <td class='cap'>Linux</td>
    <td> CentOS / RHEL 5.x & 6.x,<br/>Ubuntu 12.04 </td>
    <td> ruby-1.9.3-p448 </td>
    <td class='tbd'> TBD </td>
    <td class='tbd'> jruby-1.7.4 </td>
    <td>Development &<br/>Production</td>
  </tr>
  <tr>
    <td class='cap'>Mac OS </td>
    <td> Mac OS X 10.7/10.8 </td>
    <td> ruby-1.9.3-p448 </td>
    <td class='tbd'> TBD </td>
    <td class='tbd'> jruby-1.7.4 </td>
    <td> Development </td>
  </tr>
  <tr>
    <td class='cap'>Windows</td>
    <td> Windows 7 </td>
    <td> ruby-1.9.3-p448 </td>
    <td class='tbd'> TBD </td>
    <td class='tbd'> jruby-1.7.4 </td>
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

RhoConnect for Linux is supported for both development and production environments.
On Linux servers RhoConnect is available in the format of [Debian (deb) and Red Hat (rpm) packages](http://edgedocs.rhomobile.com/rhoconnect/deploying) for Ubuntu and CentOS respectively.
RhoConnect Mac OS X is supported in development environment.
The components you should have for this environment are:

* Ruby 1.9.3
* Nginx HTTP server (1.4.x)
* Redis data store (2.6.x)
* Thin application server
* RhoConnect gem with all required dependencies

## Known issues for JRuby:

* Usually JDK is shipped with only weak encryption, and that simply will not allow the proper key sizes being created by openssl. RhoConnect uses strong encryption for license keys and to function properly in JRuby environment installation of Java Cryptography Extension (JCE) Unlimited Strength Jurisdiction policy files might be required.
* Path to user’s gems, warbler data should not include white spaces (i.e. in user's account name).


