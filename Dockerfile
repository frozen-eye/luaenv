FROM ubuntu:20.04

LABEL VERSION="1.0"
LABEL AUTHOR "Frozen Eye <frozen.eye.min@gmail.com>"
LABEL MAINTAINER "Frozen Eye <frozen.eye.min@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm-color

# remove cache and update api lists
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
  && apt-get install -y -qq lua5.3 \
  lua-sql-sqlite3 lua-redis lua-luv lua-socket

# remove cache and update api lists
RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# set ENV
ENV LUA_PATH="./?.lua;./?/init.lua;/usr/share/lua/5.3/?.lua;/usr/share/lua/5.3/?/init.lua;/usr/share/lua/common/?.lua;/usr/share/lua/common/?/init.lua;./deps/?.lua;./deps/?/init.lua;"
ENV LUA_CPATH="./bin/?.so;./bin/?/init.so;/usr/lib/lua/5.3/?.so;/usr/lib/lua/5.3/?/init.so;/usr/lib/x86_64-linux-gnu/lua/5.3/?.so;/usr/lib/x86_64-linux-gnu/lua/5.3/?/init.so;"

# set entrypoint
ENTRYPOINT ["/bin/bash"]
