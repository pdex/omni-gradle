#!/bin/bash -x
CONTAINER_NAME=omni-gradle
SUB_DIR=$(basename $PWD)
docker exec -it -w /data/$SUB_DIR -u $(whoami) $CONTAINER_NAME ./gradlew -g /tmp/.gradle $*
