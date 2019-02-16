#!/usr/bin/env bash

set -ex
if [ ! -f "rel-${SWIG_VERSION}.tar.gz" ]; then
  wget -q https://github.com/swig/swig/archive/rel-${SWIG_VERSION}.tar.gz
fi
echo "$SWIG_SHA256  rel-${SWIG_VERSION}.tar.gz" | sha256sum -c -
tar -xzf rel-${SWIG_VERSION}.tar.gz
rm rel-${SWIG_VERSION}.tar.gz
cd swig-rel-${SWIG_VERSION}/
./autogen.sh 1>log 2>err
./configure 1>log 2>err
make -j $(cat /proc/cpuinfo | grep processor | wc -l) 1>log 2>err
make install 1>log 2>err
rm -rf `pwd`
