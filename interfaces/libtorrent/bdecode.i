%{
#include "libtorrent/bdecode.hpp"
%}

%inline %{
namespace libtorrent {
    error_code bdecode(std::string data, bdecode_node& ret) {
        error_code ec;
        bdecode((const char*)data.c_str(), (const char*)(data.c_str() + data.size()), ret, ec);
        return ec;
    }
}
%}
