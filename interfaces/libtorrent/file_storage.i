%{
#include "libtorrent/file_storage.hpp"
%}

namespace libtorrent {
    struct file_flags_tag;
}

%ignore libtorrent::internal_file_entry;
%ignore libtorrent::file_storage::file_storage(file_storage&&);
%ignore libtorrent::file_storage::file_path_hash;
%ignore libtorrent::file_storage::all_path_hashes;
%ignore libtorrent::file_storage::file_name_ptr;
%ignore libtorrent::file_storage::file_name_len;
%ignore libtorrent::file_storage::apply_pointer_offset;
%ignore libtorrent::file_storage::add_file(std::string const&, std::int64_t, std::uint32_t, std::time_t, string_view);
%ignore libtorrent::file_storage::file_range;
%ignore libtorrent::file_storage::piece_range;
%ignore libtorrent::file_storage::sanitize_symlinks;

%include "libtorrent/file_storage.hpp"
