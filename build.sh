#!/usr/bin/env bash

set -e
set -x

docker build -f Dockerfile.build . -t slate-build
docker run -d --name slate-build-runner slate-build /bin/sh -c "while true; do sleep 1; done"
rm -rf build
docker cp slate-build-runner:/work/build .
docker stop slate-build-runner
docker rm slate-build-runner
