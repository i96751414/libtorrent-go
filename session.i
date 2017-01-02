%{
#include <libtorrent/io_service.hpp>
#include <libtorrent/ip_filter.hpp>
#include <libtorrent/kademlia/dht_storage.hpp>
#include <libtorrent/bandwidth_limit.hpp>
#include <libtorrent/peer_class.hpp>
#include <libtorrent/peer_class_type_filter.hpp>
#include <libtorrent/settings_pack.hpp>
#include <libtorrent/session.hpp>
#include <libtorrent/session_stats.hpp>
#include <libtorrent/session_status.hpp>
#include <libtorrent/session_handle.hpp>
%}

// These are problematic, so we ignore them.
%ignore libtorrent::session_handle::add_extension;
%ignore libtorrent::session_handle::dht_put_item;

%template(stdVectorAlerts) std::vector<libtorrent::alert*>;

%extend libtorrent::session {
  libtorrent::session_handle* get_handle() {
    return self;
  }
}
%extend libtorrent::session_handle {
  std::vector<libtorrent::alert*> pop_alerts() {
    std::vector<libtorrent::alert*> alerts;
    self->pop_alerts(&alerts);
    return alerts;
  }
}
%ignore libtorrent::session_handle::pop_alerts;

%include "extensions.i"
%include <libtorrent/io_service.hpp>
%include <libtorrent/ip_filter.hpp>
%include <libtorrent/kademlia/dht_storage.hpp>
%include <libtorrent/bandwidth_limit.hpp>
%include <libtorrent/peer_class.hpp>
%include <libtorrent/peer_class_type_filter.hpp>
%include <libtorrent/settings_pack.hpp>
%include <libtorrent/session.hpp>
%include <libtorrent/session_stats.hpp>
%include <libtorrent/session_status.hpp>
%include <libtorrent/session_handle.hpp>
