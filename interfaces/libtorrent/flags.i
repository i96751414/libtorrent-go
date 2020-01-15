%{
#include "libtorrent/flags.hpp"
%}

// This is ugly and should be changed when possible
namespace libtorrent {
    namespace flags {
        template<typename UnderlyingType, typename Tag
            , typename Cond = typename std::enable_if<std::is_integral<UnderlyingType>::value>::type>
        struct bitfield_flag {
            static bitfield_flag all();
        };
    }
}
