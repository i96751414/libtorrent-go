%{
#include <boost/shared_ptr.hpp>
#include <boost/make_shared.hpp>
#include <libtorrent/add_torrent_params.hpp>
%}

%extend libtorrent::add_torrent_params {
	const libtorrent::torrent_info* get_torrent_info() {
		return self->ti.get();
	}
	void set_torrent_info(libtorrent::torrent_info torrent_info) {
		boost::shared_ptr<libtorrent::torrent_info> ptr;
		ptr = boost::make_shared<libtorrent::torrent_info>(torrent_info);
		self->ti = ptr;
	}
}
%ignore libtorrent::add_torrent_params::ti;

%include <libtorrent/add_torrent_params.hpp>
