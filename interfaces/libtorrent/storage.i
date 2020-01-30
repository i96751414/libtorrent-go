%{
#include "libtorrent/storage.hpp"
%}

%ignore libtorrent::storage_interface::readv;
%ignore libtorrent::storage_interface::writev;

%include "libtorrent/storage.hpp"

%extend libtorrent::storage_interface {
    int read(char* buf, std::uint16_t size, piece_index_t piece, int offset, storage_error& ec) {
        libtorrent::iovec_t b = {buf, size};
        return $self->readv(b, piece, offset, libtorrent::open_mode::read_only, ec);
    }
}
