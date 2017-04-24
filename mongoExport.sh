#!/bin/bash

#======================================
# Export Tables from Mongo DB
# By: Josh Faust
#======================================

if [ "$(whoami)" != "root" ]
	then
	echo 'You must be root'
	exit 1
fi


#Create a directory to store the dump in by asking the user for the path 
# and for the dump duration.
todayDate=`echo $(date) | awk '{print $2,$3,$6}' | sed 's/ /_/g'`
read -e -p "What is the path where you would like to dump the table to? " path
cd $path
read -e -p "Enter Data Duration (24hr,48hr,72hr): " hour
fileName=$(echo ${hour}_${todayDate}"_Dump")
mkdir $fileName
cd $fileName

echo ""
echo "======================================"
echo "         Dumping JSON data            "
echo "======================================"
mongoexport --db mnemosyne --collection hpfeed > hpfeed.json
mongoexport --db mnemosyne --collection session  > session.json
mongoexport --db mnemosyne --collection system.indexes > system_indexes.json
mongoexport --db mnemosyne --collection metadata > metadata.json
mongoexport --db mnemosyne --collection file > file.json
mongoexport --db mnemosyne --collection counts > counts.json
mongoexport --db mnemosyne --collection dork > dork.json
mongoexport --db mnemosyne --collection url > url.json
mongoexport --db mnemosyne --collection daily_stats > daily_stats.json
echo""
echo " Done."
echo""
echo "======================================"
echo "         Dumping CSV data             "
echo "======================================"
mongoexport --db mnemosyne --collection session --fields=_id,protocol,source_ip,source_port,destination_port,destination_ip,honeypot,timestamp,identifier --csv > session.csv
mongoexport --db mnemosyne --collection hpfeed --fields=_id,ident,timestamp,normalized,payload,local_host,connection_type,connection_protocol,local_port,remote_port,remote_hostname,connection_transport,remote_host,channel --csv > hpfeeds.csv
mongoexport --db mnemosyne --collection counts --fields=_id,date,identifier,event_count --csv > counts.csv
mongoexport --db mnemosyne --collection daily_stats --fields=_id,channel,date,hourly,23 --csv > daily_stats.csv
mongoexport --db mnemosyne --collection system.indexes --fields=v,key,_id,name,ns --csv > system_indexes.csv
echo""
echo""
echo "Successfully Dumped to $path"
<<<<<<< HEAD
echo ""
=======
echo""
>>>>>>> 22481cd517bbcd5298678716971351a49b4e492b
