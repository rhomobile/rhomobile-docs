# Rho::RhoEvent API

Access a device's calendar and events.

For examples on how to use the RhoEvent API, see the view and controller in the /app/Calendar folder in the [System API Samples application](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/Calendar/controller.rb).

## Enabling the Calendar

To use the RhoEvent API, you need to enable read and write for the calendar on the device. Do this by adding that capability to the build.yml file:

	:::yaml
	capabilities:
	  - calendar

Check if the device has a calendar:

	:::ruby
	System.get_property('has_calendar')

## find

Returns events in the device calendar.

Return a hash of hashes: a hash of all the events in the calendar (each event is stored in a hash).

	:::ruby
	Rho::RhoEvent.find(:all)

Return a hash of all the properties of the calendar event identified by this id.

	:::ruby
	Rho::RhoEvent.find(@params['id'])

Return a hash of hashes: a hash of the events in the calendar (each event is stored in a hash) in the device calendar within a specified range.

	:::ruby
	Rho::RhoEvent.find(:all, :start_date, :end_date, :find_type, :include_repeating)

<table border="1">
<tr>
	<td><code>:all</code></td>
	<td>Search all the events.</td>
</tr>
<tr>
	<td><code>:start_date</code></td>
	<td>The start date of the range to search.</td>
</tr>
<tr>
	<td><code>:end_date</code></td>
	<td>The end date of the range to search.</td>
</tr>
<tr>
	<td><code>:find_type</code></td>
	<td>'starting' - searches for events starting between start_date and end_date. 'ending' - searches for events ending between start_date and end_date. 'occurring' - searches for events that have any part of the event occurring during the period specified by start_date and end_date.</td>
</tr>
<tr>
	<td><code>:include_repeating</code></td>
	<td>true - include repeating occurrences of an event in the search; false - do not include repeating occurrences, only search on the event start and end values.</td>
</tr>
</table>

Code sample:

	:::ruby
	start = Time.utc(2010, 'jan', 1, 0, 0, 0)
    finish = Time.utc(2012, 'dec', 31, 23, 59, 59)
    @@events = Rho::RhoEvent.find(:all, :start_date => start, 
    	:end_date => finish, :find_type => 'starting', 
        :include_repeating => true)

## create!

Create a new event in the calendar, setting the properties of the event (excluding `id`, which is generated) from the passed parameter hash, and save the created calendar event (create). Return a hash of all the properties of the created event, including the `id` property.

	:::ruby
	Rho::RhoEvent.create!(event_hash)

<table border="1">
<tr>
	<td><code>event_hash</code></td>
	<td>a hash of the properties for the new event.</td>
</tr>
</table>

## update_attributes

Find the event in the calendar (the event id is passed in the event_hash), update the properties for that event, and save the event to the calendar.

	:::ruby
	Rho::RhoEvent.update_attributes(event_hash)

<table border="1">
<tr>
	<td><code>event_hash</code></td>
	<td>a hash of the updated properties for the event.</td>
</tr>
</table>

## destroy

Remove this event from the calendar.

	:::ruby
	Rho::RhoEvent.destroy(id)

<table border="1">
<tr>
	<td><code>id</code></td>
	<td>remove the event identified by this id from the calendar.</td>
</tr>
</table>

## get_authorization_status

Get the authorization status.

	:::ruby
	Rho::RhoEvent.get_authorization_status

## Event Hash Properties

The event properties for the calendar are stored in a hash. The event hash (or a hash of event hashes) is returned by the find and create methods.

<table border="1">
<tr>
	<td><code>id</code></td>
	<td>id for this event.</td>
</tr>
<tr>
	<td><code>title</code></td>
	<td>String. The event title.</td>
</tr>
<tr>
	<td><code>location</code></td>
	<td>String. The event location.</td>
</tr>
<tr>
	<td><code>notes</code></td>
	<td>String. Notes added to this event.</td>
</tr>
<tr>
	<td><code>start_date</code></td>
	<td>Start date for this event in Time.utc format.</td>
</tr>
<tr>
	<td><code>end_date</code></td>
	<td>End date for this event in Time.utc format.</td>
</tr>
<tr>
	<td><code>recurrence</code></td>
	<td>(Blackberry, Windows, iOS, Android) hash of recurrence properties. See listings below.</td>
</tr>
<tr>
	<td><code>reminder</code></td>
	<td>(Blackberry and Windows only) int. event reminder in minutes.</td>
</tr>
<tr>
	<td><code>privacy</code></td>
	<td>(Blackberry and Windows only) 'public', 'private', or 'confidential'.</td>
</tr>
<tr>
	<td><code>canceled</code></td>
	<td>(iPhone and Android only). True if the event is canceled.</td>
</tr>
<tr>
	<td><code>organizer</code></td>
	<td>(iPhone and Android only) String. The event organizer.</td>
</tr>
<tr>
	<td><code>attendees</code></td>
	<td>(iPhone and Android only) String. The attendees.</td>
</tr>
<tr>
	<td><code>last_modified</code></td>
	<td>(iPhone and Android only) Datetime when the event was last modified.</td>
</tr>
</table>

## Recurrence Hash Properties

Recurrence properties are grouped in a separate hash stored as a single property in the event hash (event[Rho::RhoEvent::RECURRENCE]).

### Recurrence Properties Hash for Blackberry and Windows

For Blackberry and Windows, the recurrance hash has these properties.

<table border="1">
<tr>
	<td><code>recurrence</code></td>
	<td>true if this event recurs; false otherwise.</td>
</tr>
<tr>
	<td><code>frequency</code></td>
	<td>'daily', 'weekly', 'monthly', 'yearly'</td>
</tr>
<tr>
	<td><code>interval</code></td>
	<td>Used with frequency. The number of intervals in this frequency. {'frequency'=>'daily', "interval"=>2 } means that event will be 1, 4, 7, etc.</td>
</tr>
<tr>
	<td><code>end_date</code></td>
	<td>End date for this recurrence in Time.utc format.</td>
</tr>
<tr>
	<td><code>days</code></td>
	<td>Array of 7 items, representing Mon-Sun. Value of 1 means event is triggered.</td>
</tr>
<tr>
	<td><code>months</code></td>
	<td>Array of 12 items, representing Jan-Dec.</td>
</tr>
<tr>
	<td><code>weeks</code></td>
	<td>Array of 5 items, representing first-fifth.</td>
</tr>
<tr>
	<td><code>count</code></td>
	<td>he number of times this event will occur.</td>
</tr>
<tr>
	<td><code>day_of_month</code></td>
	<td>Integer. 1-31.</td>
</tr>
</table>

### Recurrence Properties Hash for iOS and Android

For iOS and Android, the recurrance hash has these properties.

<table border="1">
<tr>
	<td><code>recurrence</code></td>
	<td>true if this event recurs; false otherwise.</td>
</tr>
<tr>
	<td><code>frequency</code></td>
	<td>'daily', 'weekly', 'monthly', 'yearly'</td>
</tr>
<tr>
	<td><code>interval</code></td>
	<td></td>
</tr>
<tr>
	<td><code>end_date</code></td>
	<td>End date for this recurrence in Time.utc format.</td>
</tr>
<tr>
	<td><code>count</code></td>
	<td>The number of times this event will occur.</td>
</tr>
<tr>
	<td><code>end</code></td>
	<td>date/time in Time.utc format beyond the last event occurrence but within the same day.</td>
</tr>
</table>

## Event Property Names

Here is a list of helper constants defined in Rho::RhoEvent which can be used to address event values, and used as a predefined set of frequency values.

* ID
* TITLE
* CANCELED
* ORGANIZER
* START_DATE
* END_DATE
* LAST_MODIFIED
* LOCATION
* NOTES
* PRIVACY
* REMINDER
* RECURRENCE
* RECURRENCE_FREQUENCY
* RECURRENCE_FREQUENCY_DAILY
* RECURRENCE_FREQUENCY_WEEKLY
* RECURRENCE_FREQUENCY_MONTHLY
* RECURRENCE_FREQUENCY_YEARLY
* RECURRENCE_INTERVAL
* RECURRENCE_COUNT
* RECURRENCE_END
* RECURRENCE_DAYOFMONTH
* RECURRENCE_MONTHS
* RECURRENCE_DAYS

