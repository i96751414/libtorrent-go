libtorrent-go [![Build Status](https://travis-ci.org/scakemyer/libtorrent-go.svg?branch=master)](https://travis-ci.org/scakemyer/libtorrent-go)
=============

SWIG Go bindings for libtorrent-rasterbar

Forked from <https://github.com/steeve/libtorrent-go>


Changes
-------

+ CamelCased identifier names
+ peer_info support
+ save and load resume_data support
+ crashes on Android ARM fixed


Download and Build
------------------

+ First, you need [Docker](https://docs.docker.com/engine/installation/) and [golang](https://golang.org/doc/install)

+ Create Go home folder and set $GOPATH environment variable:

        mkdir ~/go
        export GOPATH=~/go

+ Download libtorrent-go:

        go get github.com/scakemyer/libtorrent-go
        cd ~/go/src/github.com/scakemyer/libtorrent-go

* Pull the cross-compiler image for your platform:

        make pull PLATFORM=android-arm

+ Next, you need to prepare Docker environments. You can do it with two ways:

        make envs

    This will download and build all needed development packages and could take hours. But it can be necessary if you want to make your own customizations.

    You can also prepare specific environments like so:

        make env PLATFORM=android-arm

+ Build libtorrent-go:

        make [ android-arm | android-x86 | android-x64 |
               linux-x86   | linux-x64   | linux-arm   | linux-armv7 | linux-arm64 |
               windows-x86 | windows-x64 | darwin-x64  ]

    To build libtorrent bindings for all platforms use `make` or specify needed platform, e.g. `make android-arm`.
    Built packages will be placed under `~/go/pkg/<platform>`


Thanks
------
- [steeve](https://github.com/steeve) for his awesome work.
- [dimitriss](https://github.com/dimitriss) for his great updates.
