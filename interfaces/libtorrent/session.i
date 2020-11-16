%{
#include "libtorrent/session.hpp"
%}

%ignore libtorrent::session_proxy::session_proxy(session_proxy&&);
%ignore libtorrent::session_params::session_params(settings_pack&&);
%ignore libtorrent::session_params::session_params(settings_pack&&, std::vector<std::shared_ptr<plugin>>);
%ignore libtorrent::session_params::session_params(session_params&&);
%ignore libtorrent::session::session(session_params&&);
%ignore libtorrent::session::session(session_params&&, session_flags_t const);
%ignore libtorrent::session::session(session_params&&, io_service&);
%ignore libtorrent::session::session(settings_pack&&, session_flags_t const);
%ignore libtorrent::session::session(settings_pack&&);
%ignore libtorrent::session::session(session&&);
%ignore libtorrent::session::session(settings_pack&&, io_service&);
%ignore libtorrent::session::session(settings_pack&&, io_service&, session_flags_t const);

%include "libtorrent/session.hpp"

%extend libtorrent::session {
    void add_extensions() {
        $self->add_extension(&libtorrent::create_smart_ban_plugin);
        $self->add_extension(&libtorrent::create_ut_metadata_plugin);
        $self->add_extension(&libtorrent::create_ut_pex_plugin);
    }
}
