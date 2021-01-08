%{
#include "libtorrent/storage.hpp"
%}

%ignore libtorrent::storage_interface::readv;
%ignore libtorrent::storage_interface::writev;
// SWIG fails to initialise atomic: https://github.com/swig/swig/issues/1185
// In cases this variable is required, a typemap needs to be created
%ignore libtorrent::storage_interface::m_settings;

%include "libtorrent/storage.hpp"

%extend libtorrent::storage_interface {
    int read(char_ptr buf, std::ptrdiff_t size, piece_index_t piece, int offset, storage_error& ec) {
        libtorrent::iovec_t b = {buf, size};
        return $self->readv(b, piece, offset, libtorrent::open_mode::read_only, ec);
    }
}
