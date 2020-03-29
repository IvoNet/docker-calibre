FROM ivonet/x11webui:1.1
LABEL maintainer="Ivo Woltring - @ivonet"

RUN apt-get update -qq -y                      \
 && apt-get install -y --no-install-recommends \
        calibre                                \
 && apt-get clean                              \
 && rm -rf /var/lib/apt/lists/*

ARG APP=Calibre
ARG USR=user
ARG PWD=secret

ENV APPNAME=$APP                               \
    USERNAME=$USR

COPY root/ /
WORKDIR  /nobody/inbox
EXPOSE 7777
VOLUME ["/calibre-library", \
        "/nobody/inbox",    \
        "/calibre-autoscan"]
