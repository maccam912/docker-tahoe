FROM debian:wheezy
MAINTAINER "Matt Koski" <maccam912@gmail.com>

RUN apt-get update
RUN apt-get install wget python unzip build-essential python-setuptools -y
RUN wget https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.10.0.zip
RUN unzip allmydata-tahoe-1.10.0.zip
RUN rm *.zip
RUN cd allmydata-tahoe-1.10.0 && ls && python setup.py build
