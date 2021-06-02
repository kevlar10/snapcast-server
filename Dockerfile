ARG BUILD_FROM=debian:buster-slim

FROM $BUILD_FROM

RUN apt update \
 && apt install -y wget dpkg \
 && wget https://github.com/badaix/snapcast/releases/download/v0.25.0/snapserver_0.25.0-1_amd64.deb \
 
 RUN
 dpkg -i snapserver_0.25.0-1_amd64.deb
 && apt-get -f install \
 
 RUN
 rm -rf /var/lib/apt/lists/*

COPY snapserver.conf /etc/default/snapserver.conf

VOLUME ["/tmp"]

ENV TZ=America/Toronto

EXPOSE 1704 1704

EXPOSE 1705 1705

ENTRYPOINT ["snapserver -s pipe:///tmp/snapfifo?name=Music&sampleformat=44100:16:2"]
