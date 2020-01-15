%{
#include "libtorrent/alert_types.hpp"
%}

namespace libtorrent {
    struct picker_flags_tag;
}

%ignore libtorrent::torrent_alert::torrent_alert;
%ignore libtorrent::peer_alert::peer_alert;
%ignore libtorrent::tracker_alert::tracker_alert;
%ignore libtorrent::torrent_added_alert::torrent_added_alert;
%ignore libtorrent::torrent_removed_alert::torrent_removed_alert;
%ignore libtorrent::read_piece_alert::read_piece_alert;
%ignore libtorrent::file_completed_alert::file_completed_alert;
%ignore libtorrent::file_renamed_alert::file_renamed_alert;
%ignore libtorrent::file_rename_failed_alert::file_rename_failed_alert;
%ignore libtorrent::performance_alert::performance_alert;
%ignore libtorrent::state_changed_alert::state_changed_alert;
%ignore libtorrent::tracker_error_alert::tracker_error_alert;
%ignore libtorrent::tracker_warning_alert::tracker_warning_alert;
%ignore libtorrent::scrape_reply_alert::scrape_reply_alert;
%ignore libtorrent::scrape_failed_alert::scrape_failed_alert;
%ignore libtorrent::tracker_reply_alert::tracker_reply_alert;
%ignore libtorrent::dht_reply_alert::dht_reply_alert;
%ignore libtorrent::tracker_announce_alert::tracker_announce_alert;
%ignore libtorrent::hash_failed_alert::hash_failed_alert;
%ignore libtorrent::peer_ban_alert::peer_ban_alert;
%ignore libtorrent::peer_unsnubbed_alert::peer_unsnubbed_alert;
%ignore libtorrent::peer_snubbed_alert::peer_snubbed_alert;
%ignore libtorrent::peer_error_alert::peer_error_alert;
%ignore libtorrent::peer_connect_alert::peer_connect_alert;
%ignore libtorrent::peer_disconnected_alert::peer_disconnected_alert;
%ignore libtorrent::invalid_request_alert::invalid_request_alert;
%ignore libtorrent::torrent_finished_alert::torrent_finished_alert;
%ignore libtorrent::piece_finished_alert::piece_finished_alert;
%ignore libtorrent::request_dropped_alert::request_dropped_alert;
%ignore libtorrent::block_timeout_alert::block_timeout_alert;
%ignore libtorrent::block_finished_alert::block_finished_alert;
%ignore libtorrent::block_downloading_alert::block_downloading_alert;
%ignore libtorrent::unwanted_block_alert::unwanted_block_alert;
%ignore libtorrent::storage_moved_alert::storage_moved_alert;
%ignore libtorrent::storage_moved_failed_alert::storage_moved_failed_alert;
%ignore libtorrent::torrent_deleted_alert::torrent_deleted_alert;
%ignore libtorrent::torrent_delete_failed_alert::torrent_delete_failed_alert;
%ignore libtorrent::save_resume_data_alert::save_resume_data_alert;
%ignore libtorrent::save_resume_data_failed_alert::save_resume_data_failed_alert;
%ignore libtorrent::torrent_paused_alert::torrent_paused_alert;
%ignore libtorrent::torrent_resumed_alert::torrent_resumed_alert;
%ignore libtorrent::torrent_checked_alert::torrent_checked_alert;
%ignore libtorrent::url_seed_alert::url_seed_alert;
%ignore libtorrent::file_error_alert::file_error_alert;
%ignore libtorrent::metadata_failed_alert::metadata_failed_alert;
%ignore libtorrent::metadata_received_alert::metadata_received_alert;
%ignore libtorrent::udp_error_alert::udp_error_alert;
%ignore libtorrent::external_ip_alert::external_ip_alert;
%ignore libtorrent::listen_failed_alert::listen_failed_alert;
%ignore libtorrent::listen_succeeded_alert::listen_succeeded_alert;
%ignore libtorrent::portmap_error_alert::portmap_error_alert;
%ignore libtorrent::portmap_alert::portmap_alert;
%ignore libtorrent::portmap_log_alert::portmap_log_alert;
%ignore libtorrent::fastresume_rejected_alert::fastresume_rejected_alert;
%ignore libtorrent::peer_blocked_alert::peer_blocked_alert;
%ignore libtorrent::dht_announce_alert::dht_announce_alert;
%ignore libtorrent::dht_get_peers_alert::dht_get_peers_alert;
%ignore libtorrent::stats_alert::stats_alert;
%ignore libtorrent::cache_flushed_alert::cache_flushed_alert;
%ignore libtorrent::anonymous_mode_alert::anonymous_mode_alert;
%ignore libtorrent::lsd_peer_alert::lsd_peer_alert;
%ignore libtorrent::trackerid_alert::trackerid_alert;
%ignore libtorrent::dht_bootstrap_alert::dht_bootstrap_alert;
%ignore libtorrent::torrent_error_alert::torrent_error_alert;
%ignore libtorrent::torrent_need_cert_alert::torrent_need_cert_alert;
%ignore libtorrent::incoming_connection_alert::incoming_connection_alert;
%ignore libtorrent::add_torrent_alert::add_torrent_alert;
%ignore libtorrent::state_update_alert::state_update_alert;
%ignore libtorrent::mmap_cache_alert::mmap_cache_alert;
%ignore libtorrent::session_stats_alert::session_stats_alert;
%ignore libtorrent::torrent_update_alert::torrent_update_alert;
%ignore libtorrent::dht_error_alert::dht_error_alert;
%ignore libtorrent::dht_immutable_item_alert::dht_immutable_item_alert;
%ignore libtorrent::dht_mutable_item_alert::dht_mutable_item_alert;
%ignore libtorrent::dht_put_alert::dht_put_alert;
%ignore libtorrent::i2p_alert::i2p_alert;
%ignore libtorrent::dht_outgoing_get_peers_alert::dht_outgoing_get_peers_alert;
%ignore libtorrent::log_alert::log_alert;
%ignore libtorrent::torrent_log_alert::torrent_log_alert;
%ignore libtorrent::peer_log_alert::peer_log_alert;
%ignore libtorrent::lsd_error_alert::lsd_error_alert;
%ignore libtorrent::dht_stats_alert::dht_stats_alert;
%ignore libtorrent::incoming_request_alert::incoming_request_alert;
%ignore libtorrent::dht_log_alert::dht_log_alert;
%ignore libtorrent::dht_pkt_alert::dht_pkt_alert;
%ignore libtorrent::dht_get_peers_reply_alert::dht_get_peers_reply_alert;
%ignore libtorrent::dht_direct_response_alert::dht_direct_response_alert;
%ignore libtorrent::picker_log_alert::picker_log_alert;
%ignore libtorrent::session_error_alert::session_error_alert;
%ignore libtorrent::dht_live_nodes_alert::dht_live_nodes_alert;
%ignore libtorrent::session_stats_header_alert::session_stats_header_alert;
%ignore libtorrent::dht_sample_infohashes_alert::dht_sample_infohashes_alert;
%ignore libtorrent::block_uploaded_alert::block_uploaded_alert;
%ignore libtorrent::alerts_dropped_alert::alerts_dropped_alert;
%ignore libtorrent::socks5_alert::socks5_alert;

/*
%ignore libtorrent::log_alert;
%ignore libtorrent::log_alert;
%ignore libtorrent::peer_log_alert;
%ignore libtorrent::portmap_log_alert;
%ignore libtorrent::torrent_log_alert;
%ignore libtorrent::stats_alert;
%ignore libtorrent::picker_log_alert;
*/

// SWIG doesn't like final keyword: https://github.com/swig/swig/issues/672
#define final
%include "libtorrent/alert_types.hpp"
#undef final


%extend libtorrent::session_stats_alert {
    long long get_value(int index) {
        return $self->counters()[index];
    }
}