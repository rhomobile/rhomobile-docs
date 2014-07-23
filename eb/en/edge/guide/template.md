# Enterprise Browser MD Template
All documents must start with a H1. This will be used as the title in Launchpad and Also in the Offline version for searching. The title must be unique across the set of documents (Launchpad restriction)

## Usage Notes

### Use of Markdown
The H2 and H3 will be used to generate a 'In This Document' sidebar on the right. It uses Tocify.js to autogenerate 

### Links to Content
Links can use standard MD format for links using Parenthesis and Brackets (not numbered notation) BUT the link must always be starting with '../folder/filename' (even if it is in the same folder as the current document). The parent folder/filename is used as a 'key' for the document in the offline version search and is used for rewriting URLs for Launchpad

Ex:
[Adapter Link](../api/Adapter)

### Images
Need to put instructions for images here

### Code snippets
We will be using Syntaxhighlighter.js for code highlight in Launchpad (uses version 1.5) and Prettify.js for offline. Use Standard tabbing (4 spaces) and the first line should *ALWAYS* be the language indicator

	:::javascript
	//Here is some sample JS that should be JS highlighted
	var foo = 5;

* Use Url encoding for special characters in code block especially less than &lt;, greater then &gt; and amperstand &amp;

### Copy Paste Problems
Sometimes when copying pasting from Word, or other docs, the quotes (single and double), dashes and other characters - are not the 'right ones'. This may look ok in the offline version, but when posting to Launchpad they are translated to something odd. Look for these and correct

Examples of bad characters:
“adb devices”

Good:
"adb devices"

### Call Out Notes
We will use standard blockqupote markdown notation for calling out warnings/notes:

>Note: This is using the standard Markdown blockquote notation. In rhodocs we used something coustom.

## Launchpad notes

* Put in some notes about publishing to Launchpad

## Offline Doc Notes

* Put in some notes about offline docs