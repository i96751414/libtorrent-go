#!/usr/bin/env bash

set -ex
mkdir -p /usr/local/bootstrap
if [ ! -f "golang-bootstrap.tar.gz" ]; then
  wget -q "https://dl.google.com/go/go${GOLANG_BOOTSTRAP_VERSION}.tar.gz" -O golang-bootstrap.tar.gz
fi
echo "$GOLANG_BOOTSTRAP_SHA256  golang-bootstrap.tar.gz" | sha256sum -c -
tar -C /usr/local/bootstrap -xzf golang-bootstrap.tar.gz
rm golang-bootstrap.tar.gz
cd /usr/local/bootstrap/go/src
./make.bash 1>/dev/null 2>/dev/null
export GOROOT_BOOTSTRAP=/usr/local/bootstrap/go

cd /build
if [ ! -f "golang.tar.gz" ]; then
  wget -q "https://golang.org/dl/go${GOLANG_VERSION}.src.tar.gz" -O golang.tar.gz
fi
echo "$GOLANG_SRC_SHA256  golang.tar.gz" | sha256sum -c -
tar -C /usr/local -xzf golang.tar.gz
rm golang.tar.gz
cd /usr/local/go/src
./make.bash 1>/dev/null 2>/dev/null

CC_FOR_TARGET=${GOLANG_CC} \
  CXX_FOR_TARGET=${GOLANG_CXX} \
  GOOS=${GOLANG_OS} \
  GOARCH=${GOLANG_ARCH} \
  GOARM=${GOLANG_ARM} \
  CGO_ENABLED=1 \
  ./make.bash --no-clean
rm -rf /usr/local/bootstrap /usr/local/go/pkg/bootstrap
