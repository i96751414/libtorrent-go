#!/bin/bash
set -ex

scripts_path=$(dirname "$(readlink -f "$0")")
source "${scripts_path}/common.sh"

if [ ! -f "openssl-${OPENSSL_VERSION}.tar.gz" ]; then
  wget -q "https://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz"
fi
echo "${OPENSSL_SHA256}  openssl-${OPENSSL_VERSION}.tar.gz" | sha256sum -c -
tar -xzf "openssl-${OPENSSL_VERSION}.tar.gz"
rm "openssl-${OPENSSL_VERSION}.tar.gz"
cd "openssl-${OPENSSL_VERSION}"
# shellcheck disable=SC2086
CROSS_COMPILE="${CROSS_TRIPLE}-" run ./Configure threads no-shared ${OPENSSL_OPTS} --prefix="${CROSS_ROOT}"
run make -j"$(nproc)"
run make install
rm -rf "$(pwd)"
