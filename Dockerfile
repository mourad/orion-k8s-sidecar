FROM debian:jessie
MAINTAINER Danilo Moura <danilo.moura@spirent.com>

# Inform apt-get that it'll get no such satisfaction from us
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list.d/stretch.list && \
    echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list.d/stretch.list && \
    echo "deb http://security.debian.org stretch/updates main" >> /etc/apt/sources.list.d/stretch.list && \
    apt-get update && \
    apt-get install -y --no-install-recommends strongswan-swanctl

# Install
ADD ./orion-cli.tgz /opt

COPY podlet.sh /opt/

ENTRYPOINT ["/opt/podlet.sh"]
