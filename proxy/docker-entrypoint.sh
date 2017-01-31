#!/bin/sh

if [ "$CONF_FILE" != "" ]; then
    echo "Include \"conf/$CONF_FILE\"" >> conf/httpd.conf
    echo "Using: '$CONF_FILE' as configuration file"
fi

httpd-foreground
