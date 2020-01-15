%{
#include <libtorrent/io_service.hpp>
#include <libtorrent/ip_filter.hpp>
#include <libtorrent/kademlia/node_id.hpp>
#include <libtorrent/kademlia/types.hpp>
#include <libtorrent/kademlia/dht_storage.hpp>
#include <libtorrent/bandwidth_limit.hpp>
#include <libtorrent/peer_class.hpp>
#include <libtorrent/peer_class_type_filter.hpp>
#include <libtorrent/settings_pack.hpp>
#include <libtorrent/session_types.hpp>
#include <libtorrent/session.hpp>
#include <libtorrent/session_stats.hpp>
#include <libtorrent/session_status.hpp>
#include <libtorrent/session_handle.hpp>
%}

%feature("director") session_handle;

// SWIG does not support unique_ptr yet
%ignore libtorrent::dht::dht_default_storage_constructor;

// These are problematic, so we ignore them.
%ignore libtorrent::session_handle::add_extension;
%ignore libtorrent::session_handle::dht_put_item;

%ignore libtorrent::session_proxy::session_proxy(session_proxy&&);
%ignore libtorrent::session_params::session_params(settings_pack&&);
%ignore libtorrent::session_params::session_params(settings_pack&&, std::vector<std::shared_ptr<plugin>>);
%ignore libtorrent::session_params::session_params(session_params&&);
%ignore libtorrent::session::session(session_params&&);
%ignore libtorrent::session::session(session_params&&, io_service&);
%ignore libtorrent::session::session(settings_pack&&, session_flags_t const);
%ignore libtorrent::session::session(settings_pack&&);
%ignore libtorrent::session::session(session&&);
%ignore libtorrent::session::session(settings_pack&&, io_service&, session_flags_t const);
%ignore libtorrent::session::session(settings_pack&&, io_service&);

%ignore libtorrent::session_handle::session_handle(session_handle&&);
%ignore libtorrent::session_handle::add_torrent(add_torrent_params&&);
%ignore libtorrent::session_handle::add_torrent(add_torrent_params&&, error_code&);
%ignore libtorrent::session_handle::async_add_torrent(add_torrent_params&&);
%ignore libtorrent::session_handle::apply_settings(settings_pack&&);

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

namespace libtorrent {
    struct peer_class_tag;
    struct save_state_flags_tag;
    struct session_flags_tag;
    struct remove_flags_tag;
    struct reopen_network_flags_tag;
}

%include "extensions.i"
%include <libtorrent/io_service.hpp>
%include <libtorrent/ip_filter.hpp>
%include <libtorrent/kademlia/node_id.hpp>
%include <libtorrent/kademlia/types.hpp>
%include <libtorrent/kademlia/dht_storage.hpp>
%include <libtorrent/bandwidth_limit.hpp>
%include <libtorrent/peer_class.hpp>
%include <libtorrent/peer_class_type_filter.hpp>
%include <libtorrent/settings_pack.hpp>
%include <libtorrent/session_types.hpp>
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
