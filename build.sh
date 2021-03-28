#!/bin/bash


cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e -x -u

HOME="$(pwd)"
ROOT="$(cd ../jonnyzzz-logo && pwd)"

export JAVA_HOME=/Users/jonnyzzz/Library/Java/JavaVirtualMachines/corretto-11.0.10/Contents/Home


cd $ROOT && ./gradlew clean :logo-web:build

rsync -ai $ROOT/logo-web/build/distributions $HOME
git add -A .


