# NavBar API

The NavBar API supports a native navigation bar for the iPhone.

## create

Creates a navigation bar for the iPhone.

	:::ruby
	NavBar.create(navbar-elements)

The navbar-elements parameter is a list of name/value pairs from the following list of navbar elements.

<table border="1">
<tr>
	<td><code>:title</code></td>
	<td>String. Title of the navigation bar.</td>
</tr>
<tr>
	<td><code>:left</code></td>
	<td>Left button with :action and :label defined.</td>
</tr>
<tr>
	<td><code>:right</code></td>
	<td>(optional) Right button with :action and :label defined.</td>
</tr>
</table>

The :left and :right buttons use the following parameters:

<table border="1">
<tr>
	<td><code>:action</code></td>
	<td>action to perform (click here for the menu-toolbar-tabbar actions), or url to open, when the button is pressed.</td>
</tr>
<tr>
	<td><code>:label</code></td>
	<td>Label for the button.</code>.</td>
</tr>
</table>

### Example call

	:::ruby
	NavBar.create :title => "Navigation bar",
              :left => {
                :action => :back, 
                :label => "Back"},
              :right => {
                :action => url_for(:action => :help), 
                :label => "Help"}

## remove

Removes a navigation bar from the iPhone.

	:::ruby
	NavBar.remove
