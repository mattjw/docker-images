# Docker image with Python and Java 11 support for CircleCI pipelines

This image is:

- intended for use in CircleCI pipelines
- to build Python projects
- using the Poetry packager
- with access to a Java 11 runtime environment

## Publish to Docker Hub

Docker Hub repository: [`mattjwnet/circleci-python-java11`](https://hub.docker.com/r/mattjwnet/circleci-python-java11/tags)

Build and publish are automated via Github Actions. See `.github/workflows` at the root of this repo.

## Publish to Github Packages

> ❌ **DEPRECATED:** Until Github Packages supports login-less image pulls for public images, this method
is deprecated. Instead, use images as published to Docker Hub.

Github repository: [`https://ghcr.io/mattjw/docker-images/circleci-python-java11`](https://github.com/users/mattjw/packages/container/package/docker-images%2Fcircleci-python-java11)

- Create/retrieve a Github personal access token
  [via the Github website](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token). At a minimum,
  the token will need the `write:packages` and `read:packages` permissions.
- Execute the publish script with the env var set:
  ```bash
  export GITHUB_TOKEN=xyz
  bash publish-to-github.sh
  ```

See [Authenticating to GitHub Packages](https://help.github.com/en/github/managing-packages-with-github-packages/configuring-docker-for-use-with-github-packages#authenticating-to-github-packages)
for more information.
