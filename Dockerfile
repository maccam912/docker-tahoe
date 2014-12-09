FROM ubuntu:14.04.1
MAINTAINER "Matt Koski" <maccam912@gmail.com>

RUN apt-get update
RUN apt-get install wget vim python2.7 unzip build-essential python-dev python-openssl python-setuptools -y
RUN wget --no-check-certificate https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.10.0.zip
RUN unzip allmydata-tahoe-1.10.0.zip
RUN rm *.zip
RUN cd allmydata-tahoe-1.10.0 && python setup.py build

RUN cd allmydata-tahoe-1.10.0/bin && ./tahoe create-node

RUN cd /root/.tahoe && rm tahoe.cfg && wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe.cfg

#RUN cd allmydata-tahoe-1.10.0/bin && ./tahoe start

EXPOSE 3456:3456

EXPOSE 39499:39499
