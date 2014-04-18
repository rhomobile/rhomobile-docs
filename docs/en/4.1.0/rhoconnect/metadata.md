Building Dynamic Views with Metadata
===

The metadata framework is a RhoConnect & Rhodes tool which provides synchronized application layouts.  For example, if your application had an "account" model with the fields "name" and "address", metadata would allow you to add an additional field "phone" in the source adapter and this new field would automatically display in the Rhodes application.  

In addition to adding/removing/updating fields, metadata also provides powerful features like handling field validations, data-binding, collections, repeatable elements, and much more.

## How Metadata Works
* Metadata is first defined in a [source adapter](source-adapters) by implementing an adapter method `metadata` that returns a JSON structure. The JSON structure may contain a hash of hashes, as well as having child elements defined as arrays of hashes. The keys in each object can be any string, however there are some reserved labels and labels used by certain elements. 

* The metadata for an adapter is synchronized to Rhodes along with the rest of the adapter dataset.  Metadata is called before the query method in the [`SyncEngine` workflow](../guide/using_rhoconnect#syncengine-workflow), so you can tailor your query method based on metadata.

* Rhodes uses the synchronized [metadata definition](#metadata-definition) to render views at runtime.  These views are driven by the metadata definition, so when a new definition is synchronized, the views will automatically reflect the changes.

## Getting Started with Metadata
The first step is to install the rhodes-translator gem:

	:::term
  	$ gem install rhodes-translator

Then add `rhodes_translator` to your extensions in your Rhodes application's `build.yml`:

	:::yaml
  	extensions: ["rhodes_translator"]

Now define some metadata and add this to a `metadata` method your [source adapter model](source-adapters).  For example:

	:::ruby
	def metadata
	  # define the metadata
	  row1 = { 
	    :label => 'Address 1',
	    :value => '123 fake street',
	    :name => 'address1',
	    :type => 'labeledrow' 
	  }
	  table = { 
	    :label => 'Table',
	    :type => 'table',
	    :children => [ row1, row1, row1 ] 
	  }
	  view = { 
	    :title => 'UI meta panel',
	    :type => 'iuipanel',
	    :children => [table] 
 	  }

 	  # return the definition as JSON
	  {'index' => view}.to_json
    end
	
	
## Metadata Definition
The following elements are available for building metadata definitions.

### Reserved Labels

The following labels are reserved, used by the metadata framework.

* `:type`
* `:children`
* `:repeatable`
* `:validation`

### Children

Children of an element are defined by an array of hashes. To specify the children of an element you add the ":children" key and specify the children of that element.

The following example shows a table element that has three `row1` elements as `:children`:

	:::ruby
	row1 = { 
	  :label => 'Address 1',
	  :value => '123 fake street',
	  :name => 'address1',
	  :type => 'labeledrow' 
	}
	
	table = { 
	  :label => 'Table',
	  :type => 'table',
	  :children => [ row1, row1, row1 ] 
	}

### Repeatable

Repeatable elements use [data binding](#data-binding) to specify an array of objects to iterate over. The children of the repeatable element are duplicated for each element in the object referred to by the repeatable hash key. For more information on data-binding  see the data binding section on this page.

The following example will result in a table with 2 child rows, one row with the value set to '123 fake street' and the second row value set to '321 fake street'

	:::ruby
	@addresses = [ 
	  { :name => "123 fake street" }, 
	  { :name => "321 fake street" } 
	]

	row1 = { 
	  :label => 'Address 1',
	  :value => '{{name}}',
	  :name => 'address1',
	  :type => 'labeledrow' 
	}

	table = { 
	  :label => 'Table',
	  :type => 'table',
	  :children => [ row1 ],
	  :repeatable => '{{@addresses}}' 
	}


## Controlling How Metadata is Rendered

By default, any controller actions that have metadata for a given model with the key corresponding to the action will be rendered with metadata instead of the view.

However, you can render arbitrary metadata in the view with the `render_metadata` method. You must specify the action to the metadata. By default, the metadata provided is pulled from the model, however this can be overridden as well. 

Example:

	:::ruby
 	<%= render_metadata('indexdata') %>


Or, using explicit metadata resource:

	:::ruby
 	<%= render_metadata('index', Account.metadata) %>

## Data Binding

Data binding happens before the elements get translated to html. All of the instance variables in your method are able to be referenced by the data binding keys.

A data binding key is always contained within a string. It is indicated by using double bracket enclosure: `{{databinding path here}}`

To reference hash keys, or index arrays, the `/` operator is used.  You must specify the whole path to the object, the only exception being within [repeatable](#metadata-definition) elements.

We will use the following dataset for example:

	:::ruby
 	@data = { 
	  :key1 => [ 'array', 'with', 'elements'], 
	  :key2 => { :this => "is", :a => "hash" } 
	}


Example data binding keys using this data:

`{{@data/key1/0}}` will be replaced with 'array'

`{{@data/key1/2}}` will be replaced with 'elements'

`{{@data/key1/5}}` will be replaced with an error message

`{{@data/key2/this}}` will be replaced with 'is'

`{{@data/key2/this}}` will be replaced with 'hash'


Within a repeatable element, the root node is replaced with the element that is being repeated. See the example in the repeatable section above. To reference the root element while inside a repeatable a `/` should be prepended to your data binding expression: `{{/@data/key1/0}}`

## Validation

Validation is expressed as a key added to an existing metadata definition. Below is a sample showing all of the validations that can be used.

	:::ruby
	:validation => {
	   :regexp = "^.+$",
	   :validators = [:required, :number, :currency, :email, :phone],
	   :min_len = 0,
	   :max_len = 100,
	   :min_value = 10,
	   :max_value = 1000
	}

## Templates
### Form
An HTML form that is used for submitting data:

	:::html
	<form></form>
    

* **Type**
	* `form`
* **Keys**
 	* `name` - used as name attribute in &lt;form&gt; tag
	* `action` - used as action attribute in &lt;form&gt; tag
	* `method` - used as method attribute in &lt;form&gt; tag
* **Children** 
	* Children are rendered between the &lt;form&gt; and &lt;/form&gt;  tags

### Panel
Contains children with a &lt;div&gt; tag with the div class set to 'panel':

	:::html
	<div class="panel"></div>

* **Type**
	* `panel`
* **Keys** 
	* `unused`
* **Children** 
	* Children are rendered between the &lt;div&gt; and &lt;/div&gt;  tags

### View
Contains children with no extra html.

* **Type** 
	* `view`
* **Keys** 
	* `unused`
* **Children** 
 	* Children rendered directly

### Table
HTML Table.
	
	:::html
	<table></table>

* **Type** 
 	* `table`
* **Keys** 
	* `class` - class attribute on &lt;table&gt; element
* **Children** 
	* Children are rendered between the &lt;table&gt; and &lt;/table&gt;  tags

### Text
A labeled text display.

	:::html
	<div>
  	  <label></label>
      <span></span>
	</div>

* **Type** 
	* `text`
* **Keys** 
	* `div_class` - class attribute for div
	* `label_class` - class attribute for label
 	* `value_class` - class attribute for span
 	* `label` - value for label element
	* `value` - value for inner div element
* **Children** 
	* Does not render children

### Text Input, Password
A labeled text input.

	:::html
	<div>
  	  <label></label>
      <input type="text|password"></input>
    </div>

* **Type** 
	* `textinput|password`
* **Keys** 
	* `div_class` - class attribute for outer div
	* `label_class` - class attribute for label
 	* `value_class` - class attribute for input
	* `label` - value for label element
	* `value` - value attribute for input
	* `name` - name attribute for input
	* `editable` - boolean value, enable/disable changing of selection. Default `true`.
* **Children** 
	* Does not render children.

### Text Area
Text area input field.

	:::html
	<textarea>
	</textarea>

* **Type** 
	* `textarea`
* **Keys** 
	* `class` - class attribute for  textarea
	* `value` - value attribute for textarea
	* `name` - name attribute for textarea
	* `rows` - rows attribute for textarea
	* `cols` - cols attribute for textarea
	* `editable` - boolean value, enable/disable changing of selection. Default `true`.
* **Children** 
	* Does not render children.

### Select
HTML Select.

	:::html
	<div>
  	  <label></label>
      <select>
        <option></option>
      </select>
	</div>

* **Type** 
	* `select`
* **Keys** 
	* `size` - size attribute for select
	* `class` - class attribute for select
	* `allow_multi` - boolean value, allow multiple selection on dropdown. Default `false`.
	* `editable` - boolean value, enable/disable changing of selection. Default `true`.
	* `div_class` - class attribute for outer div
	* `label_class` - class attribute for label
	* `label` - value for label element
	* `value` - default value displayed
	* `values` - array of strings to provide as options
* **Children** 
	* Does not render children.

### Checkbox
A checkbox field

	:::html
	<div>
  	  <label></label>
  	  <input type="checkbox"></input>
	</div>

* **Type** 
	* `checkbox`
* **Keys** 
	* `div_class` - class attribute for outer div
	* `label_class` - class attribute for label
	* `label` - value for label element
	* `name` - name attribute for input
	* `default_value` - boolean value, true = checked, false = unchecked. Default `false`.
	* `value` - string value, 'true' = checked, anything else = unchecked
* **Children** 
	Does not render children.

### link
An anchor tag.

	:::html
	<a href=""></a>

* **Type** 
	* `link`
* **Keys** 
	* `url` - the url inside the href attribute
	* `text` - the text that the link displays
* **Children** 
	* Does not render children.

### telephone
Anchor tag, with click to call information.

	:::html
	<a href=""></a>

* **Type** 
	* `telephone`
* **Keys** 
	* `number` - the phone number to call
	* `text` - The text that the link displays
* **Children** 
	* Does not render children.

## Advanced Adapter Example
Here is a more advanced source adapter `metadata` example which demonstrates the concepts we described here:

	:::ruby
	def metadata
	  @contact = {
		:label => '{{name}}',
	    :name => 'contact',
	    :type => 'labeledrow', # a row which links to another 
							   # object in a different model
	    :value => '{{age}}, {{year}}' 
	  } # name and phone of the contact object not the account!

	  @rows = {
	    :type => 'view',
	    :children => [@contact],
	    :repeatable => '{{@forms}}'
	  }

	  @link = {
		:label => 'New',
	    :value => '{{@link1}}',
	    :type => 'labeledrow'
	  }

	  @table = {
		:label => 'table',
	    :name => 'table',
	    :type => 'table',
	    :class => 'grid',
	    :children => [@link, @rows]
	  }

	  @index = {
	    :title => 'PEOPLE',
	    :type => 'iuipanel',
	    :children => [@table]
	  }

	  @error = { 
	    :label => '{{@errorlabel}}',
	    :type => 'text',
	    :name => 'name',
	    :value => '{{@errors}}'
	  }

	  @name = { 
		:label => 'name',
	    :type => 'textinput',
	    :name => 'name',
	    :value => '{{@form/name}}',
	    :validation => { :validators => [:required] }
	  }

	  @age = { 
		:label => 'age',
	    :type => 'textinput',
	    :name => 'age',
	    :value => '{{@form/age}}',
	    :validation => { 
		  :validators => [:required], 
		  :min_value => 13 
		}
	  }

	  @year = { 
		:label => 'year',
	    :type => 'textinput',
	    :name => 'year',
	    :value => '{{@form/year}}',
	    :validation => { 
		  :validators => [:required], 
		  :max_value => 2010 
		}
	  }
	    
	  @submit = { 
		:name => 'submit',
	    :value => 'submit',
	    :type => 'submit'
	  }

	  @form = { 
		:name => 'inputform',
	    :action => '{{@submiturl}}',
	    :type => 'form',
	    :children => [@error, @name, @age, @year, @submit]
	  }

	  { 'indexdata' => @index, 'new' => @form }.to_json
	end

## Custom Templates

Templates can be overridden by placing the ERB files in the `app/templates` folder in your Rhodes application. They will be used before using any of the built-in templates.
