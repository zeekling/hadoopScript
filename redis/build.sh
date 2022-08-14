#!/usr/bin/env bash 

docker stop redis-cluster 

docker rm redis-cluster

docker run -dit --name="redis-cluster" -e "IP=0.0.0.0" -p 7000-7005:7000-7005 zeekling/redis-cluster:6.2


