%{
#include "libtorrent/peer_info.hpp"
%}

%ignore libtorrent::peer_info::peer_info(peer_info &&);

namespace libtorrent {
    struct peer_flags_tag;
    // %template(peer_flags_t) flags::bitfield_flag<std::uint32_t, peer_flags_tag>;
    struct peer_source_flags_tag;
    // %template(peer_source_flags_t) flags::bitfield_flag<std::uint8_t, peer_source_flags_tag>;
    struct bandwidth_state_flags_tag;
    // %template(bandwidth_state_flags_t) flags::bitfield_flag<std::uint8_t, bandwidth_state_flags_tag>;
}

%include "libtorrent/peer_info.hpp"
