FROM resin/rpi-raspbian:jessie


MAINTAINER Jere Virta / Tahto Group oy


RUN apt-get update \
     && apt-get install -yq --no-install-recommends \
	curl \
	debian-keyring \
	nano \
	systemd-sysv \
     && curl http://debmon.org/debmon/repo.key | apt-key add - \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

COPY content/ /

RUN apt-get update \
     && apt-get -y install --no-install-recommends \
        icinga2 \
        monitoring-plugins \
        monitoring-plugins-basic \
        monitoring-plugins-common \
        monitoring-plugins-standard \
        net-tools \
        snmp \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

RUN chmod +x /opt/start.sh

ENV INITSYSTEM on

CMD /opt/start.sh	
