FROM resin/armv7hf-debian


MAINTAINER Jere Virta / Tahto Group oy

RUN apt-get update 
     && apt-get install -yq --no-install-recommends \
	curl
	debian-keyring

COPY content/ /

RUN chmod +x /opt/start.sh

ENV INITSYSTEM on

CMD /opt/start.sh	
