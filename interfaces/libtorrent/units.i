%{
#include "libtorrent/units.hpp"

// Swig seems not to be handling 'using' keyword
using libtorrent::file_index_t;
using libtorrent::piece_index_t;
%}
