%{
#include "libtorrent/time.hpp"
%}
%include "libtorrent/time.hpp"

// Swig seems not to be handling 'using' keyword
/*%{
using libtorrent::time_point;
%}*/

/*namespace libtorrent
{
    class time_duration;

    time_duration milliseconds(int64_t n) {
        return boost::chrono::milliseconds(n);
    }

    time_duration seconds(int64_t n) {
        return boost::chrono::seconds(n);
    }
}*/