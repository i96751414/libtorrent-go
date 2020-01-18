%{
#include "libtorrent/session_handle.hpp"
%}

%feature("director") session_handle;

// These are problematic, so we ignore them.
%ignore libtorrent::session_handle::add_extension;
%ignore libtorrent::session_handle::dht_put_item;

%ignore libtorrent::session_handle::session_handle(session_handle&&);
%ignore libtorrent::session_handle::add_torrent(add_torrent_params&&);
%ignore libtorrent::session_handle::add_torrent(add_torrent_params&&, error_code&);
%ignore libtorrent::session_handle::async_add_torrent(add_torrent_params&&);
%ignore libtorrent::session_handle::apply_settings(settings_pack&&);

%include "libtorrent/session_handle.hpp"