#!/bin/bash

container=${buildah from ubuntu:latest}
buildah config --label maintainer="dfoley" $container

buildah run $cotainer apt install apache2

buildah config --port 80 $container
buildah commit --format docker $container test:latest
