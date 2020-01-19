%{
#include "libtorrent/sha1_hash.hpp"
%}
%include "libtorrent/sha1_hash.hpp"

namespace libtorrent {
    %template(sha1_hash) digest32<160>;
}
