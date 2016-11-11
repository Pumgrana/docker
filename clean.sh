#!/bin/bash

docker rm $(docker ps -q -f status=exited)
docker rmi $(docker images -q -f dangling=true)
docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
