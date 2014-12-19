FROM ubuntu:14.04.1
MAINTAINER "Matt Koski" <maccam912@gmail.com>

RUN apt-get update
RUN apt-get install curl wget vim pypy unzip build-essential python-dev python-openssl python-setuptools -y
RUN wget --no-check-certificate https://tahoe-lafs.org/source/tahoe-lafs/releases/allmydata-tahoe-1.10.0.zip
RUN unzip allmydata-tahoe-1.10.0.zip
RUN rm *.zip

RUN wget http://nuitka.net/deb/stable/trusty/pool/main/n/nuitka/nuitka_0.5.5.3+ds-1_all.deb
RUN dpkg -i nuitka*
RUN rm *.deb

RUN cd allmydata-tahoe-1.10.0 && nuitka setup.py build

RUN cd allmydata-tahoe-1.10.0/bin && ./tahoe create-node

RUN rm /root/.tahoe/tahoe.cfg

RUN wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe-run.sh

RUN chmod 755 tahoe-run.sh

EXPOSE 3456:3456

EXPOSE 39499:39499
