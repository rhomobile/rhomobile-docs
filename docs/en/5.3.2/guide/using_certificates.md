# Using Certificates
## Windows Mobile and CE
When using RhoMobile, any required certificates beyond the pre-loaded ones can be specified using the `CaFile` configuration setting in Config.xml. This points to a file containing the certificate data. The certificate(s) specified are treated as trusted authorities. Note this only applies to HTTPS requests.

For example, to use certificates in the file 'mycert.pem' the file should be copied to the device and the appropriate entry made in Config.xml, e.g. if the file is in the root directory of the device:

    :::xml
    <CaFile Value=”\\mycert.pem”>

## Android
On Android HTTPS requests can be done in two ways:

* Using system browser navigation with WebView component:
    * There are some differences in usage of these two ways: the system browser uses built-in system-trusted storage for root CAs. Root certificates should be installed from the system menu and will be used by any application that utilizes WebView UI component ( like browsers etc ) and reference navigation will also use this method. Only server SSL auth is currently implemented for WebView. Android 5 introduced the ability to use client auth in a browser and we are planning to implement it in future releases.
* Certificate formats:
    * There are several formats of certificate available and any format is accepted which represents the certificate as encoded text. These typically have the extension .crt or .pem, but what's important is that they contain the certificate data between BEGIN and END lines. Certificates in the .der format are not supported and should be converted, e.g. using OpenSSL as shown below.

## OpenSSL usage
The OpenSSL utility has many command line options which are well documented on the web, e.g. [here](https://www.sslshopper.com/article-most-common-openssl-commands.html) and [here](https://www.openssl.org/docs/HOWTO/certificates.txt):

Some typical usages are shown below:

### Generating a self-signed certificate:
1. You need to have a private key in order to encrypt to the certificate. Either use an existing private key, or generate one for the purpose. The easiest way to generate a basic, no passphrase, one is to use:


> openssl genrsa -out privkey.pem

2. A self-signed certificate can then be generated from the key using:

> openssl req -new -x509 -key privkey.pem -out capturableacert.pem -days 365

3. You will be asked a series of questions. For all _but_ Common Name you can press return to leave the field blank, but for Common Name enter the domain name which will serve the certificate. Add the private key to your web server according to the server's documentation, and add the certificate to the web client as described above.

### Inspecting a certificate
1. To decode the contents of a certificate use:

> openssl x509 -in cacert.pem -text -noout

2. The Common Name is shown as Subject: CN=. The signing authority is shown as Issuer: CN=, which will be the same as Subject for a self-signed certificate.

### Converting a certificate
To convert a .der format certificate to a .pem one use:

> openssl x509 -inform der -in cacert.der -out cacert.pem