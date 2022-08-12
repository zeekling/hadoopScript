#!/usr/bin/env bash 

docker pull harisekhon/kafka 

docker stop kafka

docker rm kafka

docker run -dit --name kafka \
   -p 2182:2181 -p 9092:9092 \
    harisekhon/kafka:latest
