%{
#include <libtorrent/announce_entry.hpp>
%}

%template(stdVectorAnnounceEntry) std::vector<libtorrent::announce_entry>;

%include <libtorrent/announce_entry.hpp>

%{
    using libtorrent::announce_entry;
%}
