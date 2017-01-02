// +build android

package libtorrent

// #cgo pkg-config: --static libtorrent-rasterbar openssl
// #cgo android LDFLAGS: -lm -lgnustl_shared -ldl
import "C"
