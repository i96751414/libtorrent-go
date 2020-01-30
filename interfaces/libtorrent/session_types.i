%{
#include "libtorrent/session_types.hpp"
%}

namespace libtorrent {
    struct save_state_flags_tag;
    // %template(save_state_flags_t) flags::bitfield_flag<std::uint32_t, save_state_flags_tag>;
    struct session_flags_tag;
    // %template(session_flags_t) flags::bitfield_flag<std::uint8_t, session_flags_tag>;
    struct remove_flags_tag;
    // %template(remove_flags_t) flags::bitfield_flag<std::uint8_t, remove_flags_tag>;
    struct reopen_network_flags_tag;
    // %template(reopen_network_flags_t) flags::bitfield_flag<std::uint8_t, reopen_network_flags_tag>;
}

%include "libtorrent/session_types.hpp"

// Swig seems not to be handling 'using' keyword in some cases
%{
using libtorrent::save_state_flags_t;
using libtorrent::session_flags_t;
using libtorrent::remove_flags_t;
using libtorrent::reopen_network_flags_t;
%}
