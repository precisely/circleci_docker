#!/usr/bin/env bash

set -e
set -o pipefail


### parameters
if [ "$#" -eq 0 ]; then
    echo "usage: docker-tmux.sh <container-name>" 1>&2
    exit 1
fi

container_name="$1"

if [[ -z "${container_name}" ]]; then
    echo "container name required" 1>&2
    exit 1
fi


### run
# awkward, but works around Docker tty problems and prevents container loss when
# exiting tmux rather than detaching:
docker exec -ti ${container_name} script -q -c "tmux attach || tmux new" /dev/null
