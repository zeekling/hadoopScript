#!/usr/bin/env bash 

#docker pull flink:scala_2.12-java8
# docker pull flink:1.15-scala_2.12-java8

docker stop jobmanager
docker rm jobmanager
docker stop taskmanager 
docker rm taskmanager

FLINK_PROPERTIES="jobmanager.rpc.address: jobmanager"

docker run -dit --name="jobmanager" \
  --detach -p 8081:8081  \
  --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
  flink:1.15-scala_2.12-java8 jobmanager

docker run -dit --name="taskmanager" \
  --detach   \
  --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
  flink:1.15-scala_2.12-java8 taskmanager
