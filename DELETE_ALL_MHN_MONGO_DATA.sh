#!/bin/bash

#============================================
# Delete All MongoDB data for a clean start
# By: Joshua Faust
#============================================

echo -n "Are you sure you want to Delete all database data? (Y|N): "; read answer

if [ $answer == "Y" ] || [ $answer == "y" ]
	then
mongo mnemosyne --eval "db.session.remove({})"
mongo mnemosyne --eval "db.metadata.remove({})"
mongo mnemosyne --eval "db.counts.remove({})"
mongo mnemosyne --eval "db.file.remove({})"
mongo mnemosyne --eval "db.hpfeed.remove({})"
mongo mnemosyne --eval "db.dork.remove({})"
mongo mnemosyne --eval "db.url.remove({})"
mongo mnemosyne --eval "db.daily_stats.remove({})"
else
	echo "Quitting now. Nothing has been deleted"
fi
exit 0

