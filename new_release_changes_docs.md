# Release Changes
This document describes how other documents need to change whenever a folder containing new RhoMobile docs is added to the RhoMobile docs repository.

## Top-Level Docs
Changes required at the docs folder level or higher: 

### version.rb
The version.rb file (rhomobile-docs/version.rb) must be changed to reflect a new 'current' version and a new 'previous' version (the version immediately prior to current). 

For example, if the new version is to be 5.0.30 and version immediately prior was 5.0.25, the version.rb file would look like this:

    :::ruby
    module Version
      CURR_VERSION = '5.0.30'
      PREV_VERSION = '5.0.25'
      NEXT_VERSION = 'edge'
    end

> Note: NEXT_VERSION always will be 'edge,' so there is never a need to change it.

### layout.erb
The layout.erb file (rhomobile-docs/views/layout.erb) controls the version selector drop-down list at the top of all docs pages. This is a list of all supported versions ** *except* ** the current and previous versions. When a new RMS version is added, this list must be edited so that it contains the most recent version *after* the new 'current' and 'previous' versions.

For example, let's say the new version you're adding is version 5.1. If the version it replaces was 5.0.30, and the version immediately prior to that was 5.0.25, then the new layout.erb file should look like this:

    :::erb
    <!-- Keep all previous versions hard-coded -->
    <option value='5.0.25' <%=@docversion=='5.0.25' ? 'SELECTED' : ''%>>5.0.25</option>
    <option value='5.0.0' <%=@docversion=='5.0.0' ? 'SELECTED' : ''%>>5.0.0</option>
    <option value='4.1.0' <%=@docversion=='4.1.0' ? 'SELECTED' : ''%>>4.1.0</option>
    <option value='4.0.0' <%=@docversion=='4.0.0' ? 'SELECTED' : ''%>>4.0.0</option>
    <option value='2.2.0' <%=@docversion=='2.2.0' ? 'SELECTED' : ''%>>2.2.0</option>

Notice that version 5.0.30 does not appear, but that 5.0.25 does. This is because with the introduction of 5.1, version 5.0.30 became the previous version and 5.0.25 was bumped down to 'supported' status. The current and previous versions are injected into the drop-down menu by code that grabs those versions from the version.rb file.

## In The New Version Folder
Things that need changing in the new version folder, which was copied from edge.

### toc.rb
the toc.rb file contains all the links to the docs inside the given version and need to have all instances of the word 'edge' changed to whatever the new version is.

### apiusage.md and apisummary.md
these two files ([version]/guide/apisummary.md and [version]/guide/apiusage.md) which document the APIs for a given version need to have any mention of a version updated to make sure it is referencing the correct version.

### rhoArchitecture
Titled 'RMS 5.x Supported Platforms,' this page details the resources needed to run RhoMobile Suite and contains tables of devices supported (and deprecated) by the current version. Its top-most table lists the operating systems and general sets of devices on which apps made with RMS will run. 