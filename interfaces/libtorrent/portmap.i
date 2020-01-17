%{
#include "libtorrent/portmap.hpp"
%}

namespace libtorrent {
    struct port_mapping_tag;
    // %template(port_mapping_t) aux::strong_typedef<int, struct port_mapping_tag>;
}

%include "libtorrent/portmap.hpp"

// Swig seems not to be handling 'using' keyword in some cases
%{
using libtorrent::port_mapping_t;
%}
