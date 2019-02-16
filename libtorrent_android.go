// +build android

package libtorrent

// #cgo pkg-config: --static libtorrent-rasterbar openssl
// #cgo android LDFLAGS: -lm -ldl
import "C"
