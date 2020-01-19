%{
#include "libtorrent/entry.hpp"
%}

%ignore libtorrent::entry::entry(entry&&);

%include "libtorrent/entry.hpp"
