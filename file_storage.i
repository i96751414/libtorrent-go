%{
#include <libtorrent/performance_counters.hpp>
#include <libtorrent/linked_list.hpp>
#include <libtorrent/hasher.hpp>
#include <libtorrent/tailqueue.hpp>
#include <libtorrent/io_service.hpp>
#include <libtorrent/storage_defs.hpp>
#include <libtorrent/settings_pack.hpp>
#include <libtorrent/peer_request.hpp>
#include <libtorrent/file.hpp>
#include <libtorrent/block_cache.hpp>
#include <libtorrent/resolve_links.hpp>
#include <libtorrent/disk_buffer_holder.hpp>
#include <libtorrent/disk_buffer_pool.hpp>
#include <libtorrent/disk_io_job.hpp>
#include <libtorrent/disk_io_thread.hpp>
#include <libtorrent/disk_job_pool.hpp>
#include <libtorrent/file_storage.hpp>
#include <libtorrent/file_pool.hpp>
#include <libtorrent/storage.hpp>
%}

%ignore libtorrent::disk_io_thread::do_read_and_hash;
%ignore libtorrent::disk_io_thread::do_resolve_links;

// SWiG voodoo for Windows and the dreaded "'iovec' has not been declared"...
namespace libtorrent {
  namespace file {}
}

%include <libtorrent/performance_counters.hpp>
%include <libtorrent/linked_list.hpp>
%include <libtorrent/hasher.hpp>
%include <libtorrent/tailqueue.hpp>
%include <libtorrent/io_service.hpp>
%include <libtorrent/storage_defs.hpp>
%include <libtorrent/settings_pack.hpp>
%include <libtorrent/peer_request.hpp>
%include <libtorrent/file.hpp>
%include <libtorrent/block_cache.hpp>
%include <libtorrent/resolve_links.hpp>
%include <libtorrent/disk_buffer_holder.hpp>
%include <libtorrent/disk_buffer_pool.hpp>
%include <libtorrent/disk_io_job.hpp>
%include <libtorrent/disk_io_thread.hpp>
%include <libtorrent/disk_job_pool.hpp>
%include <libtorrent/file_storage.hpp>
%include <libtorrent/file_pool.hpp>
%include <libtorrent/storage.hpp>
