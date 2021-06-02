ARG BUILD_FROM=debian:buster-slim

FROM $BUILD_FROM

RUN apt update \
 && apt install -y wget \
 && wget https://github.com/badaix/snapcast/releases/download/v0.25.0/snapserver_0.25.0-1_amd64.deb
 
 RUN dpkg -i --force-all 'snapserver_0.25.0-1_amd64.deb'
 
 RUN apt-get -f install -y

RUN mkdir -p /root/.config/snapcast/

COPY snapserver.conf /etc/default/snapserver.conf

VOLUME ["/tmp"]

ENV TZ=America/Toronto

EXPOSE 1704 1704

EXPOSE 1705 1705

ENTRYPOINT ["snapserver"]
