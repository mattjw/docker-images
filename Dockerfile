FROM circleci/python:3.6.8
# Base image source for reference:
# https://github.com/CircleCI-Public/circleci-dockerfiles/tree/master/python/images

RUN sudo apt-get update && \
  sudo apt-get install openjdk-8-jre && \
  sudo pip install poetry~=1.0.0

# FROM circleci/openjdk:8u232-jdk  # fixme
