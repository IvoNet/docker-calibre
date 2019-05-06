#!/usr/bin/env bash
NAME=calibre
CONTENT_SERVER_PORT=7777
PORT=8080
if [ ! -z $1 ]; then
   EP="--entrypoint bash"
fi

killpulse() {
    pulseaudio --kill 2>/dev/null
    killall pulseaudio 2>/dev/null
    rm -rf ~/.config/pulse 2>/dev/null
    mkdir -p ~/.config/pulse 2>/dev/null
}

[[ -z "$(brew ls --versions pulseaudio)" ]] && brew install pulseaudio
killpulse
pulseaudio --load=module-native-protocol-tcp --exit-idle-time=-1 --daemon 2>/dev/null

docker run                                          \
    -it                                             \
    --rm                                            \
    --name $NAME-dev                                \
    -v "${HOME}/calibre-library:/calibre-library"   \
    -v "${HOME}/calibre-autoscan:/calibre-autoscan" \
    -v "${HOME}/calibre-inbox:/nobody/inbox"        \
    -p ${CONTENT_SERVER_PORT}:7777                  \
    -p ${PORT}:32000                                \
    $EP                                             \
    ivonet/calibre

killpulse
