#!/usr/bin/env bash

set -ex
if [ ! -f "boost_${BOOST_VERSION_FILE}.tar.bz2" ]; then
  wget -q https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/boost_${BOOST_VERSION_FILE}.tar.bz2
fi
echo "$BOOST_SHA256  boost_${BOOST_VERSION_FILE}.tar.bz2" | sha256sum -c -
tar -xjf boost_${BOOST_VERSION_FILE}.tar.bz2
rm boost_${BOOST_VERSION_FILE}.tar.bz2
cd boost_${BOOST_VERSION_FILE}/
./bootstrap.sh --prefix=${CROSS_ROOT} ${BOOST_BOOTSTRAP_OPTS}
echo "using ${BOOST_CC} : ${BOOST_OS} : ${CROSS_TRIPLE}-${BOOST_CXX} ${BOOST_FLAGS} ;" > ${HOME}/user-config.jam
./b2 --with-date_time --with-system --with-chrono --with-random --prefix=${CROSS_ROOT} toolset=${BOOST_CC}-${BOOST_OS} ${BOOST_OPTS} link=static variant=release threading=multi target-os=${BOOST_TARGET_OS} install 1>/dev/null 2>/dev/null
rm -rf ${HOME}/user-config.jam
rm -rf `pwd`
