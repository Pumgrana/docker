#!/bin/bash

IMAGES=$(docker images | grep -v "REPOSITORY" | grep -v "1 days ago" | grep -v "hours ago" | grep -v "minutes ago" | grep -v "seconds ago" | awk '{print $1,$2}' | sed "s/ /:/g" | sort -u)
SIZE_BEFORE=$(df | grep /var/lib/docker | awk '{print $4}')

IMAGE_REMOVED=0
for IMAGE in ${IMAGES}; do
    if [[ "${IMAGE}" == *":<none>" ]] || [[ "${IMAGE}" == *":" ]]; then
        IMAGE=$(echo "${IMAGE}" | sed 's/:.*$//g')
    fi
    IS_RUNNING=$(docker ps | grep -v "IMAGE" | awk '{print $2}' | grep "^${IMAGE}\$")
    if [ -z "${IS_RUNNING}" ]; then
        docker rmi "${IMAGE}"
        IMAGE_REMOVED=$(expr ${IMAGE_REMOVED} + 1)
    fi
done

docker rmi $(docker images -q -f dangling=true)
docker run -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker:/var/lib/docker --rm martin/docker-cleanup-volumes
docker rmi martin/docker-cleanup-volumes

SIZE_AFTER=$(df | grep /var/lib/docker | awk '{print $4}')

SIZE_DIFF=$(echo "${SIZE_AFTER} - ${SIZE_BEFORE}" | bc)
UNIT="Ko"
if [ "${SIZE_DIFF}" -gt 1024 ]; then
    UNIT="Mo"
    SIZE_DIFF=$(echo "${SIZE_DIFF} / 1024" | bc)
fi
if [ "${SIZE_DIFF}" -gt 1024 ]; then
    UNIT="Go"
    SIZE_DIFF=$(echo "${SIZE_DIFF} / 1024" | bc)
fi

echo -e "\nImage removed: ${IMAGE_REMOVED}"
echo -e "Free disk space: ${SIZE_DIFF}${UNIT}"
