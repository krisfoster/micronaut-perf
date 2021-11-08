## Micronaut 3.1.1 Documentation

- [User Guide](https://docs.micronaut.io/3.1.1/guide/index.html)
- [API Reference](https://docs.micronaut.io/3.1.1/api/index.html)
- [Configuration Reference](https://docs.micronaut.io/3.1.1/guide/configurationreference.html)
- [Micronaut Guides](https://guides.micronaut.io/index.html)
---

## Feature management documentation

- [Micronaut Management documentation](https://docs.micronaut.io/latest/guide/index.html#management)

## Feature http-client documentation

- [Micronaut HTTP Client documentation](https://docs.micronaut.io/latest/guide/index.html#httpClient)

              <arguments>
                <argument>build</argument>
                <!-- Specify a dockerfile to use - we use profiles to switch between dockerfiles -->
                <argument>-f</argument>
                <argument>${docker.file}</argument>
                <!-- Tag the image. Note we append the name of the dockerfile in order to switch between images
                 in different kinds of containers -->
                <argument>-t</argument>
                <argument>${project.groupId}/${project.artifactId}:${project.version}</argument>
                <argument>.</argument>
              </arguments>

<commandlineArgs>build -f ${docker.file} -t ${project.groupId}/${project.artifactId}:${project.version} .</commandlineArgs>


container-registry.oracle.com/graalvm/native-image-ee:ol7-java11-21.3.0

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


