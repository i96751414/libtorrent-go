%{
#include <libtorrent/close_reason.hpp>
#include <libtorrent/session_stats.hpp>
#include <libtorrent/alert_types.hpp>
#include <libtorrent/piece_block.hpp>
%}

namespace libtorrent {
    struct port_mapping_tag;
    struct picker_flags_tag;
}

%ignore libtorrent::v1_2::torrent_alert::torrent_alert;
%ignore libtorrent::v1_2::peer_alert::peer_alert;
%ignore libtorrent::v1_2::tracker_alert::tracker_alert;
%ignore libtorrent::v1_2::torrent_added_alert::torrent_added_alert;
%ignore libtorrent::v1_2::torrent_removed_alert::torrent_removed_alert;
%ignore libtorrent::v1_2::read_piece_alert::read_piece_alert;
%ignore libtorrent::v1_2::file_completed_alert::file_completed_alert;
%ignore libtorrent::v1_2::file_renamed_alert::file_renamed_alert;
%ignore libtorrent::v1_2::file_rename_failed_alert::file_rename_failed_alert;
%ignore libtorrent::v1_2::performance_alert::performance_alert;
%ignore libtorrent::v1_2::state_changed_alert::state_changed_alert;
%ignore libtorrent::v1_2::tracker_error_alert::tracker_error_alert;
%ignore libtorrent::v1_2::tracker_warning_alert::tracker_warning_alert;
%ignore libtorrent::v1_2::scrape_reply_alert::scrape_reply_alert;
%ignore libtorrent::v1_2::scrape_failed_alert::scrape_failed_alert;
%ignore libtorrent::v1_2::tracker_reply_alert::tracker_reply_alert;
%ignore libtorrent::v1_2::dht_reply_alert::dht_reply_alert;
%ignore libtorrent::v1_2::tracker_announce_alert::tracker_announce_alert;
%ignore libtorrent::v1_2::hash_failed_alert::hash_failed_alert;
%ignore libtorrent::v1_2::peer_ban_alert::peer_ban_alert;
%ignore libtorrent::v1_2::peer_unsnubbed_alert::peer_unsnubbed_alert;
%ignore libtorrent::v1_2::peer_snubbed_alert::peer_snubbed_alert;
%ignore libtorrent::v1_2::peer_error_alert::peer_error_alert;
%ignore libtorrent::v1_2::peer_connect_alert::peer_connect_alert;
%ignore libtorrent::v1_2::peer_disconnected_alert::peer_disconnected_alert;
%ignore libtorrent::v1_2::invalid_request_alert::invalid_request_alert;
%ignore libtorrent::v1_2::torrent_finished_alert::torrent_finished_alert;
%ignore libtorrent::v1_2::piece_finished_alert::piece_finished_alert;
%ignore libtorrent::v1_2::request_dropped_alert::request_dropped_alert;
%ignore libtorrent::v1_2::block_timeout_alert::block_timeout_alert;
%ignore libtorrent::v1_2::block_finished_alert::block_finished_alert;
%ignore libtorrent::v1_2::block_downloading_alert::block_downloading_alert;
%ignore libtorrent::v1_2::unwanted_block_alert::unwanted_block_alert;
%ignore libtorrent::v1_2::storage_moved_alert::storage_moved_alert;
%ignore libtorrent::v1_2::storage_moved_failed_alert::storage_moved_failed_alert;
%ignore libtorrent::v1_2::torrent_deleted_alert::torrent_deleted_alert;
%ignore libtorrent::v1_2::torrent_delete_failed_alert::torrent_delete_failed_alert;
%ignore libtorrent::v1_2::save_resume_data_alert::save_resume_data_alert;
%ignore libtorrent::v1_2::save_resume_data_failed_alert::save_resume_data_failed_alert;
%ignore libtorrent::v1_2::torrent_paused_alert::torrent_paused_alert;
%ignore libtorrent::v1_2::torrent_resumed_alert::torrent_resumed_alert;
%ignore libtorrent::v1_2::torrent_checked_alert::torrent_checked_alert;
%ignore libtorrent::v1_2::url_seed_alert::url_seed_alert;
%ignore libtorrent::v1_2::file_error_alert::file_error_alert;
%ignore libtorrent::v1_2::metadata_failed_alert::metadata_failed_alert;
%ignore libtorrent::v1_2::metadata_received_alert::metadata_received_alert;
%ignore libtorrent::v1_2::udp_error_alert::udp_error_alert;
%ignore libtorrent::v1_2::external_ip_alert::external_ip_alert;
%ignore libtorrent::v1_2::listen_failed_alert::listen_failed_alert;
%ignore libtorrent::v1_2::listen_succeeded_alert::listen_succeeded_alert;
%ignore libtorrent::v1_2::portmap_error_alert::portmap_error_alert;
%ignore libtorrent::v1_2::portmap_alert::portmap_alert;
%ignore libtorrent::v1_2::portmap_log_alert::portmap_log_alert;
%ignore libtorrent::v1_2::fastresume_rejected_alert::fastresume_rejected_alert;
%ignore libtorrent::v1_2::peer_blocked_alert::peer_blocked_alert;
%ignore libtorrent::v1_2::dht_announce_alert::dht_announce_alert;
%ignore libtorrent::v1_2::dht_get_peers_alert::dht_get_peers_alert;
%ignore libtorrent::v1_2::stats_alert::stats_alert;
%ignore libtorrent::v1_2::cache_flushed_alert::cache_flushed_alert;
%ignore libtorrent::v1_2::anonymous_mode_alert::anonymous_mode_alert;
%ignore libtorrent::v1_2::lsd_peer_alert::lsd_peer_alert;
%ignore libtorrent::v1_2::trackerid_alert::trackerid_alert;
%ignore libtorrent::v1_2::dht_bootstrap_alert::dht_bootstrap_alert;
%ignore libtorrent::v1_2::torrent_error_alert::torrent_error_alert;
%ignore libtorrent::v1_2::torrent_need_cert_alert::torrent_need_cert_alert;
%ignore libtorrent::v1_2::incoming_connection_alert::incoming_connection_alert;
%ignore libtorrent::v1_2::add_torrent_alert::add_torrent_alert;
%ignore libtorrent::v1_2::state_update_alert::state_update_alert;
%ignore libtorrent::v1_2::mmap_cache_alert::mmap_cache_alert;
%ignore libtorrent::v1_2::session_stats_alert::session_stats_alert;
%ignore libtorrent::v1_2::torrent_update_alert::torrent_update_alert;
%ignore libtorrent::v1_2::dht_error_alert::dht_error_alert;
%ignore libtorrent::v1_2::dht_immutable_item_alert::dht_immutable_item_alert;
%ignore libtorrent::v1_2::dht_mutable_item_alert::dht_mutable_item_alert;
%ignore libtorrent::v1_2::dht_put_alert::dht_put_alert;
%ignore libtorrent::v1_2::i2p_alert::i2p_alert;
%ignore libtorrent::v1_2::dht_outgoing_get_peers_alert::dht_outgoing_get_peers_alert;
%ignore libtorrent::v1_2::log_alert::log_alert;
%ignore libtorrent::v1_2::torrent_log_alert::torrent_log_alert;
%ignore libtorrent::v1_2::peer_log_alert::peer_log_alert;
%ignore libtorrent::v1_2::lsd_error_alert::lsd_error_alert;
%ignore libtorrent::v1_2::dht_stats_alert::dht_stats_alert;
%ignore libtorrent::v1_2::incoming_request_alert::incoming_request_alert;
%ignore libtorrent::v1_2::dht_log_alert::dht_log_alert;
%ignore libtorrent::v1_2::dht_pkt_alert::dht_pkt_alert;
%ignore libtorrent::v1_2::dht_get_peers_reply_alert::dht_get_peers_reply_alert;
%ignore libtorrent::v1_2::dht_direct_response_alert::dht_direct_response_alert;
%ignore libtorrent::v1_2::picker_log_alert::picker_log_alert;
%ignore libtorrent::v1_2::session_error_alert::session_error_alert;
%ignore libtorrent::v1_2::dht_live_nodes_alert::dht_live_nodes_alert;
%ignore libtorrent::v1_2::session_stats_header_alert::session_stats_header_alert;
%ignore libtorrent::v1_2::dht_sample_infohashes_alert::dht_sample_infohashes_alert;
%ignore libtorrent::v1_2::block_uploaded_alert::block_uploaded_alert;
%ignore libtorrent::v1_2::alerts_dropped_alert::alerts_dropped_alert;
%ignore libtorrent::v1_2::socks5_alert::socks5_alert;

%ignore libtorrent::v1_2::session_stats_alert::counters;

%include <libtorrent/close_reason.hpp>
%include <libtorrent/address.hpp>
%include <libtorrent/portmap.hpp>
%include <libtorrent/session_stats.hpp>
%include <libtorrent/piece_block.hpp>

// SWIG doesn't like final keyword: https://github.com/swig/swig/issues/672
#define final
%include <libtorrent/alert_types.hpp>
#undef final

%{
using libtorrent::address;
using libtorrent::address_v4;
using libtorrent::address_v6;
%}

%extend libtorrent::v1_2::session_stats_alert {
    long long get_value(int index) {
        return $self->counters()[index];
    }
}