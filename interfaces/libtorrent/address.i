%{
#include "libtorrent/address.hpp"
%}
%include "libtorrent/address.hpp"

// Swig seems not to be handling 'using' keyword in some cases
%{
using libtorrent::address;
using libtorrent::address_v4;
using libtorrent::address_v6;
%}
