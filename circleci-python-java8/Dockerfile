FROM circleci/python:3.6.8
# Base image source for reference:
# https://github.com/CircleCI-Public/circleci-dockerfiles/tree/master/python/images

RUN \
  echo -e "\nInstalling poetry\n" && \
  sudo pip uninstall -y poetry && \
  mkdir ~/poetry-installer && \
  curl -sSL \
    -o ~/poetry-installer/get-poetry.py \
    https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py && \
  python ~/poetry-installer/get-poetry.py -f -y --version 1.0.2 && \
  rm -r ~/poetry-installer && \
  sudo ln -s ~/.poetry/bin/poetry /usr/local/bin/poetry && \
  echo -e "\nInstalling Java\n" && \
  sudo apt-get update && \
  sudo apt-get install openjdk-8-jre

# Need to set TERM and COLUMNS for trouble between the circleci base image
# and poetry. See: https://github.com/sdispater/clikit/issues/3
ENV TERM=xterm-256color
ENV COLUMNS=100

# JAVA_HOME can be located via:
#   readlink -f /usr/bin/java | sed "s:bin/java::" 
# Automating this in the Docker image build is sadly not yet straightforward:
# https://github.com/moby/moby/issues/29110
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"

# Allow this image to also be used in Github Actions
# See: https://github.community/t5/GitHub-Actions/EACCES-permission-denied-How-to-solve/td-p/34488
RUN \
  sudo mkdir /github && \
  sudo chown circleci /github && \
  sudo chmod 777 /github
