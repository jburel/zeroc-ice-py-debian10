Ubuntu Debian 10 Zeroc Ice Python 3 Builder
===========================================

Builds Zeroc Ice wheel for Debian 10.

This can be used to create installable binary packages as an alternative to compiling from source using pip.

    docker build -t builder .
    docker run --rm -v $PWD/dist:/dist builder

To build a different version of IcePy:

    docker run --rm -v $PWD/dist:/dist builder VERSION

Packages will be copied to `$PWD/dist`.
