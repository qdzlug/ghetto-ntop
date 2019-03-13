FROM ubuntu:latest
MAINTAINER Javier Junquera <javier.junquera.sanchez@gmail.com>

ENV WORKDIR /ntop

WORKDIR ${WORKDIR}

RUN apt-get update && \
  apt-get install -y \
  libxml2-dev \
  libpcap-dev \
  libtool \
  libtool-bin \
  rrdtool \
  librrd-dev \
  autoconf \
  automake \
  autogen \
  redis-server \
  wget \
  libsqlite3-dev \
  libhiredis-dev \
  libgeoip-dev \
  libcurl4-openssl-dev \
  libpango1.0-dev \
  libcairo2-dev \
  libnetfilter-queue-dev \
  zlib1g-dev \
  libssl-dev \
  libcap-dev \
  libnetfilter-conntrack-dev \
  libtool-bin \
  libmysqlclient-dev \
  lsb-core \
  && rm -rf /var/lib/apt/lists/*

##RUN git clone https://github.com/ntop/nDPI.git nDPI && cd nDPI && git reset --hard d6176ff668504365674f8df04a36a2f35df2074b

##RUN git clone https://github.com/ntop/ntopng.git ntopng && cd ntopng && git reset --hard a974988973c1ff4a999bbf583310e40c46d86e2a

##COPY Makefile .

##RUN make

##RUN ["chmod", "+x", "ntopng/ntopng"]


RUN wget http://apt-stable.ntop.org/18.04/all/apt-ntop-stable.deb

RUN dpkg -i apt-ntop-stable.deb

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y  pfring nprobe ntopng ntopng-data n2disk cento 

COPY start.sh .

RUN ["chmod", "+x", "start.sh"]

# Put the config in for redis...

COPY redis.conf /etc/redis/redis.conf

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000
EXPOSE 2055/udp
EXPOSE 5556

COPY conf.tar.gz  /var/lib/ntopng

ENTRYPOINT ./start.sh
