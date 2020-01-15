%{
#include <libtorrent/bitfield.hpp>
%}

%extend libtorrent::bitfield {
    void const* bytes() const {
        return (void*)self->data();
    }
}
%ignore libtorrent::bitfield::bytes;
%ignore libtorrent::bitfield::bitfield(bitfield &&);

%include <libtorrent/bitfield.hpp>
