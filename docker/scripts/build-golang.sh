#!/bin/bash
set -ex

scripts_path=$(dirname "$(readlink -f "$0")")
source "${scripts_path}/common.sh"

local_path="/usr/local"
bootstrap_path="${local_path}/bootstrap"

mkdir -p "${bootstrap_path}"
if [ ! -f "golang-bootstrap.tar.gz" ]; then
  wget --no-check-certificate -q "https://dl.google.com/go/go${GOLANG_BOOTSTRAP_VERSION}.tar.gz" -O golang-bootstrap.tar.gz
fi
echo "${GOLANG_BOOTSTRAP_SHA256}  golang-bootstrap.tar.gz" | sha256sum -c -
tar -C "${bootstrap_path}" -xzf golang-bootstrap.tar.gz
rm golang-bootstrap.tar.gz
cd "${bootstrap_path}/go/src"
run ./make.bash
export GOROOT_BOOTSTRAP="${bootstrap_path}/go"

cd -
if [ ! -f "golang.tar.gz" ]; then
  wget -q "https://golang.org/dl/go${GOLANG_VERSION}.src.tar.gz" -O golang.tar.gz
fi
echo "${GOLANG_SRC_SHA256}  golang.tar.gz" | sha256sum -c -
tar -C "${local_path}" -xzf golang.tar.gz
rm golang.tar.gz
cd "${local_path}/go/src"
run ./make.bash

CC_FOR_TARGET=${GOLANG_CC} \
  CXX_FOR_TARGET=${GOLANG_CXX} \
  GOOS=${GOLANG_OS} \
  GOARCH=${GOLANG_ARCH} \
  GOARM=${GOLANG_ARM} \
  CGO_ENABLED=1 \
  ./make.bash --no-clean
rm -rf "${bootstrap_path}" "${local_path}/go/pkg/bootstrap"
