# Localization 

See [Rhodes System API Samples application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/Localization/index.erb) as an example.

Rhodes use localization_simplified library to support non-English languages.

Add to build.yml:

	extensions: ["rholang"]

In case of several extensions, insert space after extension name and comma:

	extensions: ["rholang", "net-http"]

Create utf-8 encoded file in app `<app_folder>/app/lang/lang_<lang_id>_<country_id>.rb` or `<app_folder>/app/lang/lang_<lang_id>.rb`. This file will be automatically loaded by rhodes based on current locale.

For Example create lang_en.rb:
	:::ruby
	module Localization
		Views = {
			:greeting => "This is test"
		}
	end

And use this string in the view:
	:::html
	<ul id="home">
		<li><%= Localization::Views[:greeting] %></li>
	</ul> 

To switch locale at runtime use:
	:::ruby
    System::set_locale('es') #set current locale to Spanish

### Details:

All non-ascii symbols should be utf-8 encoded.

To get current locale on the phone use System.get_locale method. It returns 'en', 'de', etc. locale id's.

To show localized Date and Time:
	:::ruby
	Time.now.to_formatted_s(:long)
	Time.now.strftime("%B %d, %Y %H:%M") # all names will be localized
	Date.today.to_formatted_s(:long)
	Date.today.strftime("%B %e, %Y") # all names will be localized

To show currency (see rails analog for details):
	:::ruby
	Rho::NumberHelper.number_to_currency

