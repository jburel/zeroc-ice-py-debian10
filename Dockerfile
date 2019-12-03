FROM debian:buster

MAINTAINER ome-devel@lists.openmicroscopy.org.uk

RUN apt-get update && \
    apt-get install -y -q\
        wget \
        build-essential \
        db5.3-util \
        libbz2-dev \
        libdb++-dev \
        libdb-dev \
        libdb-java \
        libexpat-dev \
        libmcpp-dev \
        libssl-dev \
        python3-dev \
        python3-pip \
        python3-wheel

RUN mkdir /dist
ADD build.sh /
CMD ["/build.sh"]
