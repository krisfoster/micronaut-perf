# Micronaut : Comparing A simple Application Running on Different Deplyment Runtimes

The idea is to deploy the same micronaut application onto different runtimes to compare the performance charecteristics.

Deployment choices - detaisl on containers used can be taken from the docker files:
* OpenJDK 11
* GraalCE 21.3.0 JDK 11
* GraalEE 21.3.0 JDK 11
* GraalEE 21.3.0 JDK 11, Native Image

## Building

To build:

```shell
./build.sh
```

**NOTE** : On linux the build script will build the native image directly on your OS and then package it. On OSX we
need to use an intermediaate docker container to build, so that we can generate a linux compatible executable. The build script *should* 
handle this.

## Running

```shell
docker-compose up
```

From a separate shell - to run the stress testing scripting:

```shell
./scripts/stress.sh
```
This will generate a number of file ending with `*.hey.out`. These are the output from the stress testing tool, `hey`. They display stats an a 
latency bar chart for each deployed endpoint.


## Prometheus Query for HTTP Requests Per Second
Prometheus can be accesed from - [http://localhost:9090/graph](http://localhost:9090/graph).

Use the following query to get requests per second stats for the ping URL for all running services:
```
http_server_requests_seconds_sum{uri="/ping"}
```

## Ideas for Improvement

### Lanuch Stress Testing From Docker Compose
Add the following to the `docker-compose.yml`:
```yaml
stress-openjdk:
  image: ricoli/hey
  command: -n 10000000 http://ping-openjdk:8080
  depends_on:
    - "ping-openjdk"
stress-graalce:
  image: ricoli/hey
  command: -n 10000000 http://ping-graalce:8080
  depends_on:
    - "ping-graalce"
stress-graalee:
  image: ricoli/hey
  command: -n 10000000 http://ping-graalee:8080
  depends_on:
    - "ping-graalee"
stress-native-ee:
  image: ricoli/hey
  command: -n 10000000 http://ping-native-ee:8080
  depends_on:
    - "ping-native-ee"
```