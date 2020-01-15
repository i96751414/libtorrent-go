%{
#include <libtorrent/torrent_status.hpp>
#include <libtorrent/pex_flags.hpp>
#include <libtorrent/torrent_handle.hpp>
#include <libtorrent/torrent.hpp>
#include <libtorrent/storage_defs.hpp>
%}

%template(stdVectorPartialPieceInfo) std::vector<libtorrent::partial_piece_info>;
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

%ignore libtorrent::v1_2::torrent_status::torrent_status(torrent_status&&);
//%ignore libtorrent::torrent_status::torrent_status(torrent_status&&);
%ignore libtorrent::torrent_handle::torrent_handle(torrent_handle&&);

namespace libtorrent {
    struct torrent_flags_t;

    struct pex_flags_tag;

    struct status_flags_tag;
    struct add_piece_flags_tag;
    struct pause_flags_tag;
	struct deadline_flags_tag;
	struct resume_data_flags_tag;
	struct reannounce_flags_tag;
	struct queue_position_tag;
}

%include <libtorrent/storage_defs.hpp>
%include <libtorrent/torrent_status.hpp>
%include <libtorrent/pex_flags.hpp>
%include <libtorrent/torrent_handle.hpp>
//%include <libtorrent/torrent.hpp>

%{
using libtorrent::torrent_status;
using libtorrent::queue_position_t;
%}
