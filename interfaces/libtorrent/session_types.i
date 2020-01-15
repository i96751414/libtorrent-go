%{
#include "libtorrent/session_types.hpp"
%}

namespace libtorrent {
    struct save_state_flags_tag;
    struct session_flags_tag;
    struct remove_flags_tag;
    struct reopen_network_flags_tag;
}

%include "libtorrent/session_types.hpp"
