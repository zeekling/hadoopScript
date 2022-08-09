#!/usr/bin/env bash 

docker pull bitnami/kafka

docker stop kafka

docker rm kafka

docker run -d --name kafka \
    --network app-tier \
    -e ALLOW_PLAINTEXT_LISTENER=yes \
    -e KAFKA_CFG_ZOOKEEPER_CONNECT=zookeeper-server:2181 \
    bitnami/kafka:latest
