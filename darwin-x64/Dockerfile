FROM anteo/cross-compiler:darwin-x64
MAINTAINER Anton Argirov "anton.argirov@gmail.com"

RUN mkdir -p /build
WORKDIR /build

# Install Boost.System
ENV BOOST_VERSION 1.58.0
RUN curl -L http://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_`echo ${BOOST_VERSION} | sed 's/\\./_/g'`.tar.bz2/download | tar xvj
RUN cd boost_`echo ${BOOST_VERSION} | sed 's/\\./_/g'`/ && \
    ./bootstrap.sh --prefix=${CROSS_ROOT} && \
    echo "using clang : darwin : ${CROSS_TRIPLE}-c++ ;" > ${HOME}/user-config.jam && \
    ./b2 --with-date_time --with-system --prefix=${CROSS_ROOT} toolset=clang-darwin link=static variant=release threading=multi target-os=darwin install && \
    ${CROSS_TRIPLE}-ranlib ${CROSS_ROOT}/lib/*.a && \
    rm -rf ${HOME}/user-config.jam && \
    rm -rf `pwd`

# Install OpenSSL
ENV OPENSSL_VERSION 1.0.2d
RUN curl -L http://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz | tar xvz && \
    cd openssl-${OPENSSL_VERSION}/ && \
    CROSS_COMPILE=${CROSS_TRIPLE}- ./Configure threads no-shared darwin64-x86_64-cc --prefix=${CROSS_ROOT} && \
    make && make install && \
    ${CROSS_TRIPLE}-ranlib ${CROSS_ROOT}/lib/*.a && \
    rm -rf `pwd`

# Install libtorrent
ENV LIBTORRENT_VERSION 1.0.5
RUN curl -L http://sourceforge.net/projects/libtorrent/files/libtorrent/libtorrent-rasterbar-${LIBTORRENT_VERSION}.tar.gz/download | tar xvz && \
    cd libtorrent-rasterbar-${LIBTORRENT_VERSION}/ && \
    sed -i 's/$PKG_CONFIG openssl --libs-only-/$PKG_CONFIG openssl --static --libs-only-/' ./configure && \
    sed -i -e s/Windows.h/windows.h/ -e s/Wincrypt.h/wincrypt.h/ ./ed25519/src/seed.cpp && \
    \
    OSXCROSS_PKG_CONFIG_PATH=${CROSS_ROOT}/lib/pkgconfig/ \
    CC=${CROSS_TRIPLE}-cc CXX=${CROSS_TRIPLE}-c++ \
    CFLAGS="${CFLAGS} -O2" \
    CXXFLAGS="${CXXFLAGS} ${CFLAGS}" \
    ./configure --enable-static --disable-shared --disable-deprecated-functions \
    --host=${CROSS_TRIPLE} --prefix=${CROSS_ROOT} \
    --with-boost=${CROSS_ROOT} --with-boost-libdir=${CROSS_ROOT}/lib && \
    \
    make && make install && \
    ${CROSS_TRIPLE}-ranlib ${CROSS_ROOT}/lib/*.a && \
    rm -rf `pwd`

# Install Golang
ENV BOOTSTRAP_GO_VERSION go1.4.2
ENV GO_VERSION 17a256bf22352c2beb9fc25ff76462fb16f3e6b2
RUN cd /usr/local && \
    curl -L https://github.com/golang/go/archive/${BOOTSTRAP_GO_VERSION}.tar.gz | tar xvz && \
    cd /usr/local/go-${BOOTSTRAP_GO_VERSION}/src && \
    CC_FOR_TARGET=${CROSS_TRIPLE}-cc CXX_FOR_TARGET=${CROSS_TRIPLE}-c++ GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 ./make.bash
RUN cd /usr/local && \
    curl -L https://github.com/golang/go/archive/${GO_VERSION}.tar.gz | tar xvz
RUN cd /usr/local/go-${GO_VERSION}/src && \
	echo go1.6beta > /usr/local/go-${GO_VERSION}/VERSION && \
    GOROOT_BOOTSTRAP=/usr/local/go-${BOOTSTRAP_GO_VERSION} CC_FOR_TARGET=${CROSS_TRIPLE}-cc CXX_FOR_TARGET=${CROSS_TRIPLE}-c++ GOOS=darwin GOARCH=amd64 CGO_ENABLED=1 ./make.bash
ENV PATH ${PATH}:/usr/local/go-${GO_VERSION}/bin

# Install SWIG
ENV SWIG_VERSION 3.0.7
RUN apt-get update && apt-get install -y automake libpcre3-dev bison yodl
RUN curl -L https://github.com/swig/swig/archive/rel-${SWIG_VERSION}.tar.gz | tar xvz && \
    cd swig-rel-${SWIG_VERSION}/ && \
    ./autogen.sh && \
    ./configure && make && make install && \
    rm -rf `pwd`

WORKDIR /
RUN rm -rf /build
