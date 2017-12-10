FROM resin/armv7hf-debian:stretch


MAINTAINER Jere Virta / Tahto Group oy


RUN apt-get update \
     && apt-get install -yq --no-install-recommends \
	curl \
	debian-keyring \
	nano \
     && curl http://debmon.org/debmon/repo.key | apt-key add - \
     && apt-get clean \
     && rm -rf /var/lib/apt/lists/*

COPY content/ /

RUN chmod +x /opt/start.sh

ENV INITSYSTEM on

CMD /opt/start.sh	
