#!/bin/bash

echo "---------------------------------"
echo "   Dumping Sessions Timestamps   "
echo "---------------------------------"
echo""
mongoexport -db mnemosyne --collection session --fields=honeypot,timestamp --csv > SessionTimestamps.csv

echo "---------------------------------"
echo "   Dumping Sessions Timestamps   "
echo "---------------------------------"
echo""
mongoexport -db mnemosyne --collection hpfeed --fields=timestamp --csv > HPfeedTimestamps.csv

