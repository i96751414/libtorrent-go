#define %arg(A...) A

%define TYPE_INTEGRAL_CONVERSION(name, underlying_type, go_type)
%typemap(gotype) name, const name& "go_type"

%typemap(in) name {
    $1 = name(static_cast<underlying_type>($input));
}
%typemap(out) name {
    $result = static_cast<underlying_type>((name) $1);
}
%typemap(goin) name, const name& ""
%typemap(goout) name, const name& ""
%enddef

%define LIBTORRENT_BITFIELD_CONVERSION(name, underlying_type, go_type)
TYPE_INTEGRAL_CONVERSION(%arg(libtorrent::flags::bitfield_flag<underlying_type, libtorrent::name ## ag>), underlying_type, go_type)
%enddef

// units
TYPE_INTEGRAL_CONVERSION(piece_index_t, std::int32_t, int)
TYPE_INTEGRAL_CONVERSION(file_index_t, std::int32_t, int)

// torrent_handle
LIBTORRENT_BITFIELD_CONVERSION(status_flags_t, std::uint32_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(add_piece_flags_t, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(pause_flags_t, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(deadline_flags_t, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(resume_data_flags_t, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(reannounce_flags_t, std::uint8_t, uint)
TYPE_INTEGRAL_CONVERSION(queue_position_t, int, int)

// peer_class
TYPE_INTEGRAL_CONVERSION(peer_class_t, std::uint32_t, uint)

// portmap
TYPE_INTEGRAL_CONVERSION(port_mapping_t, int, int)

// peer_info
LIBTORRENT_BITFIELD_CONVERSION(peer_flags_t, std::uint32_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(peer_source_flags_t, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(bandwidth_state_flags_t, std::uint8_t, uint)

// download_priority
TYPE_INTEGRAL_CONVERSION(download_priority_t, std::uint8_t, uint)

// alert
LIBTORRENT_BITFIELD_CONVERSION(alert_category_t, std::uint32_t, uint)

// torrent_flags
LIBTORRENT_BITFIELD_CONVERSION(torrent_flags_t, std::uint64_t, uint64)

// session_types
LIBTORRENT_BITFIELD_CONVERSION(save_state_flags_t, std::uint32_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(session_flags_t, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(remove_flags_t, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(reopen_network_flags_t, std::uint8_t, uint)

// alert_types
LIBTORRENT_BITFIELD_CONVERSION(picker_flags_t, std::uint32_t, uint)

// create_torrent
LIBTORRENT_BITFIELD_CONVERSION(create_flags_t, std::uint32_t, uint)

// file_storage
LIBTORRENT_BITFIELD_CONVERSION(file_flags_t, std::uint8_t, uint)

// pex_flags
LIBTORRENT_BITFIELD_CONVERSION(pex_flags_t, std::uint8_t, uint)
