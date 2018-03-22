FROM circleci/node:6.10.3

USER root

RUN apt-get install python-dev

RUN curl https://bootstrap.pypa.io/get-pip.py | python

RUN pip install --user --upgrade awscli

ENV PATH=~/.local/bin:${PATH}

RUN curl -L https://codeclimate.com/downloads/test-reporter/test-reporter-latest-linux-amd64 > ~/.local/bin/cc-test-reporter && chmod +x ~/.local/bin/cc-test-reporter

RUN npm install -g yarn

