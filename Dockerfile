FROM ivonet/web-gui-base:latest
LABEL maintainer="Ivo Woltring - @ivonet"

RUN apt-get update -qq -y                      \
 && apt-get install -y --no-install-recommends \
        calibre                                \
 && apt-get clean                              \
 && rm -rf /var/lib/apt/lists/*

ARG APP=calibre
ARG USERNAME=user
ARG PASSWORD=secret
ARG ADMIN_NAME=admin
ARG ADMIN_PASSWORD=admin

ENV APPNAME=$APP                               \
    GUACAMOLE_ADMIN_USERNAME=$ADMIN_NAME       \
    GUACAMOLE_ADMIN_PASSWORD=$ADMIN_PASSWORD   \
    GUACAMOLE_USER_NAME=$USERNAME              \
    GUACAMOLE_USER_PASSWORD=$PASSWORD

COPY root/ /
WORKDIR  /nobody/inbox
EXPOSE 7777
VOLUME ["/calibre-library", "/nobody/inbox"]
