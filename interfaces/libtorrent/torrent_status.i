%{
#include "libtorrent/torrent_status.hpp"
%}

%ignore libtorrent::torrent_status::torrent_status(torrent_status&&);

// depends on torrent_handle
namespace libtorrent {
    struct torrent_handle;
}

%include "libtorrent/torrent_status.hpp"
