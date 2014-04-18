
#PowerOn Module

<b>
The PowerOn Module is used to register to receive an event when the device is resumed from suspend mode.
</b>

##Syntax

<table class="re-table"><tr><th class="tableHeading">powerOn (Module) &lt;META&gt; Syntax
</th></tr><tr><td class="clsSyntaxCells clsOddRow"><p>&lt;META HTTP-Equiv="PowerOn" content="PowerOnEvent:url('[jsFunction | url]')"&gt;</p></td></tr></table>
<table class="re-table"><tr><th class="tableHeading">PowerOn JavaScript Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the JavaScript Object <b>'powerOn'</b> will exist on the current page and can be used to interact directly with the powerOn.
</td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set powerOn return events via JavaScript use the following syntax: poweron.event = Javascript Function;
<P />e.g. <b>powerOn</b>.powerOnEvent = 'doFunction(%json)';
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents">Retrieval Events</a> page.

</td></tr><tr><td class="clsSyntaxCells clsOddRow">							
To set multiple <a href="/rhoelements/EMMLOverview">EMML</a> parameters / events on a single line use the following syntax: poweron.setEMML("[Your EMML Tags]");
<P />
e.g. <b>powerOn</b>.setEMML("powerOnEvent:url('JavaScript:doFunction(%json)')");							
</td></tr></table>

<table class="re-table"><tr><th class="tableHeading">PowerOn Ruby Object Syntax:</th></tr><tr><td class="clsSyntaxCells clsOddRow">
By default the Ruby Object <b>'PowerOn'</b> will exist on the current page and can be used to interact directly with the PowerOn. All Methods, Parameters and Events are the same as Javascript, however, notice <b>'PowerOn'</b> needs to start with an uppercase letter. Another difference in Ruby is that methods do not end in <b>'()'</b></td></tr><tr><td class="clsSyntaxCells clsEvenRow">						
To Set PowerOn return events via Ruby use the following syntax: PowerOn.event = url_for(:action =&gt; :event_callback) 
<P />e.g. <b>PowerOn</b>.powerOnEvent = url_for(:action =&gt; :poweron_event_callback)
<P />
For more details on the event syntax and parameters see the <a href="/rhoelements/RetrievalEvents#params-object">Retrieval Events</a> page.
<p>To access the event parameters in a Ruby callback function, you reference the @params object within the callback function. This object is simply a ruby hash {"parameter1 name" =&gt; "parameter1 value", "parameter2 name" =&gt; "parameter2 value", ...}</p></td></tr><tr><td class="clsSyntaxCells clsOddRow" /></tr></table>


	

##Events


Values are returned to the caller in RhoElements via Events.  Most modules contain events and those returned from this module are given below along with the event parameters.  Events can cause a navigation to a new URL or a Javascript function on the page to be invoked.  Each event will in most cases have a number of parameters associated with it which will either be strings or javascript arrays.  Event parameters can be accessed either directly or via JSON objects.

<br />
###powerOnEvent
The PowerOnEvent is sent whenever the device is resumed from suspend mode. There is no data associated with this event.




##Remarks


###Example usage
This feature is very useful for security. Navigating to an offline page (file:// protocol) when the device is powered on can be used to request a pin number from the user.


###Use when cradled
Windows Power events will not always be generated when the device is connected to power and instructed to stand by / wake up, though this is dependant on the Operating System in use.




##Requirements

<table class="re-table"><tr><th class="tableHeading">RhoElements Version</th><td class="clsSyntaxCell clsEvenRow">1.0.0 or above
</td></tr><tr><th class="tableHeading">Supported Devices</th><td class="clsSyntaxCell clsOddRow">All supported devices.</td></tr><tr><th class="tableHeading">Minimum Requirements</th><td class="clsSyntaxCell clsOddRow">None</td></tr><tr><th class="tableHeading">Persistence</th><td class="clsSyntaxCell clsEvenRow">Transient - any changes made by changing parameters will be lost when navigating to a new page.</td></tr></table>


##HTML/Javascript Examples

The following example displays a message box when the device resumes:

	<meta http-equiv="PowerOn" content="PowerOnEvent:url('javascript:alert('Powered Up');')">
	


##Ruby Examples

The following example displays a custom text as a JavaScript alert when the device resumes from a suspended state: 

	def setPowerOnText
		$text = @params['text']
		PowerOn.powerOnEvent = url_for(:action => powerOnEventListener)
	end  

Here, 'powerOnEventListner' is the following function: 

	def powerOnEventListener
		Alert.show_popup $text
	end

The 'setPowerOnText' function takes an input from the user for a custom text to be displayed when the device powers on. This function is called from JavaScript as described below: 

	function setText() {
		text = document.getElementById('textToDisplay').value
		$.get('/app/PowerModule/setPowerOnText', {text: text});
		return false;
	}