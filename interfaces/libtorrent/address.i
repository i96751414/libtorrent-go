%{
#include "libtorrent/address.hpp"
%}
%include "libtorrent/address.hpp"

// Swig seems not to be handling 'using' keyword
%{
using libtorrent::address;
using libtorrent::address_v4;
using libtorrent::address_v6;
%}
