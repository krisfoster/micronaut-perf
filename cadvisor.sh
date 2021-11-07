#!/usr/bin/env bash
docker run -d --name=cadvisor \
  -p 8080:8080 \
  --volume=/var/run:/var/run:ro \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --volume=/var/run/docker.sock:/var/run/docker.sock:ro \
  google/cadvisor:latest

