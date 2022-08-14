# hadoop相关docker 镜像
支持Redis、Hadoop、Kafka、Zookeeper等的搭建

## Redis 
基于Redis 6.2 搭建的集群模式

```bash 
docker pull zeekling/redis-cluster:6.2
docker stop redis-cluster 
docker rm redis-cluster 
docker run -dit --name="redis-cluster" -e "IP=0.0.0.0" \ 
     -p 7000-7005:7000-7005 zeekling/redis-cluster:6.2
```

## Hadoop
Hadoop集群搭建

```bash 
docker pull harisekhon/hadoop 
docker stop hadoop 
docker rm hadoop
docker run -dit --name hadoop --privileged=true \
  -p 8042 -p 8088 -p 19888 -p 50070 -p 50075 harisekhon/hadoop
```

## Kafka 
```bash 
docker pull harisekhon/kafka 
docker stop kafka
docker rm kafka
docker run -dit --name kafka \
   -p 2182:2181 -p 9092:9092 \
    harisekhon/kafka:latest
```

## Zookeeper

```bash 
docker pull harisekhon/zookeeper  
docker stop zookeeper-server 
docker rm zookeeper-server
docker run -dit --name zookeeper-server \
    -p 2181:2181 -p 3181:3181 -p 4181:4181 \
    harisekhon/zookeeper
```


