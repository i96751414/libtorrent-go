ARG IMAGE_TAG=latest
FROM i96751414/cross-compiler-linux-x64:${IMAGE_TAG}

RUN mkdir -p /build
WORKDIR /build

ARG OPENSSL_VERSION
ARG OPENSSL_SHA256
ARG SWIG_VERSION
ARG SWIG_SHA256
ARG GOLANG_VERSION
ARG GOLANG_SRC_SHA256
ARG GOLANG_BOOTSTRAP_VERSION
ARG GOLANG_BOOTSTRAP_SHA256
ARG BOOST_VERSION
ARG BOOST_SHA256
ARG LIBTORRENT_VERSION

COPY scripts/common.sh /build/

# Install OpenSSL
COPY scripts/build-openssl.sh /build/
ENV OPENSSL_OPTS linux-x86_64
RUN ./build-openssl.sh

# Install SWIG
COPY scripts/build-swig.sh /build/
RUN ./build-swig.sh

# Install Golang
COPY scripts/build-golang.sh /build/
ENV GOLANG_CC ${CROSS_TRIPLE}-cc
ENV GOLANG_CXX ${CROSS_TRIPLE}-c++
ENV GOLANG_OS linux
ENV GOLANG_ARCH amd64
RUN ./build-golang.sh
ENV PATH ${PATH}:/usr/local/go/bin

# Install Boost.System
COPY scripts/build-boost.sh /build/
ENV BOOST_CC gcc
ENV BOOST_CXX c++
ENV BOOST_OS linux
ENV BOOST_TARGET_OS linux
RUN ./build-boost.sh

# Install libtorrent
COPY scripts/update-includes.sh /build/
COPY scripts/build-libtorrent.sh /build/
ENV LT_CFLAGS -O2
ENV LT_CXXFLAGS -std=c++11 ${LT_CFLAGS}
RUN ./build-libtorrent.sh
