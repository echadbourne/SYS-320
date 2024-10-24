#!/bin/bash

#run ip addr and grep for the local ip

ip addr | grep "inet" | grep -o -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\/[0-9]{1,2}" | \
	grep -o -E "10.0.17.[0-9]{1,3}"

# Starts bt greping for the ip address that appears after "inet"
# Then greps for all of the ip addresses that include subnet masks (therefore excluding the broadcast address)
# Then filters that for 10.0.17 addresses and removes the subnet mask.
# This could be changed to a prefix variable to make it more versatile
