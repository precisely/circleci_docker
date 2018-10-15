
This is a modification of CircleCI's node image.

This docker image is available as aneilbaboo/node:8.10.


```shell
# create a tag for the current date 
TAG=aneilbaboo/precisely-circleci-node-`date +%Y-%m-%d`

# build
docker build . -t $TAG

# push
docker push $TAG

# prompt
docker run -it $TAG /bin/bash
```

Remember to update `precisely/web/.circleci/config.yml` with the new tag.
