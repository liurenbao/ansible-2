#!/bin/bash
if [ `sudo ps -C haproxy --no-header | wc -l` -eq 0 ]; then
	sudo systemctl start haproxy
 
	sleep 3
 
    if [ `sudo ps -C haproxy --no-header | wc -l` -eq 0 ]; then
    	sudo systemctl stop keepalived
    fi
fi
