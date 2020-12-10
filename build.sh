#!/bin/sh

set -eu

ICE_VERSION=${1:-"3.6.5"}
BUILD=${BRANCH_NAME:-dev}
TARGET_NAME=ice-$ICE_VERSION-$BUILD

# Build ice cpp from source
wget -q https://github.com/zeroc-ice/ice/archive/v$ICE_VERSION.tar.gz
tar xzf v$ICE_VERSION.tar.gz
cd ice-$ICE_VERSION/cpp

make --silent prefix=/opt/$TARGET_NAME
make install --silent prefix=/opt/$TARGET_NAME

tar -zcf /dist/$TARGET_NAME-debian10-amd64.tar.gz -C /opt $TARGET_NAME


pip3 download "zeroc-ice==$ICE_VERSION"
tar -zxf "zeroc-ice-$ICE_VERSION.tar.gz"
cd "zeroc-ice-$ICE_VERSION"
python3 setup.py bdist_wheel
cp dist/* /dist/
