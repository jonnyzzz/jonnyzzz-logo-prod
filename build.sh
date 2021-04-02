#!/bin/bash


cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e -x -u

JOGO_HOME="$(pwd)"
JOGO_ROOT="$(cd ../jonnyzzz-logo && pwd)"

export JAVA_HOME=/Users/jonnyzzz/Library/Java/JavaVirtualMachines/corretto-11.0.10/Contents/Home

## use Docker container to avoid breaking local development

cd $JOGO_ROOT 
rm -rf build
rm -rf jogo-web/build

./gradlew clean
./gradlew :jogo-web:build
cd $JOGO_HOME

rsync -ai $JOGO_ROOT/jogo-web/build/distributions/ $JOGO_HOME
git add -A .


