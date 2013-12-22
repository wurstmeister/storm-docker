#!/bin/bash

docker kill zookeeper; docker rm zookeeper
docker kill nimbus; docker rm nimbus
docker kill supervisor; docker rm supervisor
docker kill ui; docker rm ui

