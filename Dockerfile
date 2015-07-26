FROM ubuntu:14.04.1
MAINTAINER "Matt Koski" <maccam912@gmail.com>

RUN apt-get update
RUN apt-get install tahoe-lafs

RUN adduser tahoe_user

USER tahoe_user

RUN tahoe create-node

RUN rm /root/.tahoe/tahoe.cfg

RUN wget --no-check-certificate https://raw.githubusercontent.com/maccam912/docker-tahoe/master/tahoe-run.sh

RUN chmod 755 tahoe-run.sh
CMD ["python","tahoe-run.sh"]

EXPOSE 3456:3456

EXPOSE 37748:37748
