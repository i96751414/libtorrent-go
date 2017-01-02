%{
#include <libtorrent/alert.hpp>
#include <libtorrent/alert_manager.hpp>
%}

%ignore libtorrent::log_alert;
%ignore libtorrent::peer_log_alert;
%ignore libtorrent::portmap_log_alert;
%ignore libtorrent::torrent_log_alert;
%ignore libtorrent::stats_alert;
%ignore libtorrent::picker_log_alert;

%include <libtorrent/alert.hpp>
%include <libtorrent/alert_manager.hpp>

%{
    using libtorrent::time_point;
%}
