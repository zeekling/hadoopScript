#!/usr/bin/env bash 

# docker pull zeekling/hadoop 

docker stop hadoop 

docker rm hadoop

docker run -dit --name hadoop --privileged=true \
  -v /data/hadoop/dfs:/dfs/data \
  -p 8042 -p 8088 -p 19888 -p 50070 -p 50075 zeekling/hadoop

