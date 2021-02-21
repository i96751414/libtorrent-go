#!/bin/bash
set -ex

package_name="boost_${BOOST_VERSION//./_}.tar.bz2"
if [ ! -f "${package_name}" ]; then
  wget -q "https://dl.bintray.com/boostorg/release/${BOOST_VERSION}/source/${package_name}"
fi
echo "${BOOST_SHA256}  ${package_name}" | sha256sum -c -
mkdir -p "${BOOST_ROOT}"
tar -xjf "${package_name}" --strip-components=1 -C "${BOOST_ROOT}"
rm "${package_name}"
cd "${BOOST_ROOT}"

# shellcheck disable=SC2086
./bootstrap.sh --prefix="${CROSS_ROOT}" ${BOOST_BOOTSTRAP_OPTS}
ln -s "$(pwd)/b2" /usr/bin/b2
# Headers hack
mkdir -p "${CROSS_ROOT}/include"
ln -s "$(pwd)/boost" "${CROSS_ROOT}/include/boost"

echo "using ${BOOST_CC} : ${BOOST_OS} : ${CROSS_TRIPLE}-${BOOST_CXX} ${BOOST_FLAGS} ;" >"${HOME}/user-config.jam"
