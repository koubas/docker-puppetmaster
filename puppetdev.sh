#!/bin/bash

PUPPETDEV=puppetdev-${RANDOM}

docker run -d --expose 8140 --name $PUPPETDEV --hostname $PUPPETDEV \
  -e SSH_KEYS="$(cat ~/.ssh/id_rsa.pub)" \
  -e PUPPETMASTER_TCP_HOST="puppet" \
  --link puppet:puppet \
  guimaluf/puppetdev

echo ssh root@`docker inspect -f "{{.NetworkSettings.IPAddress}}" ${PUPPETDEV}`
