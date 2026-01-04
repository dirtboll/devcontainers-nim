ARG BASE_IMAGE=mcr.microsoft.com/devcontainers/base:noble
ARG NIM_VERSION=2.2.6

FROM $BASE_IMAGE AS base
ARG NIM_VERSION
RUN apt update && apt install -y build-essential curl                              && \
    mkdir -p /opt/Nim                                                              && \
    cd /opt/Nim                                                                    && \
    curl -fsSLo nim.tar.gz https://nim-lang.org/download/nim-$NIM_VERSION.tar.xz   && \
    tar -xvf nim.tar.gz --strip-components 1                                       && \
    sh build_all.sh
ENV PATH=$PATH:/opt/Nim/bin
RUN nimble install nimlangserver