#!/bin/bash

set -ex

OS=${1:-archlinux}
VERSION=${2:-latest}

TAG=latest-${OS}-${VERSION}
if [ "${OS}" = "archlinux" ]; then
  TAG=latest-${OS}
fi

docker build --build-arg TAG=${VERSION} --file Dockerfile.${OS} --tag volkerraschek/latex:${TAG} .
echo ${CONTAINER_IMAGE_REGISTRY_PASSWORD} | docker login docker.io --username volkerraschek --password-stdin
docker push volkerraschek/latex:${TAG}
docker image rm volkerraschek/latex:${TAG}