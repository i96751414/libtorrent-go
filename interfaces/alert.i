%{
#include <libtorrent/alert.hpp>
#include <libtorrent/alert_manager.hpp>
#include <libtorrent/write_resume_data.hpp>
%}

%ignore libtorrent::log_alert;
%ignore libtorrent::peer_log_alert;
%ignore libtorrent::portmap_log_alert;
%ignore libtorrent::torrent_log_alert;
%ignore libtorrent::stats_alert;
%ignore libtorrent::picker_log_alert;

namespace libtorrent {
    struct alert_category_tag;
}

%include <libtorrent/alert.hpp>
%include <libtorrent/alert_manager.hpp>
%include <libtorrent/write_resume_data.hpp>

%{
    using libtorrent::time_point;
%}
