#!/usr/bin/env bash

echo "Log into Docker hub..."
docker login
echo "Log into Oracle Container Reg - needed fro GraalVM EE"
docker login container-registry.oracle.com

echo "Build our app containers - each on a different Java platform"
mvn clean install -DskipTests
mvn clean install -Pgraalce -DskipTests
mvn clean install -Pgraalee -DskipTests
#mvn clean install -Pnativeee -DskipTests

echo "Start up our stack using docker-compose - this will also start up reporting tools & stress testing"
docker-compose up
