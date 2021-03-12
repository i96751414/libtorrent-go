package libtorrent

// #cgo pkg-config: --static libtorrent-rasterbar openssl
// #cgo CXXFLAGS: -std=c++11
// #cgo darwin CXXFLAGS: -fvisibility=hidden -fvisibility-inlines-hidden
// #cgo darwin LDFLAGS: -lm -lstdc++ -framework CoreFoundation -framework SystemConfiguration
// #cgo !android,linux CXXFLAGS: -I/usr/include/libtorrent -Wno-deprecated-declarations
// #cgo !android,linux LDFLAGS: -lm -lstdc++ -ldl -lrt
// #cgo android LDFLAGS: -lm -lc++_shared -ldl
// #cgo windows CXXFLAGS: -DIPV6_TCLASS=39 -D_WIN32_WINNT=0x0600 -D__MINGW32__
// #cgo windows LDFLAGS: -static-libgcc -static-libstdc++ -static
import "C"
