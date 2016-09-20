# Using Hyperlinks for Email, Phone Dialing, SMS and others

You can allow your users to send email messages, call phone numbers and send SMS messages using the hyperlink (`<a href="...">`) syntax. Please note not all of these examples could work on simulators! Use real devices for test. Examples are shown below. 

To make phone calls enable the phone capability. This is done by adding the following lines to build.yml:

	:::yaml
	capabilities:
	  - phone

##mailto
	:::html
	<a href="mailto:test@host.com?subject=testing123">Mailto</a>
Note, even for an empty address, you must add the @ symbol: <a href="mailto:@?subject=testing123">Mailto</a>

Blackberry: if you need cc, bcc fields, use rhomailto scheme:
	:::html
    <a href="rhomailto:test@host.com?cc=geny@mail.ru&bcc=vasy@gmail.com&body=testMessage&subject=sub1">Send e-mail to test@host.com</a>
    
##tel
	:::html
	<a href="tel:1-555-531-3255!8335033#!#!9582#">Tel</a>
	<a href="wtai://wp/mc;5195551212" title="Call">Work Tel</a>
	<a href="wtai://wp/mc;5195551213" title="Call">Home Tel</a>
Note, the WML tel description can be found [ here](http://na.blackberry.com/eng/devjournals/resources/journals/oct_2004/wml_101.jsp).

##sms:
	:::html
	<a href="sms:+3581234567">Send SMS to us </a>

Open link in external application (browser for http:// links):
	:::html
	<a href="http://www.google.com/?rho_open_target=_blank">Open Google in external browser</a>

Open appstore on iphone: [http://wiki.akosma.com/IPhone_URL_Schemes#App_Store](http://wiki.akosma.com/IPhone_URL_Schemes#App_Store)

## Using from Ruby
When using jQuery and/or jQuery Mobile in application code, you cannot use usual html links for hyperlinks. You need to call controller action and call WebView.navigate from there:

    #Ajax call of controller method:
    $.get("/app/TestController/send_mail",function(data) {});
    
    #TestController method:
    def send_mail
        WebView.navigate( 'mailto:test@host.com' )        
        #to open url in external application you can use System.open_url
    end