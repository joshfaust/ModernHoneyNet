# ModernHoneyNet
###  MHN Scripts:

1. **MHN_Install.sh** - Checks if you are root, automatically grabs MHN repository and install in the proper directories.
2. **MHN_Status.sh** - Checks the status of SupervisorCTL on the server side.
3. **HoneyPotRestart.sh** - Checks status of Honeypot\s, restarts honeypot\s, and checks status again.
4. **User_Administration.sh** - Automating the creation and deletion of users.
5. **mongoExport.sh** - Dumps all MHN MongoDB (mnemosyne) data into JSON and CSV files to a user defined path.
6. **getTimestamps.sh** - Grabs all timestamps from MongoDB hpfeeds and session collections.
7. **DELETE_ALL_MHN_MONGO_DATA.sh** - Asks user if they would like to wipe all data from MongoDB collections. _Very usefull when deploying multiple honeypots during pre-defined times for analysis!_
8. **TopAttackers.sh** - Shows current top attacks in console.

### Directories: 

1. **BruteForceDeterrents** - For research purposes: contains IPtable rule scripts dedicated to deter Brute Force Attempts. These scripts were build to build a comparitive analysis from a baseline attack dataset. 



