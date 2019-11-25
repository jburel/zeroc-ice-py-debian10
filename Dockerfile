FROM debian:buster

MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get update && \
    apt-get install -y -q\
        build-essential \
        python3-dev \
        libssl-dev \
        libbz2-dev \
        libmcpp-dev \
        libdb++-dev \
        libdb-dev \
        libdb-java \
        python3-pip \
        python3-wheel

RUN apt-get update && \
    apt-get install -y -q \
    zeroc-ice-all-runtime \
    zeroc-ice-all-dev

RUN mkdir /dist
ADD build.sh /
CMD ["/build.sh"]
