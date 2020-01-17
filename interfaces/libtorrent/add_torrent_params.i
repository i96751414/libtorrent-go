%{
#include "libtorrent/add_torrent_params.hpp"
%}

%ignore libtorrent::add_torrent_params::ti;
%ignore libtorrent::add_torrent_params::add_torrent_params(add_torrent_params&&);

%include "libtorrent/add_torrent_params.hpp"

%extend libtorrent::add_torrent_params {
    const libtorrent::torrent_info* get_torrent_info() {
        return $self->ti.get();
    }
    void set_torrent_info(libtorrent::torrent_info torrent_info) {
        $self->ti = std::make_shared<libtorrent::torrent_info>(torrent_info);
    }
}
