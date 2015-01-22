libtorrent-go
=============

SWIG Go bindings for libtorrent-rasterbar

Forked from <https://github.com/steeve/libtorrent-go>

I use it in my [torrent2http](https://github.com/anteo/torrent2http) fork.


Changes
-------

+ CamelCased identifier names 
+ peer_info support
+ save and load resume_data support
+ crashes on Android ARM fixed
 

Download and Build
------------------

I assume you will use Debian Wheezy system for building libtorrent-go. The process will change a bit on another system.

+ First, you need Docker and Go:

        sudo apt-get install lxc-docker golang
        
+ Create Go home folder and set $GOPATH environment variable:

        mkdir /home/user/go
        export GOPATH=/home/user/go
        
+ Download libtorrent-go:

        go get github.com/anteo/libtorrent-go
        
+ Next, you need to prepare Docker environments. You can do it with two ways:
 
        cd /home/user/go/src/github.com/anteo/libtorrent-go
        make env
        
    This will download and build all needed development packages and will take hours. But it can be necessary if you want to make your own customizations.  
    Or... pull prepared Docker images from Docker Hub: 
    
        docker pull anteo/libtorrent-go
        
+ Build libtorrent-go:

        cd /home/user/go/src/github.com/anteo/libtorrent-go
        make [android-arm|darwin-x64|linux-x86|linux-x64|linux-arm|windows-x86|windows-x64]
         
    To build libtorrent bindings for all platforms use `make` or specify needed platform, e.g. `make android-arm`.
    Built packages will be placed under `/home/user/go/pkg/<platform>`
  
Thanks
------

To Steeve Morin <https://github.com/steeve> for his work.

