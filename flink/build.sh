#!/usr/bin/env bash 

docker pull flink:scala_2.12-java8

docker stop jobmanager
docker rm jobmanager
docker stop taskmanager 
docker rm taskmanager

FLINK_PROPERTIES="jobmanager.rpc.address: jobmanager"

docker run -dit --name="jobmanager" \
  --network flink-network -p 8081:8081  \
  --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
  flink:scala_2.12-java8 jobmanager

docker run -dit --name="taskmanager" \
  --network flink-network  \
  --env FLINK_PROPERTIES="${FLINK_PROPERTIES}" \
  flink:scala_2.12-java8 taskmanager
