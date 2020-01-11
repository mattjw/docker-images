FROM circleci/python:3.6.8
# Base image source for reference:
# https://github.com/CircleCI-Public/circleci-dockerfiles/tree/master/python/images

RUN \
  echo -e "\nInstalling poetry\n" && \
  mkdir ~/poetry-installer && \
  curl -sSL \
    -o ~/poetry-installer/get-poetry.py \
    https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py && \
  python ~/poetry-installer/get-poetry.py -f -y --version 1.0.2 && \
  bash ~/.poetry/env && \
  rm -r ~/poetry-installer && \
  echo -e "\nInstalling Java\n" && \
  sudo apt-get update && \
  sudo apt-get install openjdk-8-jre

RUN sudo pip install poetry==1.0.2

ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"
# JAVA_HOME can be located via:
#   readlink -f /usr/bin/java | sed "s:bin/java::" 
# Automating this in the Docker image build is sadly not yet straightforward:
# https://github.com/moby/moby/issues/29110
