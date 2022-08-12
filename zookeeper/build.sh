#!/usr/bin/env bash 

docker pull harisekhon/zookeeper  

docker stop zookeeper-server 

docker rm zookeeper-server

docker run -dit --name zookeeper-server \
    -p 2181:2181 -p 3181:3181 -p 4181:4181 \
    harisekhon/zookeeper 
