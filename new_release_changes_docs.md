# Release Changes
This is a document outlining the documents that need to have changes made to them in order to account for a new version folder being added to the list of versions in the RhoMobile docs.

## Top-Level Docs
Things that need to be changed in the top-level of the docs folder or higher.

### version.rb
The version.rb file (rhomobile-docs/version.rb) needs to be updated to have the correct current version and the direct previous version.

For Example, if the new release version was 5.0.30 and the direct previous version was 5.0.25, you would change the version.rb file as such:

    :::ruby
    module Version
      CURR_VERSION = '5.0.30'
      PREV_VERSION = '5.0.25'
      NEXT_VERSION = 'edge'
    end

> Note: NEXT_VERSION will always be 'edge', there is no need change it.

### layout.erb
The layout.erb file (rhomobile-docs/views/layout.erb) needs to have the versions in the version selector drop-down edited to include all the supported versions.

For example, if the new release version was 5.0.30, and the direct previous version was 5.0.25, you would change the layout.erb file as such:

    :::erb
    <!-- Keep all previous versions hard-coded -->
    <option value='5.0.0' <%=@docversion=='5.0.0' ? 'SELECTED' : ''%>>5.0.0</option>
    <option value='4.1.0' <%=@docversion=='4.1.0' ? 'SELECTED' : ''%>>4.1.0</option>
    <option value='4.0.0' <%=@docversion=='4.0.0' ? 'SELECTED' : ''%>>4.0.0</option>
    <option value='2.2.0' <%=@docversion=='2.2.0' ? 'SELECTED' : ''%>>2.2.0</option>

Note that neither 5.0.30 nor 5.0.25 are in this list. this is because these are all releases that we list which are previous to the direct previous version. The current and direct previous versions are taken care of by code that grabs those versions from the version.rb file.

## In The New Version Folder
Things that need changing in the new version folder, which was copied from edge.

### toc.rb
the toc.rb file contains all the links to the docs inside the given version and need to have all instances of the word 'edge' changed to whatever the new version is.

### apiusage.md and apisummary.md
these two files ([version]/guide/apisummary.md and [version]/guide/apiusage.md) which document the APIs for a given version need to have any mention of a version updated to make sure it is referencing the correct version.

### rhoArchitecture
Titled 'RMS 5.x Supported Platforms,' this page details the resources needed to run RhoMobile Suite and contains tables of devices supported (and deprecated) by the current version. Its top-most table lists the operating systems and general sets of devices on which apps made with RMS will run. 