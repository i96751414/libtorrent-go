%{
#include "libtorrent/bdecode.hpp"
%}

%ignore libtorrent::bdecode_node::bdecode_node(bdecode_node&&);

%inline %{
namespace libtorrent {
    void bdecode(char_ptr data, size_t size, bdecode_node& ret, error_code& ec) {
        bdecode((const char*)data, (const char*)(data + size), ret, ec);
    }
}
%}
%ignore libtorrent::bdecode;

%include "libtorrent/bdecode.hpp"
