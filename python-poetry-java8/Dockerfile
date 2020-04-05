FROM python:3.6.8-stretch
# Base image source for reference:
# https://hub.docker.com/_/python
#
# CircleCI's image is also a useful reference:
# https://github.com/CircleCI-Public/circleci-dockerfiles/blob/master/python/images/3.6.8/Dockerfile

RUN \
  echo -e "\nInstalling poetry\n" && \
  pip install poetry==1.0.2 && \
  echo -e "\nInstalling Java\n" && \
  apt-get update && \
  apt-get install -y openjdk-8-jre

# # Use unicode
# RUN locale-gen C.UTF-8 || true
# ENV LANG=C.UTF-8

# # Need to set TERM and COLUMNS for trouble between the circleci base image
# # and poetry. See: https://github.com/sdispater/clikit/issues/3
# ENV TERM=xterm-256color
# ENV COLUMNS=100

# JAVA_HOME can be located via:
#   readlink -f /usr/bin/java | sed "s:bin/java::" 
# Automating this in the Docker image build is sadly not yet straightforward:
# https://github.com/moby/moby/issues/29110
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"

WORKDIR /home
