#!/bin/bash

#======================================
# MHN Status
# By: Joshua Faust
#======================================

echo '---------------------------------------------'
echo '            Checking MHN status              '
echo '---------------------------------------------'
/etc/init.d/nginx status
/etc/init.d/supervisor status
sudo supervisorctl status


