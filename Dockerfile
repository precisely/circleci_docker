FROM circleci/node:8.10

USER root

RUN apt-get update && apt-get install -y --no-install-recommends apt-utils

RUN apt-get install python-dev

RUN curl https://bootstrap.pypa.io/get-pip.py | python

RUN export PATH=/root/.local/bin:${PATH}

ENV PATH=/root/.local/bin:${PATH}

RUN pip install --user --upgrade awscli

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ~/.local/bin/cc-test-reporter && chmod +x ~/.local/bin/cc-test-reporter

RUN apt-get update

RUN apt-get install default-jre

RUN npm install -g npm@6.1.0

RUN npm install -g yarn@1.7.0

RUN npm set unsafe-perm true

RUN apt-get install emacs
