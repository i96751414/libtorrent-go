FROM dimitriss/cross-compiler:linux-arm
MAINTAINER Dimitriss

RUN mkdir -p /build
WORKDIR /build

# Install Boost.System
ENV BOOST_VERSION 1.60.0
RUN curl -L http://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_`echo ${BOOST_VERSION} | sed 's/\\./_/g'`.tar.bz2/download | tar xvj && \
    cd boost_`echo ${BOOST_VERSION} | sed 's/\\./_/g'`/ && \
    ./bootstrap.sh --prefix=${CROSS_ROOT} && \
    echo "using gcc : linux : ${CROSS_TRIPLE}-c++ ;" > ${HOME}/user-config.jam && \
    ./b2 --with-date_time --with-system --prefix=${CROSS_ROOT} toolset=gcc-linux link=static variant=release threading=multi target-os=linux install && \
    rm -rf ${HOME}/user-config.jam && \
    rm -rf `pwd`

# Install OpenSSL
ENV OPENSSL_VERSION 1.0.2e
RUN curl -L http://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz | tar xvz && \
    cd openssl-${OPENSSL_VERSION}/ && \
    CROSS_COMPILE=${CROSS_TRIPLE}- ./Configure threads no-shared linux-armv4 --prefix=${CROSS_ROOT} && \
    make && make install && \
    rm -rf `pwd`

# Install libtorrent
ENV LIBTORRENT_VERSION 1.0.7
RUN echo "#define BOOST_SP_USE_PTHREADS" >> ${CROSS_ROOT}/include/boost/config/user.hpp
RUN curl -L https://github.com/arvidn/libtorrent/releases/download/libtorrent-`echo ${LIBTORRENT_VERSION} | sed 's/\\./_/g'`/libtorrent-rasterbar-${LIBTORRENT_VERSION}.tar.gz | tar xvz && \
    cd libtorrent-rasterbar-${LIBTORRENT_VERSION}/ && \
    sed -i 's/$PKG_CONFIG openssl --libs-only-/$PKG_CONFIG openssl --static --libs-only-/' ./configure && \
    sed -i -e s/Windows.h/windows.h/ -e s/Wincrypt.h/wincrypt.h/ ./ed25519/src/seed.cpp && \
    \
    PKG_CONFIG_PATH=${CROSS_ROOT}/lib/pkgconfig/ \
    CC=${CROSS_TRIPLE}-gcc CXX=${CROSS_TRIPLE}-g++ \
    CFLAGS="${CFLAGS} -O2" \
    CXXFLAGS="${CXXFLAGS} ${CFLAGS}" \
    ./configure --enable-static --disable-shared --disable-deprecated-functions \
    --host=${CROSS_TRIPLE} --prefix=${CROSS_ROOT} \
    --with-boost=${CROSS_ROOT} --with-boost-libdir=${CROSS_ROOT}/lib && \
    \
    make && make install && \
    rm -rf `pwd`

# Install Golang
ENV GO_VERSION 1.4.3
RUN cd /usr/local && \
    curl -L http://golang.org/dl/go${GO_VERSION}.src.tar.gz | tar xvz && \
    cd /usr/local/go/src && \
    CC_FOR_TARGET=${CROSS_TRIPLE}-cc CXX_FOR_TARGET=${CROSS_TRIPLE}-c++ GOOS=linux GOARCH=arm GOARM=6 CGO_ENABLED=1 ./make.bash
ENV PATH ${PATH}:/usr/local/go/bin

# Install SWIG
ENV SWIG_VERSION 3.0.8
RUN apt-get update && apt-get install -y automake libpcre3-dev bison yodl
RUN curl -L https://github.com/swig/swig/archive/rel-${SWIG_VERSION}.tar.gz | tar xvz && \
    cd swig-rel-${SWIG_VERSION}/ && \
    ./autogen.sh && \
    ./configure && make && make install && \
    rm -rf `pwd`

WORKDIR /
RUN rm -rf /build
