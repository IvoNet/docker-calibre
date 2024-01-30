FROM ivonet/x11webui:2.0-20.04
LABEL maintainer="Ivo Woltring - @ivonet"

RUN apt-get update -qq -y                      \
 && apt-get install -y --no-install-recommends \
        wget \
        xz-utils \
        libqt5gui5 \
        libqt5x11extras5 \
        libgl1-mesa-dri \
 && apt-get clean                              \
 && rm -rf /var/lib/apt/lists/*

RUN wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin

ARG APP=Calibre
ARG USR=user
ARG PWD=secret

ENV APPNAME=$APP                               \
    USERNAME=$USR \
    LIBGL_ALWAYS_SOFTWARE=true

COPY root/ /
WORKDIR  /nobody/inbox
EXPOSE 7777
VOLUME ["/calibre-library", \
        "/nobody/inbox",    \
        "/calibre-autoscan"]
