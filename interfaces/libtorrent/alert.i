%{
#include "libtorrent/alert.hpp"
%}

namespace libtorrent {
    struct alert_category_tag;
    // %template(alert_category_t) flags::bitfield_flag<std::uint32_t, alert_category_tag>;
}

%include "libtorrent/alert.hpp"

%template(stdVectorAlerts) std::vector<libtorrent::alert*>;
