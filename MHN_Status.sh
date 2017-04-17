#!/bin/bash

#======================================
# MHN Status
# By: Joshua Faust
#======================================

if [ $(whoami) != "root" ]
	then
	echo ""
	echo "You must be root to check the supervosrctl Status."
	echo "Checking Nginx status and Supervisor Status"
fi

echo '---------------------------------------------'
echo '            Checking MHN status              '
echo '---------------------------------------------'

/etc/init.d/nginx status
/etc/init.d/supervisor status
supervisorctl status


