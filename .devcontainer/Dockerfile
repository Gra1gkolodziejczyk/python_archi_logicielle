FROM mcr.microsoft.com/devcontainers/python:1-3.12-bullseye

# Install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends git zsh nano vim gnupg software-properties-common
