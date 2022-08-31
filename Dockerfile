FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y -q \
        wget \
        libapr1 \
        libdbi1 \
        libexpat1 \
        libperl5.24 \
        libssl1.0.2 && apt-get clean

WORKDIR /opt/nxlog
RUN wget https://nxlog.co/system/files/products/files/348/nxlog-ce_3.0.2272_debian_stretch_amd64.deb 
RUN dpkg -i nxlog-ce_3.0.2272_debian_stretch_amd64.deb  && apt-get purge -y -q xmlto dblatex && apt-get autoremove -y -q

ENTRYPOINT ["/usr/bin/nxlog"]
CMD ["-f"]
