%{
#include "libtorrent/span.hpp"
%}

namespace libtorrent {
    template <typename T>
    struct span {

        span();

        size_t size() const;
        bool empty() const;

        T front() const;
        T back() const;

        span<T> first(size_t const n) const;
        span<T> last(size_t const n) const;

        span<T> subspan(size_t const offset) const;
        span<T> subspan(size_t const offset, size_t const count) const;

        %extend {
            T get(size_t const idx) {
                return (*self)[idx];
            }
        }
    };

    %template(char_span) span<char>;
    %template(char_const_span) span<char const>;
    %template(int64_const_span) span<std::int64_t const>;
}
