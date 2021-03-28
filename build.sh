#!/bin/bash


cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
set -e -x -u

cd HOME="$(pwd)"

export JAVA_HOME=/Users/jonnyzzz/Library/Java/JavaVirtualMachines/corretto-11.0.10/Contents/Home


cd ../jonnyzzz-logo && ./gradlew clean :logo-web:build

rsync -ai ../jonnyzzz-logo/logo-web/build/distributions/** .
git add -A .


