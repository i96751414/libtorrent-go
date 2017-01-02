%{
#include <libtorrent/torrent_info.hpp>
#include <libtorrent/torrent_handle.hpp>
#include <libtorrent/torrent_status.hpp>
#include <libtorrent/torrent.hpp>
#include <libtorrent/entry.hpp>
#include <libtorrent/announce_entry.hpp>
%}

%include <std_vector.i>
%include <std_pair.i>
%include <carrays.i>

// %template(stdVectorPeerInfo) std::vector<libtorrent::peer_info>;
%template(stdVectorPartialPieceInfo) std::vector<libtorrent::partial_piece_info>;
%template(stdVectorAnnounceEntry) std::vector<libtorrent::announce_entry>;
%template(stdVectorTorrentHandle) std::vector<libtorrent::torrent_handle>;

// Equaler interface
%rename(Equal) libtorrent::torrent_handle::operator==;
%rename(NotEqual) libtorrent::torrent_handle::operator!=;
%rename(Less) libtorrent::torrent_handle::operator<;

%array_class(libtorrent::block_info, block_info_list);

%extend libtorrent::torrent_handle {
    const libtorrent::torrent_info* torrent_file() {
        return self->torrent_file().get();
    }
}
%ignore libtorrent::torrent_handle::torrent_file;
%ignore libtorrent::torrent_handle::use_interface;

%extend libtorrent::partial_piece_info {
    block_info_list* blocks() {
        return block_info_list_frompointer(self->blocks);
    }
}
%ignore libtorrent::partial_piece_info::blocks;
%ignore libtorrent::hash_value;
%ignore libtorrent::block_info::peer; // linux_arm
%ignore libtorrent::block_info::set_peer; // linux_arm

%include <libtorrent/entry.hpp>
%include <libtorrent/torrent_info.hpp>
%include <libtorrent/torrent_handle.hpp>
%include <libtorrent/torrent_status.hpp>
#include <libtorrent/torrent.hpp>
%include <libtorrent/announce_entry.hpp>
