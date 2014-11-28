#!/bin/bash

if [ $# -ne 2 ]; then
  echo Usage: puppetmaster MANIFEST_PATH MODULES_PATH
  exit 1
fi

MANIFEST_PATH=`realpath $1`
MODULES_PATH=`realpath $2`

docker run -d --name puppet --hostname puppet \
  -e SSH_KEYS="$(cat ~/.ssh/id_rsa.pub)" \
  -v $MANIFEST_PATH:/etc/puppet/manifests \
  -v $MODULES_PATH:/etc/puppet/modules \
  guimaluf/puppetmasterdb

sleep 7
ssh root@`docker inspect -f "{{.NetworkSettings.IPAddress}}" puppet`
