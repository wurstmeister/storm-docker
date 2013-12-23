#!/bin/bash

docker kill nimbus; docker rm nimbus
docker kill supervisor; docker rm supervisor
docker kill ui; docker rm ui

