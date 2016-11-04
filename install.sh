#!/bin/bash

sudo apt-get purge "lxc-docker*"
sudo apt-get purge "docker.io*"
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c 'echo "deb https://apt.dockerproject.org/repo debian-wheezy main" >> /etc/apt/sources.list.d/docker.list'
sudo apt-get update
sudo apt-get install docker-engine
sudo service docker start
