FROM debian:wheezy
MAINTAINER "Matt Koski" <maccam912@gmail.com>

RUN apt-get update
RUN apt-get install wget python2.7 unzip build-essential python-dev python-setuptools -y
RUN wget --no-check-certificate https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.10.0.zip
RUN unzip allmydata-tahoe-1.10.0.zip
RUN rm *.zip
RUN cd allmydata-tahoe-1.10.0 && python setup.py build
