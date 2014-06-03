#NewORM


## Overview
<p>NewORM CoreAPI module</p>
<p>New implementation of the RHOM.</p>



##Methods



### databaseClientReset()
Resets client info and sync models (optionally, local models as well)

### databaseFullReset()
Resets selected models, client info and local models.

### databaseFullResetAndLogout()
Resets sync models, client info and local models and does the user logout.

### databaseFullResetEx()
Resets selected models, client info and local models.

### databaseFullclientResetAndLogout()
Resets sync models, client info and local models and does the user logout.

### databaseLocalReset()
Resets local database.

### generateId()
Returns newly generated unique object Id.

### getClientId()
Returns current Client Id.

### haveLocalChanges()
Returns TRUE whenever there are any local (non-synced) changes.

### useNewOrm()
Returns TRUE if NewORM is enabled in rhoconfig.txt.