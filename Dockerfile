FROM debian:latest
LABEL maintainer='Your Name <you@example.com>'

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        vim-tiny \
        uuid \
        uuid-dev \
        libxml2-dev \
        libncurses5-dev \
        libedit-dev \
        libssl-dev \
        libjansson-dev \
        net-tools \
        tcpdump && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV ASTERISK_VERSION=20.5.2

WORKDIR /usr/src/asterisk
RUN curl -O http://downloads.asterisk.org/pub/telephony/asterisk/releases/asterisk-${ASTERISK_VERSION}.tar.gz && \
    tar xzf asterisk-${ASTERISK_VERSION}.tar.gz --strip-components=1 && \
    ./configure && \
    make menuselect/menuselect menuselect-tree menuselect.makeopts && \
    menuselect/menuselect --disable BUILD_NATIVE menuselect.makeopts && \
    make && make install && make basic-pbx && make config

RUN mkdir -p /etc/asterisk
COPY pjsip.conf /etc/asterisk/pjsip.conf
COPY extensions.conf /etc/asterisk/extensions.conf

EXPOSE 5060/udp
EXPOSE 10000-10100/udp

CMD ["asterisk", "-f", "-vvv"]
