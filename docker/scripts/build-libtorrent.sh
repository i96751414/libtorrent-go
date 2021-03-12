#!/bin/bash
set -ex

scripts_path=$(dirname "$(readlink -f "$0")")

if [ -v LT_PTHREADS ]; then
  echo "#define BOOST_SP_USE_PTHREADS" >>"${CROSS_ROOT}/include/boost/config/user.hpp"
fi
if [ ! -f "${LIBTORRENT_VERSION}.tar.gz" ]; then
  wget -q "https://github.com/arvidn/libtorrent/archive/${LIBTORRENT_VERSION//./_}.tar.gz"
fi
tar -xzf "${LIBTORRENT_VERSION}.tar.gz"
rm "${LIBTORRENT_VERSION}.tar.gz"
cd "libtorrent-${LIBTORRENT_VERSION//./_}"

if [ -v LT_OSXCROSS ]; then
  export OSXCROSS_PKG_CONFIG_PATH=${CROSS_ROOT}/lib/pkgconfig/
fi

# shellcheck disable=SC2086
b2 --with-date_time --with-system --with-chrono --with-random --prefix="${CROSS_ROOT}" \
  toolset="${BOOST_CC}-${BOOST_OS}" target-os="${BOOST_TARGET_OS}" link=static runtime-link=static boost-link=static \
  variant=release threading=multi deprecated-functions=off ${BOOST_OPTS} \
  crypto=openssl openssl-lib="${CROSS_ROOT}/lib" openssl-include="${CROSS_ROOT}/include/openssl" \
  cflags="${LT_CFLAGS}" cxxflags="${LT_CXXFLAGS}" -j"$(nproc)" install
rm -rf "$(pwd)"
# Update includes so swig does not fail
LIBTORRENT_INCLUDE="${CROSS_ROOT}/include/libtorrent" "${scripts_path}/update-includes.sh"
# Fix .pc file
sed -i -E 's/-llib([^ .]+)(\.(a|so|dll)[.0-9]*)?/-l\1/g' "${CROSS_ROOT}/share/pkgconfig/libtorrent-rasterbar.pc"
