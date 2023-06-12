#!/bin/bash

EXEC_TEST=$1
if [ "$EXEC_TEST" == "skipTests" ]; then
   echo "Fast build enabled, skipping tests,"
   EXEC_TEST="-x test"
else
   EXEC_TEST=""
fi

echo "Building base-repo"
./gradlew -Prelease clean build 
BUILD_DIR=./builds/`date +%Y-%m-%d`
mkdir $BUILD_DIR -p
cp build/libs/base-repo.jar $BUILD_DIR/episteme-repo.jar
cp builds/config $BUILD_DIR/ -R
