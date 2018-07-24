#!/usr/bin/env bash

set -e
set -o pipefail

readlinkf() { perl -MCwd -e 'print Cwd::abs_path glob shift' "$1"; }
basedir=$(dirname $(readlinkf $0))


### parameters
if [ "$#" -eq 0 ]; then
    echo "usage: docker-create.sh <image-tag> <container-name> <volume-path>?" 1>&2
    exit 1
fi

image_tag="$1"
container_name="$2"
volume_path="$3"

if [[ -z "${image_tag}" ]]; then
    echo "image tag required" 1>&2
    exit 1
fi

if [[ -z "${container_name}" ]]; then
    echo "container name required" 1>&2
    exit 1
fi

if [[ ! -z "${volume_path}" ]]; then
    volume_path=$(readlinkf "${volume_path}")
fi


### run
if [[ ! -z "${image_tag}" ]]; then
    docker create -i -t --name "${container_name}" \
           --volume "${volume_path}":/mnt \
           "${image_tag}"
else
    docker create -i -t --name "${container_name}" \
           "${image_tag}"
fi
