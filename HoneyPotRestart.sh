#!/bin/bash

#============================================
# Restart honeypots and check SupervisorCTL
# by: Josh Faust
#============================================

if [ $(whoami) != root ]
	then
	echo 'You must be root to run'
	exit 1
else
	echo '======================================='
	echo '         Status of HoneyPots:          '
	echo '======================================='
	echo ''
	supervisorctl status
	echo '======================================='
        echo '         Restarting HoneyPots:         '
        echo '======================================='
        echo ''
	supervisorctl restart all
	echo '======================================='
        echo '         Status of HoneyPots:          '
        echo '======================================='
        echo ''
        supervisorctl status
fi
exit 0
