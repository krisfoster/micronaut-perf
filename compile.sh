#!/usr/bin/env bash

ARTIFACT=petclinic-jpa
MAINCLASS=org.springframework.samples.petclinic.PetClinicApplication
VERSION=0.0.1-SNAPSHOT

JAR_FILE=${ARTIFACT}-${VERSION}.jar

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Other parmas we may need
#    -H:+StaticExecutableWithDynamicLibC \
native-image \
    --verbose \
    --allow-incomplete-classpath \
    --no-fallback \
    --no-server \
    --enable-all-security-services \
    --gc=G1 \
    -H:Name=${ARTIFACT} \
    -H:TraceClassInitialization=true \
    -H:+ReportExceptionStackTraces \
    -cp ${CP} \
    ${MAINCLASS}


