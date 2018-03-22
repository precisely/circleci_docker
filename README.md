
This is a modification of CircleCI's node image.

This docker image is available as aneilbaboo/node:6.10.3.

```shell
# build
docker build . -t aneilbaboo/node:6.10.3

# push
docker push aneilbaboo/node:6.10.3

# prompt
docker run -it aneilbaboo/node:6.10.3 /bin/bash

```