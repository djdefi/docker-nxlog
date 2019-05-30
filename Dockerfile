FROM debian:stretch

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y -q wget debhelper automake \
        libapr1-dev libpcre3-dev  libssl-dev libdbi-dev libcap-dev \
        libexpat1-dev libtool libperl-dev autotools-dev xmlto dblatex && apt-get clean

WORKDIR /opt/nxlog
RUN wget -q -O - https://nxlog.co/system/files/products/files/348/nxlog-ce_2.10.2150_debian_stretch_amd64.deb 
RUN dpkg -i nxlog-ce_2.10.2150_debian_stretch_amd64.deb && apt-get purge -y -q xmlto dblatex && apt-get autoremove -y -q

ENTRYPOINT ["/usr/bin/nxlog"]
CMD ["-f"]
