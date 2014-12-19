#!/bin/sh

if [ ! -f /root/.tahoe/tahoe.cfg ]; then
  echo "No tahoe.cfg. Building it."
  cd /root/.tahoe
  wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe1
  wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe2
  cat ./tahoe1 >> tahoe.cfg
  echo "nickname = "$(echo "tub.location = "$(curl -s icanhazip.com)":39499,127.0.0.1:39499" | base64 | head -c${1:-32};echo;) >> tahoe.cfg
  echo "tub.location = "$(curl -s icanhazip.com)":39499,127.0.0.1:39499" >> tahoe.cfg
  cat ./tahoe2 >> tahoe.cfg
  rm tahoe1
  rm tahoe2
fi

python /allmydata-tahoe-1.10.0/bin/tahoe restart

while [ true ]
do
  sleep 600
done
