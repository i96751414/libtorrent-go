%{
#include <libtorrent/torrent_info.hpp>
#include <libtorrent/announce_entry.hpp>
#include <boost/shared_ptr.hpp>
%}

%ignore libtorrent::sha1_hash::begin;
%ignore libtorrent::sha1_hash::end;
%ignore libtorrent::sanitize_append_path_element;
%ignore libtorrent::verify_encoding;

%include <libtorrent/sha1_hash.hpp>
%include "entry.i"
%include <libtorrent/peer_id.hpp>
%include "file_storage.i"
%include <libtorrent/torrent_info.hpp>
