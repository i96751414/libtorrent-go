%{
#include <libtorrent/flags.hpp>
%}

namespace libtorrent {
    namespace flags {
        template<typename UnderlyingType, typename Tag
            , typename Cond = typename std::enable_if<std::is_integral<UnderlyingType>::value>::type>
        struct bitfield_flag;
    }
}