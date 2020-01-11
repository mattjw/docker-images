FROM circleci/python:3.6.8
# Base image source for reference:
# https://github.com/CircleCI-Public/circleci-dockerfiles/tree/master/python/images

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/1.0.2/get-poetry.py | python && \
  sudo apt-get update && \
  sudo apt-get install openjdk-8-jre

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"
# JAVA_HOME can be located via:
#   readlink -f /usr/bin/java | sed "s:bin/java::" 
# Automating this in the Docker image build is sadly not yet straightforward:
# https://github.com/moby/moby/issues/29110
