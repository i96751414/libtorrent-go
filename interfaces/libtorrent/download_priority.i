%{
#include "libtorrent/download_priority.hpp"
%}

namespace libtorrent {
    struct download_priority_tag;
    // %template(download_priority_t) aux::strong_typedef<std::uint8_t, struct download_priority_tag>;
}

%include "libtorrent/download_priority.hpp"

// Swig seems not to be handling 'using' keyword in some cases
%{
using libtorrent::download_priority_t;
%}
