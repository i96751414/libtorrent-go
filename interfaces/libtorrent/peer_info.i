%{
#include "libtorrent/peer_info.hpp"
%}

namespace libtorrent {
    struct peer_flags_tag;
    struct peer_source_flags_tag;
    struct bandwidth_state_flags_tag;
}

%include "libtorrent/peer_info.hpp"
