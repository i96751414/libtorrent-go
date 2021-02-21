#!/bin/bash
set -ex

scripts_path=$(dirname "$(readlink -f "$0")")
source "${scripts_path}/common.sh"

name="boost_${BOOST_VERSION//./_}"
package_name="${name}.tar.bz2"

if [ ! -f "${package_name}" ]; then
  wget -q "https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/${package_name}"
fi
echo "${BOOST_SHA256}  ${package_name}" | sha256sum -c -
tar -xjf "${package_name}"
rm "${package_name}"
cd "${name}"
./bootstrap.sh --prefix="${CROSS_ROOT}" "${BOOST_BOOTSTRAP_OPTS}"
echo "using ${BOOST_CC} : ${BOOST_OS} : ${CROSS_TRIPLE}-${BOOST_CXX} ${BOOST_FLAGS} ;" >"${HOME}/user-config.jam"
# shellcheck disable=SC2086
run ./b2 --with-date_time --with-system --with-chrono --with-random --prefix="${CROSS_ROOT}" \
  toolset="${BOOST_CC}-${BOOST_OS}" ${BOOST_OPTS} link=static variant=release threading=multi \
  target-os="${BOOST_TARGET_OS}" install
rm -rf "${HOME}/user-config.jam" "$(pwd)"
