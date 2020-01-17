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

%extend libtorrent::torrent_handle {
    const libtorrent::torrent_info* torrent_file() {
        return $self->torrent_file().get();
    }
}
%ignore libtorrent::torrent_handle::torrent_file;

%extend libtorrent::partial_piece_info {
    block_info_list* blocks() {
        return block_info_list_frompointer($self->blocks);
    }
}
%ignore libtorrent::partial_piece_info::blocks;

%ignore libtorrent::torrent_handle::use_interface;
%ignore libtorrent::hash_value;
%ignore libtorrent::block_info::peer; // linux_arm
%ignore libtorrent::block_info::set_peer; // linux_arm

%ignore libtorrent::torrent_handle::torrent_handle(torrent_handle&&);

namespace libtorrent {
    struct status_flags_tag;
    // %template(status_flags_t) flags::bitfield_flag<std::uint32_t, status_flags_tag>;
    struct add_piece_flags_tag;
    // %template(add_piece_flags_t) flags::bitfield_flag<std::uint8_t, add_piece_flags_tag>;
    struct pause_flags_tag;
    // %template(pause_flags_t) flags::bitfield_flag<std::uint8_t, pause_flags_tag>;
    struct deadline_flags_tag;
    // %template(deadline_flags_t) flags::bitfield_flag<std::uint8_t, deadline_flags_tag>;
    struct resume_data_flags_tag;
    // %template(resume_data_flags_t) flags::bitfield_flag<std::uint8_t, resume_data_flags_tag>;
    struct reannounce_flags_tag;
    // %template(reannounce_flags_t) flags::bitfield_flag<std::uint8_t, reannounce_flags_tag>;
    struct queue_position_tag;
    // %template(queue_position_t) aux::strong_typedef<int, struct queue_position_tag>;
}

%include "libtorrent/torrent_handle.hpp"

// Swig seems not to be handling 'using' keyword in some cases
%{
using libtorrent::queue_position_t;
%}
