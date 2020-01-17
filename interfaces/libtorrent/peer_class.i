%{
#include "libtorrent/peer_class.hpp"
%}

namespace libtorrent {
    struct peer_class_tag;
    // %template(peer_class_t) aux::strong_typedef<std::uint32_t, struct peer_class_tag>;
}

%include "libtorrent/peer_class.hpp"

// Swig seems not to be handling 'using' keyword in some cases
%{
using libtorrent::peer_class_t;
%}
