#!/bin/sh
docker run -i -t --link storm_nimbus_1:nimbus  -p 22 wurstmeister/storm /bin/bash
