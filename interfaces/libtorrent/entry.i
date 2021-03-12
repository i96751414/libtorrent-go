%{
#include "libtorrent/entry.hpp"
%}

%ignore libtorrent::entry::entry(entry&&);
%ignore libtorrent::entry::entry(dictionary_type);

%include "libtorrent/entry.hpp"
