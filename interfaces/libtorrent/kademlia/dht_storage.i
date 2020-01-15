%{
#include "libtorrent/kademlia/dht_storage.hpp"
%}

// SWIG does not support unique_ptr yet
%ignore libtorrent::dht::dht_default_storage_constructor;

%include "libtorrent/kademlia/dht_storage.hpp"
