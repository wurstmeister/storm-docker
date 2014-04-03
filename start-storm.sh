#!/bin/bash

ZOOKEEPER=`docker ps -a | awk '{print $NF}'  | grep "zookeeper$"`
ZOOKEEPER_RUNNING=$?
if [ $ZOOKEEPER_RUNNING -eq 0 ] ;
then
    echo "Zookeeper is already running"
else
    echo "Starting Zookeeper"
    docker run -p 49181:2181  -h zookeeper --name zookeeper -d jplock/zookeeper
fi

docker run -p 49773:3773 -p 49772:3772 -p 49627:6627 --name nimbus --link zookeeper:zk -h nimbus -d wurstmeister/storm-nimbus 
docker run -p 49000:8000 --name supervisor --link nimbus:nimbus --link zookeeper:zk -h supervisor -d wurstmeister/storm-supervisor
docker run -p 49080:8080 --name ui --link nimbus:nimbus --link zookeeper:zk -d wurstmeister/storm-ui
