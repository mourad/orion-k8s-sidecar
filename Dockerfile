FROM debian:jessie
MAINTAINER Danilo Moura <danilo.moura@spirent.com>

# Inform apt-get that it'll get no such satisfaction from us
ENV DEBIAN_FRONTEND noninteractive

# Install
ADD ./orion-cli.tgz /opt

COPY podlet.sh /opt/

ENTRYPOINT ["/opt/podlet.sh"]
