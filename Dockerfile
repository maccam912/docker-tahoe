FROM ubuntu:14.04.1
MAINTAINER "Matt Koski" <maccam912@gmail.com>

RUN apt-get update
RUN apt-get install curl wget vim python2.7 unzip build-essential python-dev python-openssl python-setuptools -y
RUN wget --no-check-certificate https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.10.0.zip
RUN unzip allmydata-tahoe-1.10.0.zip
RUN rm *.zip
RUN cd allmydata-tahoe-1.10.0 && python setup.py build

RUN cd allmydata-tahoe-1.10.0/bin && ./tahoe create-node

RUN cd /root/.tahoe && rm tahoe.cfg && wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe1
RUN cd /root/.tahoe && wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe2

RUN cd /root/.tahoe && cat ./tahoe1 >> tahoe.cfg
RUN cd /root/.tahoe && echo "nickname = "$(< /dev/urandom tr -dc A-Za-z | head -c${1:-32};echo;) >> tahoe.cfg
RUN cd /root/.tahoe && echo "tub.location = "$(curl -s icanhazip.com) >> tahoe.cfg
RUN cd /root/.tahoe && cat ./tahoe2 >> tahoe.cfg
RUN cd /root/.tahoe && rm tahoe1 && rm tahoe2

RUN cd allmydata-tahoe-1.10.0/bin && ./tahoe start

EXPOSE 3456:3456

EXPOSE 39499:39499
