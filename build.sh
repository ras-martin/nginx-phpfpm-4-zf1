#!/bin/bash

DOCKER_REPOSITORY="rasmartin/nginx-phpfpm-4-zf1"

# Usage prints the help for this command.
usage() {
  >&2 echo "Usage:"
  >&2 echo "    sh build.sh distro"
  >&2 echo ""
  >&2 echo "Available distros:"
  >&2 echo "    alpine-3.10:amd64 ..... Alpine Linux v3.10, architecture amd64: uses PHP 7.3, Nginx 1.16"
  exit 1
}

build() {
    local DISTRO=$1
    echo "Start building docker image for distro $DISTRO"

    local DOCKER_TAG=${DISTRO/:/-}

    if [ -f "distros/$DISTRO/Dockerfile" ];
    then
        docker build \
            --rm \
            --no-cache \
            --pull \
            --tag $DOCKER_REPOSITORY:$DOCKER_TAG \
            -f distros/$DISTRO/Dockerfile \
            .
    else
        echo "Error. Expected file distros/$DISTRO/Dockerfile not found. Abort."
        exit 1
    fi
}

case "$1" in
  alpine-3.10:amd64) build "alpine-3.10:amd64" ;;
  all) build "alpine-3.10:amd64" ;;
  *) usage ;;
esac
