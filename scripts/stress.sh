#!/usr/bin/env bash

echo "openjdk " > openjdk.hey.out && hey -n 10000 --cpus=1 http://localhost:8085 >> openjdk.hey.out &
echo "openjdk " > graalce.hey.out && hey -n 10000 --cpus=1 http://localhost:8086 >> graalce.hey.out &
echo "openjdk " > graalee.hey.out && hey -n 10000 --cpus=1 http://localhost:8087 >> graalee.hey.out &
echo "openjdk " > native.hey.out  && hey -n 10000 --cpus=1 http://localhost:8088 >> native.hey.out  &