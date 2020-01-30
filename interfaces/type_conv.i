#define %arg(A...) A

%define TYPE_INTEGRAL_CONVERSION(name, underlying_type, go_type)
%typemap(gotype) name, name* "go_type"
%typemap(in) name      %{    $1 = name(static_cast<underlying_type>($input));%}
%typemap(in) name*     %{    auto tmp = name(static_cast<underlying_type>($input)); $1 = &tmp;%}
%typemap(out) name     %{    $result = static_cast<underlying_type>((name) $1);%}
%typemap(out) name*    %{    $result = static_cast<underlying_type>((name) *$1);%}
%enddef

%define LIBTORRENT_BITFIELD_CONVERSION(tag, underlying_type, go_type)
TYPE_INTEGRAL_CONVERSION(%arg(libtorrent::flags::bitfield_flag<underlying_type, tag>), underlying_type, go_type)
%enddef

%define LIBTORRENT_STRONG_TYPEDEF_CONVERSION(tag, underlying_type, go_type)
TYPE_INTEGRAL_CONVERSION(%arg(libtorrent::aux::strong_typedef<underlying_type, tag>), underlying_type, go_type)
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
LIBTORRENT_STRONG_TYPEDEF_CONVERSION(libtorrent::aux::piece_index_tag, std::int32_t, int)
LIBTORRENT_STRONG_TYPEDEF_CONVERSION(libtorrent::aux::file_index_tag, std::int32_t, int)

// torrent_handle
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::status_flags_tag, std::uint32_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::add_piece_flags_tag, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::pause_flags_tag, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::deadline_flags_tag, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::resume_data_flags_tag, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::reannounce_flags_tag, std::uint8_t, uint)
LIBTORRENT_STRONG_TYPEDEF_CONVERSION(libtorrent::queue_position_tag, int, int)

// peer_class
LIBTORRENT_STRONG_TYPEDEF_CONVERSION(libtorrent::peer_class_tag, std::uint32_t, uint)

// portmap
LIBTORRENT_STRONG_TYPEDEF_CONVERSION(libtorrent::port_mapping_tag, int, int)

// peer_info
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::peer_flags_tag, std::uint32_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::peer_source_flags_tag, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::bandwidth_state_flags_tag, std::uint8_t, uint)

// download_priority
LIBTORRENT_STRONG_TYPEDEF_CONVERSION(libtorrent::download_priority_tag, std::uint8_t, uint)

// alert
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::alert_category_tag, std::uint32_t, uint)

// torrent_flags
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::torrent_flags_tag, std::uint64_t, uint64)

// session_types
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::save_state_flags_tag, std::uint32_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::session_flags_tag, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::remove_flags_tag, std::uint8_t, uint)
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::reopen_network_flags_tag, std::uint8_t, uint)

// alert_types
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::picker_flags_tag, std::uint32_t, uint)

// create_torrent
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::create_flags_tag, std::uint32_t, uint)

// file_storage
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::file_flags_tag, std::uint8_t, uint)

// pex_flags
LIBTORRENT_BITFIELD_CONVERSION(libtorrent::pex_flags_tag, std::uint8_t, uint)

// storage_defs
LIBTORRENT_STRONG_TYPEDEF_CONVERSION(libtorrent::storage_index_tag_t, std::uint32_t, uint)
