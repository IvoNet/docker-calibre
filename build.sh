#!/usr/bin/env bash
image=calibre
version=0.1

deploy="false"
#deploy="true"
versioning=false
#versioning=true

#OPTIONS="--no-cache --force-rm"
#OPTIONS="--no-cache"
#OPTIONS="--force-rm"
OPTIONS="$OPTIONS --build-arg APP=calibre --build-arg ADMIN_NAME=calibreadmin --build-arg ADMIN_PASSWORD=secret --build-arg USERNAME=ivonet --build-arg PASSWORD=secret"

docker build ${OPTIONS} -t ivonet/${image}:latest .
if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
    docker push ivonet/${image}:latest
fi

if [ "$versioning" == "true" ]; then
    docker tag ivonet/${image}:latest ivonet/${image}:${version}
    if [ "$?" -eq 0 ] && [ ${deploy} == "true" ]; then
        docker push ivonet/${image}:${version}
    fi
fi
