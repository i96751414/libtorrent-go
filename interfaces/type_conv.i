#define %arg(A...) A

%define TYPE_INTEGRAL_CONVERSION(name, underlying_type, go_type)
%typemap(gotype) name  "go_type"
%typemap(in) name      %{    $1 = name(static_cast<underlying_type>($input));%}
%typemap(out) name     %{    $result = static_cast<underlying_type>((name) $1);%}
%enddef

%define LIBTORRENT_BITFIELD_CONVERSION(name, underlying_type, go_type)
TYPE_INTEGRAL_CONVERSION(%arg(libtorrent::flags::bitfield_flag<underlying_type, libtorrent::name ## ag>), underlying_type, go_type)
%enddef

%define TYPE_TIME_DURATION_CONVERSION(name)
%typemap(gotype) name  "time.Duration"
%typemap(imtype) name  "int64"
%typemap(in) name      %{    $1 = std::chrono::nanoseconds($input);%}
%typemap(goin) name    %{    $result = int64($input)%}
%typemap(out) name     %{    $result = std::chrono::duration_cast<std::chrono::nanoseconds>($1).count();%}
%typemap(goout) name   %{    $result = time.Duration($1)%}
%enddef

%define TYPE_DURATION_CONVERSION(name, go_type)
%typemap(gotype) name  "go_type"
%typemap(in) name      %{    $1 = name($input);%}
%typemap(out) name     %{    $result = $1.count();%}
%enddef

%define TYPE_STRING_VIEW_CONVERSION(name)
%typemap(gotype) name  "string"
%typemap(in) name                           %{    $1 = {$input.p, (name::size_type) $input.n};%}
%typemap(out) name                          %{    $result = Swig_AllocateString($1.data(), $1.length());%}
%typemap(goout,fragment="CopyString") name  %{    $result = swigCopyString($1)%}

%typemap(gotype) name::size_type  "int64"
%typemap(in) name::size_type                %{    $1 = (name::size_type) $input;%}
%typemap(out) name::size_type               %{    $result = $1;%}
%enddef

// string_view
TYPE_STRING_VIEW_CONVERSION(libtorrent::string_view)

// time
%go_import("time")
TYPE_TIME_DURATION_CONVERSION(libtorrent::time_duration)
TYPE_DURATION_CONVERSION(libtorrent::seconds, int64)
TYPE_DURATION_CONVERSION(libtorrent::milliseconds, int64)
TYPE_DURATION_CONVERSION(libtorrent::microseconds, int64)
TYPE_DURATION_CONVERSION(libtorrent::minutes, int64)
TYPE_DURATION_CONVERSION(libtorrent::hours, int64)

TYPE_DURATION_CONVERSION(libtorrent::seconds32, int)
TYPE_DURATION_CONVERSION(libtorrent::minutes32, int)

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
