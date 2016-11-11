#!/bin/bash

set -e

## ARGUMENTS
if [ "$#" == "1" ]; then
    USER_NAME="$1"
else
    echo "Usage: $0 USER_NAME"
    exit 1
fi

## DEBIAN VERSION DETECTION
DEBIAN_VERSION=$(cat /etc/debian_version | sed "s/\..*$//g")

## ADD WHEEZY BACKPORTS
if [ "$DEBIAN_VERSION" == "7" ]; then
    if [[ $(grep "wheezy-backports" /etc/apt/sources.list) == "" ]]; then
        echo "deb http://http.debian.net/debian wheezy-backports main" >> /etc/apt/sources.list
    fi
fi

## CLEAN & PREPARE
apt-get purge "lxc-docker*" || echo ""
apt-get purge "docker.io*" || echo ""

## GPG DEPENDENCIES
apt-get update
apt-get install -y apt-transport-https ca-certificates

## ADD GPG KEY
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

## ADD REPOSITORY
if [ "$DEBIAN_VERSION" == "7" ]; then           ## WHEEZY
    if [[ $(grep "apt.dockerproject.org" /etc/apt/sources.list.d/docker.list) == "" ]]; then
        echo "deb https://apt.dockerproject.org/repo debian-wheezy main" >> /etc/apt/sources.list.d/docker.list
    fi
elif [ "$DEBIAN_VERSION" == "8" ]; then         ## JESSIE
    if [[ $(grep "apt.dockerproject.org" /etc/apt/sources.list.d/docker.list) == "" ]]; then
        echo "deb https://apt.dockerproject.org/repo debian-jessie main" >> /etc/apt/sources.list.d/docker.list
    fi
else                                            ## UNKNOWN
    echo "ERROR: This debian version ($DEBIAN_VERSION) is not managed"
    exit 1
fi

## INSTALL DOCKER
apt-get update
apt-get install -y init-system-helpers docker-engine
service docker start

## ADD USER TO DOCKER GROUP
usermod -a -G docker "$USER_NAME"

## THE END
echo "Just logout and in again"
