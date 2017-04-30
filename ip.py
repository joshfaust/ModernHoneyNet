#!/usr/bin/python
import csv
from geoip import geolite2

iplist = []
clist = []

with open('ip.csv', 'rb') as csvfile:
    spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
    for row in spamreader:
#        print ', '.join(row)
        ip = ', '.join(row)
	try:
        	match = geolite2.lookup(ip)
		c = match.country

		iplist.append(ip)
		clist.append(c)

	except AttributeError:
		print '...'
		iplist.append(ip)
		clist.append('null')

with open('countries.csv', 'w') as csvfile:
        fieldnames = ['IP', 'Country']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

	k=0
	for i in iplist:
       		writer.writerow({'IP': iplist[k], 'Country': clist[k]})
		k+=1

