%{
#include <sstream>
#include <libtorrent/bencode.hpp>
#include <libtorrent/bdecode.hpp>
%}

%ignore libtorrent::entry::entry(entry&&);
%ignore libtorrent::bdecode_node::bdecode_node(bdecode_node&&);

%include <libtorrent/entry.hpp>
%include <libtorrent/bdecode.hpp>

namespace libtorrent {
    std::string bencode(const entry& e);
    error_code bdecode(std::string data, bdecode_node& ret);
}

%{
namespace libtorrent {
    std::string bencode(const entry& e) {
        std::ostringstream oss;
        bencode(std::ostream_iterator<char>(oss), e);
        return oss.str();
    }

    error_code bdecode(std::string data, bdecode_node& ret) {
        error_code ec;
        bdecode((const char*)data.c_str(), (const char*)(data.c_str() + data.size()), ret, ec);
        return ec;
    }
}
%}
