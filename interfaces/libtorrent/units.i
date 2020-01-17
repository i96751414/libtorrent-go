%{
#include "libtorrent/units.hpp"

// Swig seems not to be handling 'using' keyword in some cases
using libtorrent::file_index_t;
using libtorrent::piece_index_t;
%}

namespace libtorrent {
    namespace aux {
        template<typename UnderlyingType, typename Tag
            , typename Cond = typename std::enable_if<std::is_integral<UnderlyingType>::value>::type>
        struct strong_typedef {
            constexpr operator UnderlyingType() const;
        };

        struct piece_index_tag;
        struct file_index_tag;
    }

    // %template(piece_index_t) aux::strong_typedef<std::int32_t, aux::piece_index_tag>;
    // %template(file_index_t) aux::strong_typedef<std::int32_t, aux::file_index_tag>;
}
