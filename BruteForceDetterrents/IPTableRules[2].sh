
#!/bin/bash

iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW -m recent --set --name SSH --rsource
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m recent --rcheck --seconds 30 --hitcount 4 --rttl --name SSH --rsource -j REJECT --reject-with tcp-reset
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m recent --rcheck --seconds 30 --hitcount 3 --rttl --name SSH --rsource -j LOG --log-prefix "SSH brute force "
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m recent --update --seconds 30 --hitcount 3 --rttl --name SSH --rsource -j REJECT --reject-with tcp-reset
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT

#Reject any ICMP ping requests

iptables  -I  INPUT  -i  eth0  -p   icmp  -s  0/0  -d  0/0   -j  DROP
# We also ran these commands as sudo added these rules within the /etc/sysctl.conf file:
#net.ipv4.icmp_echo_ignore_all=1
#net.ipv6.icmp_echo_ignore_all=1

