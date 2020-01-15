%{
#include "libtorrent/bdecode.hpp"
%}

%ignore libtorrent::bdecode_node::bdecode_node(bdecode_node&&);

%include "libtorrent/bdecode.hpp"
