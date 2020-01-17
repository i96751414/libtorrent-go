%{
#include "libtorrent/create_torrent.hpp"
%}

namespace libtorrent {
    struct create_flags_tag;
    // %template(create_flags_t) flags::bitfield_flag<std::uint32_t, create_flags_tag>;
}

%include "libtorrent/create_torrent.hpp"
