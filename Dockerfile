# @AUTHOR: imyme6yo "imyme6yo@gmail.com"
# @DRAFT: 20200511
# Arguments
ARG PYTHON=3.8.2
ARG ALPINE=3.11
ARG TAG=${PYTHON}-alpine${ALPINE}

FROM python:${TAG}

# Labels
LABEL maintainer="imyme6yo"
LABEL email="imyme6yo@gmail.com"

# Arguments
ARG DEBUG="true"
ARG DIR=code
ARG PROJECT=myapp
ARG SERVICE=${PROJECT}-provision
ARG IMAGE=${SERVICE}
ARG CONTAINER=${SERVICE}-01

# Envs
ENV DEBUG=${DEUBG}
ENV DIR=${DIR}
ENV PROJECT=${PROJECT}

# Apk packages
RUN apk update && apk upgrade
RUN apk add --no-cache python3-dev musl-dev libffi-dev openssl-dev build-base gcc
RUN apk add --no-cache docker openrc
RUN rc-update add  docker boot

# # Python packages
RUN pip install --upgrade pip
RUN pip install cffi
RUN pip install ansible
RUN pip install docker
RUN pip install docker-compose
RUN pip install kafka-python
RUN pip install tox

# Workspace
RUN mkdir ${DIR}
WORKDIR ${DIR}