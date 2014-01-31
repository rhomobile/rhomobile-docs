# Media Support & Ringtones

The MediaPlayer extension is used to playback different types of audio files. It also allows the playback of Ringtones for the respective platform.

##Enabling the API

In order to use this API you must include the following extension in your <code>build.yml</code></p>

	:::yaml
	extensions: ["mediaplayer"]


## Playing Audio
Playing audio files is accomplished using the [Mediaplayer API](../api/mediaplayer)

JavaScript
	:::javascript
	var platform = Rho.System.platform;
	var audiolocation = "";

	if (platform == "WINDOWS")
	{
		audiolocation = "\\thermo.wav";
	}
	else if (platform == "ANDROID")
	{
		audiolocation = "/mnt/sdcard/test.mp3";
	}

	Rho.Mediaplayer.start(audiolocation);

The [Mediaplayer.start](../api/mediaplayer#mstartSTATIC) method is used and is passed the full path to the audio file. On iOS when you pass a URL (http) to a remote file on a server, then we open the default browser for playing it. 

**NOTE: On iOS we support: mp3, mp4, wav formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wav and on Android mp3 **

###Playing audio via native browser
Rhodes can play video/audio files in native Internet Browser. So application developer can just add link to online or local audio/video file:
	:::html
	<a href="http://videos3.netprofesseur.com/1/videos/130/BRICOLAGE_Changer_un_joints.mp4">Play mp4 online video</a>

**NOTE: You can also have your application download file to file system using [AsyncHttp.download_file](web_services) and then use a local url link [to this file](#file-system-access) to play.

## Playing Video
Playing video files is accomplished using the [Mediaplayer API](../api/mediaplayer)

JavaScript
	:::javascript
	var platform = Rho.System.platform;
	var videolocation = "";

	if (platform == "WINDOWS")
	{
		videolocation = "\\test.mp4";
	}
	else if (platform == "ANDROID")
	{
		videolocation = "/mnt/sdcard/test.mp4";
	}

	Rho.Mediaplayer.startvideo(videolocation);

The [Mediaplayer.start](../api/mediaplayer#mstartvideoSTATIC) method is used and is passed the full path to the video file. On iOS when you pass a URL (http) to a remote file on a server, then we open the default browser for playing it. 

**NOTE: On iOS we support: mov, mp4, 3gp formats. On other platforms the formats supported depend on what support is built into the platform. Typically on WM/CE this will be wav and on Android mp4 **

##Ringtones
Accessing ringtones on the device is accomplished via the [Mediaplayer](../api/medialplayer) API.

### Getting available ringtones
The [Mediaplayer.getAllRingtones()](../api/mediaplayer#mgetAllRingtonesSTATIC) is used to find out all of the available ringtones on the device 

JavaScript
	:::javascript
	// Use getAllRingtones method
	Rho.Mediaplayer.getAllRingtones(ringtones_callback);

This will return an array of objects with a `name` and `fullname` property.
	:::javascript
	function ringtones_callback(ringtones) {

			var result = "";
			for (var i = 0; i < ringtones.length; i++) {
				var name = ringtones[i].name;
				result += '<li><a href="#" class="play_ringtone" data-ringtone="' + escape(name) + '">' + name + '</a></li>';
			}

			$(".ui-page-active ul.ringtone_list").html(result);
		}

You can then use the [Mediaplayer.playRingTone](../api/mediaplayer#mplayRingToneSTATIC) method to play the ringtone by name

	:::javascript
	function play_ringtone(name) {
		//name should be a valid name returned from getAllRingtones
		Rho.Mediaplayer.playRingTone(name);
		
	}

