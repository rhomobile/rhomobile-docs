# PIM Contacts and Calendar

## PIM Contacts

Rhodes provides access to the device's local phone book and stored contacts via the Ruby class RhoContact.

To allow read/modify personal information and contacts enable the pim capability. This is done by adding the following lines to build.yml:

	:::yaml
	capabilities:
	  - pim

### PIM Contacts API

Refer to the [PIM Contacts API](../rhodesapi/rhocontact-api) methods to perform the following functionality.

 * [find](../rhodesapi/rhocontact-api#find) - Returns the contacts in the device phone book.
 * [create!](../rhodesapi/rhocontact-api#create) - Create a new contact in the phonebook.
 * [destroy](../rhodesapi/rhocontact-api#destroy) - Delete this contact from the phonebook.
 * [update_attributes](../rhodesapi/rhocontact-api#updateattributes) - Find a contact in the phonebook and update its properties.

The [Contact Properties](../rhodesapi/rhocontact-api#contact-properties) lists the contact properties that are supported for all platforms, and additional contact properties supported on Android and iOS.

Example of returning a hash of hashes of all the contacts stored in the phonebook (index):

	:::ruby
	Rho::RhoContact.find(:all)

Example for Android and iOS of finding the number of contacts in the phonebook:

	:::ruby
	Rho::RhoContact.find(:first)

**NOTE: It is allowed to pass additional params hash at all platforms. Platforms that has no extended functionality will just skip these**

Example of returning a hash of all properties of the contact identified by the provided id (show):

	:::ruby
	Rho::RhoContact.find(@params['id'])

Example of finding with conditions:

	:::ruby
	@count = Rho::RhoContact.find(:count, :conditions => {:phone => 'not_nil'})
	if @params['offset']
		@offset = @params['offset'].to_i
	else
		@offset = 0;
	end
	@contacts = Rho::RhoContact.find(:all, :per_page => 10, :offset => @offset, :select => ["id", "display_name", "mobile_number"], :conditions => {:phone => 'not_nil'})    
	@contacts = {} unless @contacts
	@contacts = @contacts.sort do |x,y| 
		res = 1 if x[1]['display_name'].nil? 
		res = -1 if y[1]['display_name'].nil?
		res = x[1]['display_name'] <=> y[1]['display_name'] unless res
		res
	end

### Sample
For examples on how to use the API provided by this class, see the view and controller in the /app/Contacts folder in the [System API Samples application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/Contacts/controller.rb).

## PIM Calendar/Events
Rhodes provides access to the device's local calendar and stored events via the [Ruby class RhoEvent](../rhodesapi/rhoevent-api). Click the links below for detailed information about the methods.

 * [find](../rhodesapi/rhoevent-api#find) - Returns the events in the device calendar.
 * [create!](../rhodesapi/rhoevent-api#create) - Creates a new event in the calendar. Returns a hash of the properties in the event.
 * [update_attributes](../rhodesapi/rhoevent-api#updateattributes) - Update the properties for this event and save the event in the calendar.
 * [destroy](../rhodesapi/rhoevent-api#destroy) - Remove this event from the calendar.
 * [Event hash properties](../rhodesapi/rhoevent-api#event-hash-properties) - A listing of the propeties storied in a calendar event hash, which is returned by the find method.

To allow read/modify calendar information enable the calendar capability. This is done by adding the following lines to build.yml:

	:::yaml
	capabilities:
	  - calendar

Check if the device has a calendar:
	:::ruby
	System::get_property('has_calendar')

Example of returning a hash of hashes of all the events stored in the calendar (index):
	:::ruby
	Rho::RhoEvent.find(:all) 

Example of returning a hash of all the properties of the event identified by the provided id (show):
	:::ruby
	Rho::RhoEvent.find(@params['id'])

Example of returning a hash of all properties of the events found by specified parameters (index):
	:::ruby
	start = Time.utc(2010, 'jan', 1, 0, 0, 0)
    finish = Time.utc(2012, 'dec', 31, 23, 59, 59)
    @@events = Rho::RhoEvent.find(:all, :start_date => start, 
    	:end_date => finish, :find_type => 'starting', 
        :include_repeating => true)
 
Create new event in the calendar:
	:::ruby
	created_event = Rho::RhoEvent.create!(@params['event'])

Update event in the calendar:
	:::ruby
	Rho::RhoEvent.update_attributes(@params['event'])

Delete event from the calendar:
	Rho::RhoEvent.destroy(@params['id']))

### Remarks
In Android Device's, Calendar Event will only be created if the calendar is synced with atleast one mail account.

### Sample
For examples on how to use the API provided by this class, see the view and controller in the /app/Calendar folder in the [System API Samples application](http://github.com/rhomobile/rhodes-system-api-samples/tree/master/app/Calendar/controller.rb).

