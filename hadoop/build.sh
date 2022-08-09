#!/usr/bin/env bash 

docker pull harisekhon/hadoop 

docker stop hadoop 

docker rm hadoop

docker run -dit --name hadoop --privileged=true \
  -p 8042 -p 8088 -p 19888 -p 50070 -p 50075 harisekhon/hadoop

