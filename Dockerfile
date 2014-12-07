FROM ubuntu:14.04
MAINTAINER "Matt Koski" <maccam912@gmail.com>

RUN apt-get update
RUN apt-get install wget python unzip build-essential -y
RUN wget https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.10.0.zip
RUN unzip allmydata-tahoe-1.10.0.zip
RUN rm *.zip
RUN cd allmydata* && python setup.py build
