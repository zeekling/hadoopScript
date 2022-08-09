#!/usr/bin/env bash 

docker pull bitnami/zookeeper 

docker stop zookeeper-server 

docker rm zookeeper-server

docker run -d --name zookeeper-server \
    --network app-tier \
    -e ALLOW_ANONYMOUS_LOGIN=yes \
    bitnami/zookeeper:latest
