ARG IMAGE_TAG=latest
FROM i96751414/cross-compiler-android-arm64:${IMAGE_TAG}

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
ENV OPENSSL_OPTS linux-aarch64 -fPIC
RUN ./build-openssl.sh

# Install SWIG
COPY scripts/build-swig.sh /build/
RUN ./build-swig.sh

# Install Golang
COPY scripts/build-golang.sh /build/
ENV GOLANG_CC ${CROSS_TRIPLE}-clang
ENV GOLANG_CXX ${CROSS_TRIPLE}-clang++
ENV GOLANG_OS android
ENV GOLANG_ARCH arm64
ENV GOLANG_ARM 7
RUN ./build-golang.sh
ENV PATH ${PATH}:/usr/local/go/bin

# Install Boost.System
COPY scripts/build-boost.sh /build/
ENV BOOST_CC clang
ENV BOOST_CXX clang++
ENV BOOST_OS android
ENV BOOST_TARGET_OS linux
ENV BOOST_OPTS fpic=on
ENV BOOST_ROOT "/build/boost"
ENV BOOST_BUILD_PATH "${BOOST_ROOT}/tools/build"
RUN ./build-boost.sh

# Install libtorrent
COPY scripts/update-includes.sh /build/
COPY scripts/build-libtorrent.sh /build/
ENV LT_PTHREADS TRUE
ENV LT_CFLAGS -O2 -fPIC -fPIE
ENV LT_CXXFLAGS -Wno-macro-redefined -Wno-c++11-extensions ${LT_CFLAGS}
RUN ./build-libtorrent.sh
