# Release Changes
This document describes how other documents need to change whenever a folder containing new RhoMobile docs is added to the RhoMobile docs repository.

## Top-Level Docs
Changes required at the docs-folder level or higher: 

### version.rb
The version.rb file (rhomobile-docs/version.rb) controls the upper portion of the version selector drop-down list at the top of all docs pages. **This file must be changed to reflect a new 'current' version and a new 'previous' version (the version immediately prior to the current one)**. 

For example, if the new version is to be 5.0.30 and version it replaces was 5.0.25, the version.rb file would look like this:

    :::ruby
    module Version
      CURR_VERSION = '5.0.30'
      PREV_VERSION = '5.0.25'
      NEXT_VERSION = 'edge'
    end

> NOTE: NEXT_VERSION always will be 'edge,' so there is never a need to change that.

### layout.erb
The layout.erb file (rhomobile-docs/views/layout.erb) controls the lower portion of the version selector drop-down list at the top of all docs pages. This displays the list of all supported versions *except* the current and previous versions. When a new RMS version is added, **this list must be edited so that it contains the most recent version *after* the new 'current' and 'previous' versions**.

For example, let's say the new version you're adding is version 5.1. If the version it replaces was 5.0.30, and the version immediately prior to that was 5.0.25, then a correctly edited layout.erb file would look like this:

    :::erb
    <!-- Keep all previous versions hard-coded -->
    <option value='5.0.25' <%=@docversion=='5.0.25' ? 'SELECTED' : ''%>>5.0.25</option>
    <option value='5.0.0' <%=@docversion=='5.0.0' ? 'SELECTED' : ''%>>5.0.0</option>
    <option value='4.1.0' <%=@docversion=='4.1.0' ? 'SELECTED' : ''%>>4.1.0</option>
    <option value='4.0.0' <%=@docversion=='4.0.0' ? 'SELECTED' : ''%>>4.0.0</option>
    <option value='2.2.0' <%=@docversion=='2.2.0' ? 'SELECTED' : ''%>>2.2.0</option>

Notice that version 5.0.30 does not appear, but that 5.0.25 does. This is because with the introduction of 5.1, version 5.0.30 becomes the previous version and causes 5.0.25 to get bumped to the 'supported' list. The current and previous versions do not go into this list, but instead are injected into the drop-down menu by code that grabs those version numbers from the version.rb file.

## In The New Version Folder
The process of publishing new docs includes copying all of the files from the 'edge' folder--where they've been gradually updated as the new version was being developed--to a new folder named for the new version number. 

**Make a copy the Edge folder and rename it to match the new version number**. 

**In the new version's folder, change the following files**:

### toc.rb
The toc.rb (table of contents) file contains links to all of the docs inside the given version's folder. During development, that folder was called 'edge.' Now that it has a version number, **all instances of the word 'edge' must be changed (using search-and-replace) to the new version designation**. If using the example above, we would change 'edge' to '5.1' anywhere it occurs in the file. 

### apiusage.md and apisummary.md
The **apiusage.md and apisummary.md** files ([version]/guide/apisummary.md and [version]/guide/apiusage.md) document the APIs for a given version. **If not already changed during the development process, modify them so that all references the version number refer to the *current* version**.

### rhoArchitecture
The 'RMS 5.x Supported Platforms' ([version]/guide/rhoArchitecture) page details the resources needed to run RhoMobile Suite and contains tables of devices supported (and deprecated) by the current version. Its top-most table lists the operating systems and general sets of devices on which apps made with RMS will run. 

**If not already changed during the development process, update this page and its tables to reflect the current version number, its supported (and deprecated) devices and operating systems and any other relevant information**. 

**Using a local web server ($ 'rake start' command from the local repo), verify that the new guide version appears and that menus are working properly**. 

##Push changes to the Github repository

**In terminal, execute the following commands, in this order**: 

    git add --all //stages your local changes to be committed

    git commit -m 'note to describe your action' //commits your changes to the repo

    git push //uploads your changes to the repo

The new version of the guide will be visible to the public the next morning. 