FROM python:3.6.8-stretch
# Base image source for reference:
# https://hub.docker.com/_/python
#
# CircleCI's image is also a useful reference:
# https://github.com/CircleCI-Public/circleci-dockerfiles/blob/master/python/images/3.6.8/Dockerfile

ENV DEBIAN_FRONTEND=noninteractive

# To use this image in a Github Actions container, git must be at version 2.18
# or greater. Otherwise, the checkout action will not copy the `.git` metadata
# directory. See: https://github.com/actions/checkout/issues/126

RUN \
  apt-get update && \
  echo "\nDoing locale-gen (to allow LANG to be set correctly later)\n" && \
  apt-get install -y locales && \
  locale-gen C.UTF-8 || true && \
  echo "\nUpgrading git (build from scratch)\n" && \
  apt remove -y git && \
  apt install -y make libssl-dev libghc-zlib-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip && \
  mkdir /home/build-git && \
  cd /home/build-git && \
  wget https://github.com/git/git/archive/v2.18.0.zip -O git.zip && \
  unzip -q git.zip && \
  cd git-* && \
  make prefix=/usr/local all && \
  make prefix=/usr/local install && \
  rm -r /home/build-git && \
  cd / && \
  echo "\nInstalling poetry\n" && \
  pip install poetry==1.0.5 && \
  echo "\nInstalling Java\n" && \
  apt-get install -y openjdk-8-jre

# Set timezone to UTC by default
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime

# Use unicode
ENV LANG=C.UTF-8

# Explicitly set TERM and COLUMNS
ENV TERM=xterm-256color
ENV COLUMNS=100

# JAVA_HOME can be located via:
#   readlink -f /usr/bin/java | sed "s:bin/java::" 
# Automating this in the Docker image build is currently not straightforward:
# https://github.com/moby/moby/issues/29110
ENV JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/jre/"

WORKDIR /home
