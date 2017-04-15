#!/bin/bash

## Below includes very successful deterrents for SSH brute force
## that allows a maximum of 4 connection attempts within a minute.
iptables -A INPUT -p tcp -m state --state NEW --dport 22 -m recent --name sshattack --set
iptables -A INPUT -m recent --name sshattack --rcheck --seconds 60 --hitcount 4 -m limit --limit 4/minute -j LOG --log-prefix 'SSH attack: '
iptables -A INPUT -m recent --name sshattack --rcheck --seconds 60 --hitcount 4 -j DROP
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT

