FROM debian:buster-slim 

RUN apt update \
 && apt install -y wget \
 && wget https://github.com/badaix/snapcast/releases/download/v0.26.0/snapclient_0.26.0-1_amd64.deb
 
 
 RUN dpkg -i --force-all 'snapserver_0.26.0-1_amd64.deb'
 
 RUN apt-get -f install -y

RUN mkdir -p /root/.config/snapcast/

COPY snapserver.conf /etc/default/snapserver.conf

VOLUME ["/tmp"]

EXPOSE 1704 1704

EXPOSE 1705 1705

EXPOSE 1780 1780

ENTRYPOINT ["snapserver"]
