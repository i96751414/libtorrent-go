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

            %extend {
                bool set() {
                    return (bool) *$self;
                }

                bool equal(bitfield_flag const f) {
                    return *$self == f;
                }

                bool not_equal(bitfield_flag const f) {
                    return *$self != f;
                }

                bitfield_flag or_(bitfield_flag const f) {
                    return *$self | f;
                }

                bitfield_flag and_(bitfield_flag const f) {
                    return *$self & f;
                }

                bitfield_flag xor(bitfield_flag const f) {
                    return *$self ^ f;
                }

                bitfield_flag inv() {
                    return ~*$self;
                }
            }
        };
    }
}
