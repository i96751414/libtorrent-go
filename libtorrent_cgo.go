// +build !android

package libtorrent

// #cgo pkg-config: --static libtorrent-rasterbar openssl
// #cgo darwin CXXFLAGS: -std=c++11 -fvisibility=hidden -fvisibility-inlines-hidden
// #cgo darwin LDFLAGS: -lm -lstdc++ -framework CoreFoundation -framework SystemConfiguration
// #cgo linux CXXFLAGS: -std=c++11 -I/usr/include/libtorrent -Wno-deprecated-declarations
// #cgo linux LDFLAGS: -lm -lstdc++ -ldl -lrt
// #cgo windows CXXFLAGS: -std=c++11 -DIPV6_TCLASS=39 -D_WIN32_WINNT=0x0600 -D__MINGW32__
// #cgo windows LDFLAGS: -static-libgcc -static-libstdc++ -static
import "C"
