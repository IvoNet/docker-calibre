#!/usr/bin/with-contenv bash
set -x
if [ ! -f /calibre-library/metadata.db ]; then
   echo "Initializing calibre-library..."
   cp -r /opt/calibre-library/* /calibre-library
   chown -R nobody:users /calibre-library
fi
[[ ! -d /calibre-autoscan ]] && mkdir /calibre-autoscan && chown nobody:users /calibre-autoscan
[[ ! -d /nobody/inbox ]] && mkdir /nobody-inbox && chown nobody:users /calibre-autoscan
