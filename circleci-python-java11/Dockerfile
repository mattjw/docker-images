FROM circleci/python:3.10.1
# Base image source for reference:
# https://github.com/CircleCI-Public/circleci-dockerfiles/tree/master/python/images

RUN \
  echo -e "\nInstalling poetry\n" && \
  sudo pip uninstall -y poetry && \
  sudo pip install poetry==1.2.2 && \
  echo -e "\nInstalling Java\n" && \
  sudo apt-get update && \
  sudo apt-get install openjdk-11-jre

# Need to set TERM and COLUMNS for trouble between the circleci base image
# and poetry. See: https://github.com/sdispater/clikit/issues/3
ENV TERM=xterm-256color
ENV COLUMNS=100

# JAVA_HOME can be located via:
#   readlink -f /usr/bin/java | sed "s:bin/java::" 
# Automating this in the Docker image build is sadly not yet straightforward:
# https://github.com/moby/moby/issues/29110
ENV JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64/"
ENV PATH="/usr/lib/jvm/java-11-openjdk-amd64/bin:${PATH}"
