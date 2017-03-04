#!/bin/bash

#===============================
# User Administration Panel
# By: Joshua Faust
#===============================

if [ "$(whoami)" != "root" ]
	then
	echo "You need to be root, exiting program"
	exit 1
fi 

echo -n 'Would you like to add or delete a user? '; read userdecision
if [ $userdecision == "add" ] || [ $userdecision == "Add"]
	then
	echo -n "What is the username you would like to add? "; read username
	adduser $username
	# ask user if they would like the new user to have Sudoer rights
	echo -n 'Would you like $username to have Sudoer Rights? (y|n) '; read sudoer
	if [ $sudoer == "y" ] || [ $sudoer == "Y" ] 
		then
		usermod -aG sudo $username
		echo "$username has been added to the Sudoers file"
	fi
elif [ $userdecision == "delete" ] || [ $userdecision == "Delete" ]
	then
	echo -n 'What is the username you would like to delete? '; read deluser
	deluser --remove-home $deluser
	echo "$deluser has been removed and their home directory deleted"
fi
exit 1


