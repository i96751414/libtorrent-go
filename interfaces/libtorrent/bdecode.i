%{
#include "libtorrent/bdecode.hpp"
%}

%ignore libtorrent::bdecode_node::bdecode_node(bdecode_node&&);

%inline %{
namespace libtorrent {
    void bdecode(std::string data, bdecode_node& ret, error_code& ec) {
        bdecode((const char*)data.c_str(), (const char*)(data.c_str() + data.size()), ret, ec);
    }
}
%}
%ignore libtorrent::bdecode;

%include "libtorrent/bdecode.hpp"
