# libtorrent-go

[![Build Status](https://github.com/i96751414/libtorrent-go/workflows/build/badge.svg)](https://github.com/i96751414/libtorrent-go/actions?query=workflow%3Abuild)
[![Codacy Badge](https://app.codacy.com/project/badge/Grade/72b98f810dc940269ca765d4b709f7ee)](https://www.codacy.com/gh/i96751414/libtorrent-go/dashboard?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=i96751414/libtorrent-go&amp;utm_campaign=Badge_Grade)

SWIG Go bindings for [libtorrent-rasterbar](https://github.com/arvidn/libtorrent).

## Requirements

-   [Docker](https://docs.docker.com/engine/installation/)
-   [golang](https://golang.org/doc/install)

## Download and Build

-   Download libtorrent-go:

        go get github.com/i96751414/libtorrent-go
        cd $GOPATH/src/github.com/i96751414/libtorrent-go

-   Pull the cross-compiler image for your platform:

        make pull PLATFORM=linux-x64

-   Next, you need to prepare Docker environments. There are two ways to do it:

    - Download and build all needed development packages:

            make envs

        This might take hours, however it can be necessary if you want to make your own customizations.

    - Prepare a specific environment:

            make env PLATFORM=linux-x64

- Build libtorrent-go:

        make [ android-arm | android-arm64 | android-x86 | android-x64 |
               linux-x86   | linux-x64   | linux-arm   | linux-armv7 | linux-arm64 |
               windows-x86 | windows-x64 | darwin-x64  ]

    To build libtorrent bindings for all platforms use `make` or specify needed platform, e.g. `make linux-x64`.
    Built packages will be placed under `$GOPATH/pkg/<platform>`
