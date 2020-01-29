#!/bin/bash
JDK="openjdk:11"
docker pull $JDK
CACHE="$HOME/gradle.home"
mkdir -p "$CACHE"
D_UID=$(id -u)
D_GID=$(id -g)
D_USER=$(whoami)
CONTAINER_NAME=omni-gradle
SCRIPT_DIR=$(dirname $(realpath $PWD/$0))
REPOS=$(dirname $SCRIPT_DIR)
echo
echo
echo
echo
echo "run './bin/gradlew -g /tmp/.gradle help' to start the daemon"
echo
echo
echo
echo
docker run -v "$REPOS:/data" -v "$CACHE:/tmp/.gradle" -w /data \
	-it --rm --name $CONTAINER_NAME $JDK \
	/bin/bash -c "addgroup --gid $D_GID $D_USER && \
	              adduser --uid $D_UID --gid $D_GID --disabled-password --gecos '' $D_USER && \
		      runuser -u $D_USER -- bash"
