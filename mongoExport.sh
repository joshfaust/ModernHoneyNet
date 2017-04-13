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


echo -n "What is the path where you would like to dump the table to? "; read path
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
cd $path

mongoexport --db mnemosyne --collection session --fields=_id,protocol,source_ip,source_port,destination_port,destination_ip,honeypot,timestamp,identifier --csv > session.csv
mongoexport --db mnemosyne --collection hpfeed --fields=_id,ident,timestamp,normalized,payload,local_host,connection_type,connection_protocol,local_port,remote_port,remote_hostname,connection_transport,remote_host,channel --csv > hpfeeds.csv
mongoexport --db mnemosyne --collection counts --fields=_id,date,identifier,event_count --csv > counts.csv
mongoexport --db mnemosyne --collection daily_stats --fields=_id,channel,date,hourly,23 --csv > daily_stats.csv
mongoexport --db mnemosyne --collection system.indexes --fields=v,key,_id,name,ns --csv > system_indexes.csv
echo""
echo""
echo "Successfully Dumped to $path"
