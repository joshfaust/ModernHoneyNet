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

mongodump --db mnemosyne --collection hpfeed --out $path/hpfeeds.json
mongodump --db mnemosyne --collection session  --out $path/session.json
mongodump --db mnemosyne --collection system.indexes --out $path/SI.json

echo "Successfully Dumped to $path"
