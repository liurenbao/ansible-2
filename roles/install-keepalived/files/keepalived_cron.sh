#!/bin/bash
SERVICE="keepalived"
if pgrep -x "$SERVICE" >/dev/null
then
    echo "$SERVICE is running"
else
    echo "$SERVICE stopped"
    systemctl start $SERVICE
fi