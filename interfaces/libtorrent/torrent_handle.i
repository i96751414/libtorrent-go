%{
#include "libtorrent/torrent_handle.hpp"
%}

%template(stdVectorPartialPieceInfo) std::vector<libtorrent::partial_piece_info>;
%template(stdVectorTorrentHandle) std::vector<libtorrent::torrent_handle>;

// Equaler interface
%rename(Equal) libtorrent::torrent_handle::operator==;
%rename(NotEqual) libtorrent::torrent_handle::operator!=;
%rename(Less) libtorrent::torrent_handle::operator<;

%array_class(libtorrent::block_info, block_info_list);

%ignore libtorrent::torrent_handle::torrent_file;
%ignore libtorrent::torrent_handle::use_interface;

%ignore libtorrent::partial_piece_info::blocks;
%ignore libtorrent::hash_value;
%ignore libtorrent::block_info::peer; // linux_arm
%ignore libtorrent::block_info::set_peer; // linux_arm

%ignore libtorrent::torrent_handle::torrent_handle(torrent_handle&&);

namespace libtorrent {
    struct status_flags_tag;
    struct add_piece_flags_tag;
    struct pause_flags_tag;
	struct deadline_flags_tag;
	struct resume_data_flags_tag;
	struct reannounce_flags_tag;
	struct queue_position_tag;
}

%include "libtorrent/torrent_handle.hpp"

// Swig seems not to be handling 'using' keyword
%{
using libtorrent::queue_position_t;
%}

%extend libtorrent::torrent_handle {
    const libtorrent::torrent_info* torrent_file() {
        return $self->torrent_file().get();
    }
}

%extend libtorrent::partial_piece_info {
    block_info_list* blocks() {
        return block_info_list_frompointer($self->blocks);
    }
}
