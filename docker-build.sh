#!/usr/bin/env bash

set -e
set -o pipefail

readlinkf() { perl -MCwd -e 'print Cwd::abs_path glob shift' "$1"; }
basedir=$(dirname $(readlinkf $0))


### parameter handling
if [ "$#" -eq 0 ]; then
    echo "usage: docker-build.sh <image-tag>" 1>&2
    exit 1
fi

image_tag="$1"

if [[ -z "${image_tag}" ]]; then
    echo "image tag required" 1>&2
    exit 1
fi


### run
if [[ -z `docker images -q "${image_tag}"` ]]; then
    docker build "${basedir}" \
           --tag "${image_tag}"
fi
