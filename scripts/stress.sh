#!/usr/bin/env bash

docker run --rm ricoli/hey -n 10000000 http://docker.host.internal:8085 &
docker run --rm ricoli/hey -n 10000000 http://docker.host.internal:8086 &
docker run --rm ricoli/hey -n 10000000 http://docker.host.internal:8087 &
docker run --rm ricoli/hey -n 10000000 http://docker.host.internal:8088 &