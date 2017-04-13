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
mongodump --db mnemosyne --collection hpfeed --out $path/hpfeeds.json
mongodump --db mnemosyne --collection session  --out $path/session.json
mongodump --db mnemosyne --collection system.indexes --out $path/SI.json
mongodump --db mnemosyne --collection metadata --out $path/metadata.json
mongodump --db mnemosyne --collection file --out $path/file.json
mongodump --db mnemosyne --collection counts --out $path/counts.json
mongodump --db mnemosyne --collection dork --out $path/dork.json
mongodump --db mnemosyne --collection url --out $path/url.json
mongodump --db mnemosyne --collection daily_stats --out $path/daily_Stats.json
echo""
echo " Done."
echo""
echo "======================================"
echo "         Dumping CSV data             "
echo "======================================"

mongoexport --db mnemosyne --collection session --fields=_id,protocol,source_ip,source_port,destination_port,destination_ip,honeypot,timestamp,identifier --csv

echo "Successfully Dumped to $path"
