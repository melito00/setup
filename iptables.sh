#!/bin/sh

# Delete all rules
iptables -F
iptables -t nat -F

# Delete all user defined chains
iptables -X
iptables -t nat -X

# Set default policy
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

# Define chain for logging
iptables -N NFLOG_ACCEPT
iptables -A NFLOG_ACCEPT -j NFLOG --nflog-group 1 --nflog-prefix "nflog"
iptables -A NFLOG_ACCEPT -j ACCEPT

iptables -N NFLOG_DROP
iptables -A NFLOG_DROP -j NFLOG
iptables -A NFLOG_DROP -j DROP

# Accept all packet to loopback interface
iptables -A INPUT -i lo -j ACCEPT

# Define variables
## Addressses
any=0/0
hds=80.68.12.2/32

## Ports
ssh=22
anyport=1024:65535

## Inteface
oint=ens3

# -A chain -p protocol -s source addr--sport source port -d destination addr --dport destination port -j target

## SSH
##   ACCEPT: 0.0.0.0/0:* -> 10.0.2.15/32:22  
##   DROP  : 0.0.0.0/0:* -> 
iptables -A INPUT -p tcp -s $any --sport $anyport -d 10.0.2.15/32 --dport $ssh -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s $hds --dport $ssh -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -p tcp -s $any --dport $ssh -j NFLOG_DROP
#iptables -A OUTPUT -p tcp -s 10.0.2.15/32 --sport $ssh -d $any --dport $anyport -m state --state ESTABLISHED,RELATED

## IDENT
iptables -A INPUT -p tcp -s $any --dport 113 -j REJECT --reject-with icmp-port-unreachable

## openvpn
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -o $oint -j MASQUERADE

# Accept All Return Packet
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
