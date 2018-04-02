# Maintainer: disarmer mk <disarmer.mk@gmail.com>

_name=jack-stub
pkgname=$_name
pkgver=0.01
pkgrel=1
pkgdesc="Stub .so for smbclient painless jack removing"
arch=('i686' 'x86_64')
license=('gpl')
depends=()
replaces=('jack')
conflicts=($replaces)
provides=(jack)
source=()
md5sums=()

package() {
    mkdir "${pkgdir}"/usr/lib/ -p
    echo "cleanup_mlock default_jack_error_callback default_jack_info_callback jack_acquire_real_time_scheduling jack_activate jack_attach_port_segment jack_attach_shm jack_builtin_audio_functions jack_builtin_midi_functions jack_builtin_NULL_functions jack_builtin_port_types jack_call_sync_client jack_call_timebase_master jack_cleanup_shm jack_client_alloc jack_client_alloc_internal jack_client_close jack_client_create_thread jack_client_deliver_request jack_client_fix_port_buffers jack_client_get_uuid jack_client_handle_latency_callback jack_client_handle_port_connection jack_client_handle_session_callback jack_client_has_session_callback jack_client_max_real_time_priority jack_client_name_size jack_client_new jack_client_open jack_client_open_aux jack_client_real_time_priority jack_client_thread_id jack_client_uuid_generate jack_clock_source_name jack_connect jack_cpu_load jack_cycle_signal jack_cycle_wait jack_deactivate jack_default_server_name jack_destroy_shm jack_disconnect jack_drop_real_time_scheduling jack_engine_takeover_timebase jack_error jack_error_callback jack_event_type_name jack_frames_since_cycle_start jack_frames_to_time jack_frame_time jack_free jack_free_description jack_generate_unique_id jack_get_all_descriptions jack_get_all_properties jack_get_buffer_size jack_get_client_name jack_get_client_name_by_uuid jack_get_current_transport_frame jack_get_cycle_times jack_get_description jack_get_free_shm_info jack_get_internal_client_name jack_get_max_delayed_usecs jack_get_mhz jack_get_microseconds_from_cycles jack_get_microseconds_from_system jack_get_port_functions jack_get_ports jack_get_process_done_fd jack_get_properties jack_get_property jack_get_sample_rate jack_get_time jack_get_transport_info jack_get_uuid_for_client_name jack_get_xrun_delayed_usecs jack_hpet_init jack_info jack_info_callback jack_initialize_shm jack_init_time jack_internal_client_close jack_internal_client_handle jack_internal_client_load jack_internal_client_load_aux jack_internal_client_new jack_internal_client_unload jack_is_realtime jack_last_frame_time jack_messagebuffer_add jack_messagebuffer_exit jack_messagebuffer_init jack_messagebuffer_thread_init JACK_METADATA_CONNECTED JACK_METADATA_HARDWARE JACK_METADATA_ICON_LARGE JACK_METADATA_ICON_SMALL JACK_METADATA_PORT_GROUP JACK_METADATA_PRETTY_NAME jack_midi_clear_buffer jack_midi_event_get jack_midi_event_reserve jack_midi_event_write jack_midi_get_event_count jack_midi_get_lost_event_count jack_midi_internal_event_size jack_midi_max_event_size jack_on_info_shutdown jack_on_shutdown jack_pool_alloc jack_pool_release jack_port_by_id jack_port_by_id_int jack_port_by_name jack_port_by_name_int jack_port_connected jack_port_connected_to jack_port_disconnect jack_port_ensure_monitor jack_port_flags jack_port_get_aliases jack_port_get_all_connections jack_port_get_buffer jack_port_get_connections jack_port_get_latency jack_port_get_latency_range jack_port_get_total_latency jack_port_is_mine jack_port_monitoring_input jack_port_name jack_port_name_equals jack_port_name_size jack_port_new jack_port_register jack_port_request_monitor jack_port_request_monitor_by_name jack_port_set_alias jack_port_set_latency jack_port_set_latency_range jack_port_set_name jack_port_short_name jack_port_tie jack_port_type jack_port_type_buffer_size jack_port_type_get_buffer_size jack_port_type_size jack_port_unregister jack_port_unset_alias jack_port_untie jack_port_uuid jack_port_uuid_generate jack_recompute_total_latencies jack_recompute_total_latency jack_register_server jack_release_shm jack_release_shm_info jack_release_timebase jack_remove_all_properties jack_remove_properties jack_remove_property jack_reserve_client_name jack_reset_max_delayed_usecs jack_resize_shm jack_ringbuffer_create jack_ringbuffer_free jack_ringbuffer_get_read_vector jack_ringbuffer_get_write_vector jack_ringbuffer_mlock jack_ringbuffer_peek jack_ringbuffer_read jack_ringbuffer_read_advance jack_ringbuffer_read_space jack_ringbuffer_reset jack_ringbuffer_write jack_ringbuffer_write_advance jack_ringbuffer_write_space jack_server_dir jack_session_commands_free jack_session_event_free jack_session_notify jack_session_reply jack_set_buffer_size jack_set_buffer_size_callback jack_set_client_registration_callback jack_set_clock_source jack_set_error_function jack_set_freewheel jack_set_freewheel_callback jack_set_graph_order_callback jack_set_info_function jack_set_latency_callback jack_set_port_connect_callback jack_set_port_registration_callback jack_set_process_callback jack_set_process_thread jack_set_property jack_set_property_change_callback jack_set_sample_rate_callback jack_set_session_callback jack_set_sync_callback jack_set_sync_timeout jack_set_thread_creator jack_set_thread_init_callback jack_set_timebase_callback jack_set_transport_info jack_set_xrun_callback jack_shmalloc jack_start_freewheel jack_stop_freewheel jack_thread_creator jack_thread_wait jack_time_to_frames jack_tmpdir jack_transport_copy_position jack_transport_locate jack_transport_query jack_transport_reposition jack_transport_start jack_transport_stop jack_unregister_server jack_user_dir jack_uuid_clear jack_uuid_compare jack_uuid_copy jack_uuid_empty jack_uuid_parse jack_uuid_to_index jack_uuid_unparse silent_jack_error_callback start_server" | perl -nwE 'for(split " ",$_){say "void $_(){}"}' |gcc -shared -o "${pkgdir}"/usr/lib/libjack.so.0 -xc -
}
