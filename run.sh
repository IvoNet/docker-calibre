#!/usr/bin/env bash
NAME=calibre
PORT=8080
if [ ! -z $1 ]; then
   EP="--entrypoint bash"
fi

[[ -z "$(brew ls --versions pulseaudio)" ]] && brew install pulseaudio
pulseaudio --kill 2>/dev/null
pulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon 2>/dev/null

docker run                           \
    -it                              \
    --rm                             \
    --name $NAME                     \
    -p ${PORT}:32000                 \
    $EP                              \
    ivonet/calibre

pulseaudio --kill 2>/dev/null
