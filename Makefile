PROJECT = i96751414
NAME = libtorrent-go
GO_PACKAGE = github.com/i96751414/$(NAME)
CC = cc
CXX = c++
PKG_CONFIG = pkg-config
DOCKER = docker
CROSS_COMPILER_TAG = latest
TAG = $(shell git describe --tags | cut -c2-)
ifeq ($(TAG),)
	TAG := dev
endif

PLATFORMS = \
	android-arm \
	android-arm64 \
	android-x64 \
	android-x86 \
	darwin-x64 \
	linux-arm \
	linux-armv7 \
	linux-arm64 \
	linux-x64 \
	linux-x86 \
	windows-x64 \
	windows-x86

BOOST_VERSION = 1.74.0
BOOST_VERSION_FILE = $(shell echo $(BOOST_VERSION) | sed s/\\./_/g)
BOOST_SHA256 = 83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1

OPENSSL_VERSION = 1.1.1h
OPENSSL_SHA256 = 5c9ca8774bd7b03e5784f26ae9e9e6d749c9da2438545077e6b3d755a06595d9

SWIG_VERSION = 61ea3c05decb295e072ec4d42ec34a512b0000f9  # master on 2020/09/28 (4.0.2+)
SWIG_SHA256 = 2355ba947dce5b9379a3f366252f66d07cbadab0b143ecf78f4a6b1867fce424

GOLANG_VERSION = 1.15.5
GOLANG_SRC_SHA256 = c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1

GOLANG_BOOTSTRAP_VERSION = 1.4-bootstrap-20170531
GOLANG_BOOTSTRAP_SHA256 = 49f806f66762077861b7de7081f586995940772d29d4c45068c134441a743fa2

LIBTORRENT_VERSION = 471e772cb7038f1bf5f44c32a09eb42fbb80ee99 # RC_1_2 (1.2.11)

ifeq ($(GOPATH),)
	GOPATH = $(shell go env GOPATH)
endif

include platform_host.mk

ifneq ($(CROSS_TRIPLE),)
	CC := $(CROSS_TRIPLE)-$(CC)
	CXX := $(CROSS_TRIPLE)-$(CXX)
endif

include platform_target.mk

ifeq ($(TARGET_ARCH), x86)
	GOARCH = 386
else ifeq ($(TARGET_ARCH), x64)
	GOARCH = amd64
else ifeq ($(TARGET_ARCH), arm)
	GOARCH = arm
	GOARM = 6
else ifeq ($(TARGET_ARCH), armv7)
	GOARCH = arm
	GOARM = 7
	PATH_SUFFIX = v7
	PKGDIR = -pkgdir $(GOPATH)/pkg/linux_armv7
else ifeq ($(TARGET_ARCH), arm64)
	GOARCH = arm64
	GOARM =
endif

ifeq ($(TARGET_OS), windows)
	GOOS = windows
	ifeq ($(TARGET_ARCH), x64)
		CC_DEFINES = -DSWIGWORDSIZE32
	endif
else ifeq ($(TARGET_OS), darwin)
	GOOS = darwin
	CC = $(CROSS_ROOT)/bin/$(CROSS_TRIPLE)-clang
	CXX = $(CROSS_ROOT)/bin/$(CROSS_TRIPLE)-clang++
	CC_DEFINES = -DSWIGMAC
else ifeq ($(TARGET_OS), linux)
	GOOS = linux
	ifeq ($(TARGET_ARCH), arm64)
		CC_DEFINES = -DSWIGWORDSIZE64
	endif
else ifeq ($(TARGET_OS), android)
	GOOS = android
	ifeq ($(TARGET_ARCH), arm)
		GOARM = 7
	else
		GOARM =
	endif
	CC = $(CROSS_ROOT)/bin/$(CROSS_TRIPLE)-clang
	CXX = $(CROSS_ROOT)/bin/$(CROSS_TRIPLE)-clang++
	GO_LDFLAGS = -flto -extldflags=-pie
	ifeq ($(TARGET_ARCH), arm64)
		CC_DEFINES = -DSWIGWORDSIZE64
	endif
endif

ifneq ($(CROSS_ROOT),)
	CROSS_CFLAGS = -I$(CROSS_ROOT)/include -I$(CROSS_ROOT)/$(CROSS_TRIPLE)/include
	CROSS_LDFLAGS = -L$(CROSS_ROOT)/lib
	PKG_CONFIG_PATH = $(CROSS_ROOT)/lib/pkgconfig
endif

DOCKER_GOPATH = "/go"
DOCKER_WORKDIR = "$(DOCKER_GOPATH)/src/$(GO_PACKAGE)"
DOCKER_GOCACHE = "/tmp/.cache"

WORKDIR = "$(shell pwd)"
DEFINES = $(WORKDIR)/interfaces/defines.i
WORK = $(WORKDIR)/work
OUT_PATH = "$(GOPATH)/pkg/$(GOOS)_$(GOARCH)$(PATH_SUFFIX)"
OUT_LIBRARY = "$(OUT_PATH)/$(GO_PACKAGE).a"

USERGRP = "$(shell id -u):$(shell id -g)"

.PHONY: $(PLATFORMS) build

all:
	for i in $(PLATFORMS); do \
		$(MAKE) $$i; \
	done

$(PLATFORMS):
	$(DOCKER) run --rm \
	-u $(USERGRP) \
	-v "$(GOPATH)":$(DOCKER_GOPATH) \
	-v $(WORKDIR):$(DOCKER_WORKDIR) \
	-w $(DOCKER_WORKDIR) \
	-e GOCACHE=$(DOCKER_GOCACHE) \
	-e GOPATH=$(DOCKER_GOPATH) \
	$(PROJECT)/$(NAME)-$@:latest make re

debug:
ifeq ($(PLATFORM),)
	$(MAKE) debug PLATFORM=linux-x64
else
	$(DOCKER) run --rm \
	-u $(USERGRP) \
	-v "$(GOPATH)":$(DOCKER_GOPATH) \
	-v $(WORKDIR):$(DOCKER_WORKDIR) \
	-w $(DOCKER_WORKDIR) \
	-e GOCACHE=$(DOCKER_GOCACHE) \
	-e GOPATH=$(DOCKER_GOPATH) \
	$(PROJECT)/$(NAME)-$(PLATFORM):latest bash -c \
	'make re OPTS=-work; \
	cp -rf /tmp/go-build* $(DOCKER_WORKDIR)/work'
endif

defines:
	( \
	echo $(CC_DEFINES) | sed -E 's/-D([a-zA-Z0-9_()]+)=?/\n#define \1 /g' && \
	$(CC) -dM -E - </dev/null | grep -E "__WORDSIZE|__x86_64|__x86_64__" | sed -E 's/#define[[:space:]]+([a-zA-Z0-9_()]+)(.*)/#ifndef \1\n#define \1\2\n#endif/g' \
	) > $(DEFINES)

build:
	CC=$(CC) CXX=$(CXX) \
	PKG_CONFIG_PATH=$(PKG_CONFIG_PATH) \
	CGO_ENABLED=1 \
	GOOS=$(GOOS) GOARCH=$(GOARCH) GOARM=$(GOARM) \
	PATH=.:$$PATH \
	go install $(OPTS) -v -ldflags '$(GO_LDFLAGS)' -x $(PKGDIR)

clean:
	rm -rf $(OUT_LIBRARY) $(DEFINES) $(WORK)

re: clean defines build

env:
	$(DOCKER) build \
		--build-arg BOOST_VERSION=$(BOOST_VERSION) \
		--build-arg BOOST_VERSION_FILE=$(BOOST_VERSION_FILE) \
		--build-arg BOOST_SHA256=$(BOOST_SHA256) \
		--build-arg OPENSSL_VERSION=$(OPENSSL_VERSION) \
		--build-arg OPENSSL_SHA256=$(OPENSSL_SHA256) \
		--build-arg SWIG_VERSION=$(SWIG_VERSION) \
		--build-arg SWIG_SHA256=$(SWIG_SHA256) \
		--build-arg GOLANG_VERSION=$(GOLANG_VERSION) \
		--build-arg GOLANG_SRC_SHA256=$(GOLANG_SRC_SHA256) \
		--build-arg GOLANG_BOOTSTRAP_VERSION=$(GOLANG_BOOTSTRAP_VERSION) \
		--build-arg GOLANG_BOOTSTRAP_SHA256=$(GOLANG_BOOTSTRAP_SHA256) \
		--build-arg LIBTORRENT_VERSION=$(LIBTORRENT_VERSION) \
		-t $(PROJECT)/$(NAME)-$(PLATFORM):$(TAG) \
		-t $(PROJECT)/$(NAME)-$(PLATFORM):latest \
		--build-arg IMAGE_TAG=$(CROSS_COMPILER_TAG) \
		-f docker/$(PLATFORM).Dockerfile docker

envs:
	for i in $(PLATFORMS); do \
		$(MAKE) env PLATFORM=$$i; \
	done

pull-all:
	for i in $(PLATFORMS); do \
		$(MAKE) pull PLATFORM=$$i; \
	done

pull:
	docker pull $(PROJECT)/$(NAME)-$(PLATFORM):latest

push:
	docker push $(PROJECT)/$(NAME)-$(PLATFORM)
