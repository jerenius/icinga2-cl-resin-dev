FROM resin/armv7hf-debian


MAINTAINER Jere Virta / Tahto Group oy


RUN apt-get update \
     && apt-get install -yq --no-install-recommends \
	curl \
	debian-keyring \
	nano \
     && curl http://debmon.org/debmon/repo.key | apt-key add -

COPY content/ /

RUN apt-get update \
     && apt-get -qqy install --no-install-recommends \
        icinga2 \
        monitoring-plugins \
        monitoring-plugins-basic \
        monitoring-plugins-common \
        monitoring-plugins-standard \
        snmp \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

RUN chmod +x /opt/start.sh

ENV INITSYSTEM on

CMD /opt/start.sh	
