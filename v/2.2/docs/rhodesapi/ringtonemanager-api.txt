# RingtoneManager API

View and play a device's ringtones. See the controller and view in the /app/Ringtones folder of the [System API Samples application](https://github.com/rhomobile/rhodes-system-api-samples/blob/master/app/Ringtones/controller.rb) for an example.

Currently implemented for Android, Blackberry and Windows mobile. On Blackberry, only the user installed ringtones are accessible. System preinstalled ringtones are not accessible due to Blackberry limitations.

## get_all_ringtones

Returns a hash containing key/value pairs, where the key is the user-friendly name of ringtone, and the value is its full file name.

	:::ruby
	RingtoneManager::get_all_ringtones

## play

Play a ringtone. If called while another ringtone is playing, the old ringtone will stop playing and the new one will start playing.

	:::ruby
	RingtoneManager::play ringtone

<table border="1">
<tr>
	<td><code>ringtone</code></td>
	<td>A ringtone from the ringtone hash returned by get_all_ringtones, such as <code>@ringtones['My Ringtone']</code>.</td>
</tr>
</table>

## stop

Stop playing a ringtone. Can safely be called even if no ringtone is playing.

	:::ruby
	RingtoneManager::stop