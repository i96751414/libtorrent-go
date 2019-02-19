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

%feature("director") session_handle;

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

%extend libtorrent::settings_pack {
  void set_bool(std::string const& name, bool val) {
    $self->set_bool(libtorrent::setting_by_name(name), val);
  };
  void set_int(std::string const& name, int val) {
    $self->set_int(libtorrent::setting_by_name(name), val);
  };
  void set_str(std::string const& name, std::string const& val) {
    $self->set_str(libtorrent::setting_by_name(name), val);
  };
  bool get_bool(std::string const& name) const {
    return $self->get_bool(libtorrent::setting_by_name(name));
  }
  int get_int(std::string const& name) const {
    return $self->get_int(libtorrent::setting_by_name(name));
  }
  std::string get_str(std::string const& name) const {
    return $self->get_str(libtorrent::setting_by_name(name));
  }
}
