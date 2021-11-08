#!/usr/bin/env bash

echo "Log into Docker hub..."
#docker login
echo "Log into Oracle Container Reg - needed fro GraalVM EE"
docker login container-registry.oracle.com

echo "Build our app containers - each on a different Java platform"
echo "Building openjdk...."
mvn clean install -DskipTests
echo "Building GraalCE...."
mvn clean install -Pgraalce -DskipTests
echo "Building GraalEE...."
mvn clean install -Pgraalee -DskipTests

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     mvn install -Pnativeee -DskipTests && docker build -f Dockerfile.native --build-arg APP_FILE=ping -t krisfoster/ping:native.0.2 .;;
    Darwin*)    docker build -f ./docker-ni-build/Dockerfile.nativebuild -t krisfoster/ping:native.0.2 .;;
    *)          echo "Not running on Linux / OX - so not bulding a native image....";;
esac

echo "Start up our stack using docker-compose - this will also start up reporting tools & stress testing"
#docker-compose up
