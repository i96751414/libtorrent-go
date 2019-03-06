#!/usr/bin/env bash

set -ex
if [ ! -f "swig-${SWIG_VERSION}.tar.gz" ]; then
  wget -q https://github.com/swig/swig/archive/${SWIG_VERSION}.tar.gz -O swig-${SWIG_VERSION}.tar.gz
fi
echo "$SWIG_SHA256  swig-${SWIG_VERSION}.tar.gz" | sha256sum -c -
tar -xzf swig-${SWIG_VERSION}.tar.gz
rm swig-${SWIG_VERSION}.tar.gz
cd swig-${SWIG_VERSION}/
./autogen.sh 1>log 2>err
./configure 1>log 2>err
make -j $(cat /proc/cpuinfo | grep processor | wc -l) 1>log 2>err
make install 1>log 2>err
rm -rf `pwd`
