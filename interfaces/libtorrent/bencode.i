%{
#include "libtorrent/bencode.hpp"
%}

%inline %{
namespace libtorrent {
    std::string bencode(const entry& e) {
        std::ostringstream oss;
        bencode(std::ostream_iterator<char>(oss), e);
        return oss.str();
    }
}
%}
