#!/bin/bash

container=${buildah from ubuntu:latest}
buildah config --label maintainer="dfoley" $container

buildah run $container apt install apache2

buildah config --port 80 $container
buildah commit --format docker $container test:latest

podman run -d --name testApache -p 8081:80 localhost/test
