local main_transition_table = { 
    {"power_on", "BEGIN_CONNECTING", "connecting", display_connecting},
    {"power_on", "CONN_CONFIG_REQD", "ui_conn_config", ui_conn_config},
    
    {"connecting", "CONN_ERR", "ui_conn_err", ui_conn_err},
    {"ui_conn_err", "CONN_SUCCESS", "syncing_time", ui_conn_err},

    {"ui_conn_err", "PRESS_ANY", "ui_cant_connect_options", ui_cant_connect_options},
    
    {"ui_cant_connect_options", "PRESS_WEATHER", "ui_conn_config", ui_conn_config},
    {"ui_cant_connect_options", "PRESS_TIME", "ui_set_date", ui_set_date_start},
    {"ui_cant_connect_options", "PRESS_TRANSIT", "power_on", wifi_reconnect},
    
    {"ui_set_time", "PRESS_TIME", "display_datetime", set_selected_datetime},

    {"power_on", "CONN_SUCCESS", "syncing_time", sync_time},
    {"connecting", "CONN_SUCCESS", "syncing_time", sync_time},

    {"syncing_time", "TIMESYNC_ERR", "ui_timesync_err", ui_timesync_err},
    {"syncing_time", "TIMESYNC_SUCCESS", "display_datetime", display_datetime},

    {"display_datetime", "PRESS_TIME", "ui_set_alarm", ui_set_alarm},
    {"ui_set_alarm", "PRESS_TIME", "ui_set_alarm_confirm", ui_set_alarm_confirm},
    {"ui_set_alarm_confirm", "PRESS_TIME", "display_datetime", display_datetime},
    {"ui_set_alarm_confirm", "TIMEOUT", "display_datetime", display_datetime},

    {"*", "USER_ALARM", "ui_user_alarm", ui_user_alarm},
    {"ui_user_alarm", "PRESS_ANY", "display_datetime", ui_user_alarm_ack}
}

-- Create FSM
--fsm_main = fsm.new(main_transition_table)
fsm_main = require("fsm").new(main_transition_table)
