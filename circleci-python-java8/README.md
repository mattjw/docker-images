# Docker image with Python and Java 8 support for CircleCI pipelines

This image is:

- intended for use in CircleCI pipelines
- to build Python projects
- using the Poetry packager
- with access to a Java 8 (1.8) runtime environment

## Publish to Github Packages

- Create/retrieve a Github personal access token
  [via the Github website](https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line#creating-a-token). At a minimum,
  the token will need the `write:packages` and `read:packages` permissions.
- Execute the publish script with the env var set:
  ```bash
  export GITHUB_TOKEN=xyz
  bash publish.sh
  ```

See [Authenticating to GitHub Packages](https://help.github.com/en/github/managing-packages-with-github-packages/configuring-docker-for-use-with-github-packages#authenticating-to-github-packages)
for more information.

Due to this [limitation](https://github.community/t5/GitHub-Actions/Overwrite-Docker-image-in-GitHub-Package-Registry/td-p/33511)
of Github Packages, it is not yet possible to overwrite a docker image. For this reason, each
uploaded image has a truncated SHA256 hash affixed to its tag name.
