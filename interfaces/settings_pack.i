%{
#include <libtorrent/settings_pack.hpp>
%}

%ignore libtorrent::settings_pack::settings_pack(settings_pack&&);

%include <libtorrent/settings_pack.hpp>
