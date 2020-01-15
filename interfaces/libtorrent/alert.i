%{
#include "libtorrent/alert.hpp"
%}

namespace libtorrent {
    struct alert_category_tag;
}

%include "libtorrent/alert.hpp"

%template(stdVectorAlerts) std::vector<libtorrent::alert*>;
