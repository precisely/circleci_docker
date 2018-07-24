This is a custom image for running Node apps in CircleCI.

```shell
# build image
./docker-build.sh cci-node aneilbaboo/precisely-circleci:2018-07-24v1

# tag
docker tag cci-node:latest aneilbaboo/precisely-circleci:2018-07-24v1

# push
docker push aneilbaboo/precisely-circleci:2018-07-24v1

# create container (running locally)
./docker-create.sh cci-node cci ~

# start container (running locally)
./docker-start.sh cci

# tmux session (running locally)
./docker-tmux.sh cci
```
