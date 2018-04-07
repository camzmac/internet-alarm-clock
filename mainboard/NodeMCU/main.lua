wifi.sta.autoconnect(0)

node.egc.setmode(node.egc.ALWAYS)

timezone_adjustment = -4

dofile("peripherals.lc")


--High level display update functions
--These do not handle states whatsover

alarm_enabled = false
last_minute = -1
last_day = -1
function update_time(force)

    -- To do: add DST adjustment code
    --temp_time = rtctime.get() - 60*60*5
    local temp_time = rtctime.get() + 60*60*timezone_adjustment
    local current_time = rtctime.epoch2cal(temp_time)

    local days_of_week={"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
    local months_of_year={"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"}
    
    if force==true or last_day ~= current_time["day"] then
        lcd_clear()
        lcd_write_centre(2,days_of_week[current_time["wday"]].." "..months_of_year[current_time["mon"]].." "..current_time["day"])
        last_day = current_time["day"]
    end
    
    if force==true or last_minute ~= current_time["min"] then
        --Re-send digit decoding enable command in case register becomes corrupted
        write_7seg(0x09, 0x0F)
    
        if current_time["hour"] < 10 then
            write_7seg(0x01, 0xFF); --blank first digit
        else
            write_7seg(0x01, current_time["hour"]/10)
        end
        write_7seg(0x02, current_time["hour"]%10 + 0x80) --enable :
        write_7seg(0x03, current_time["min"]/10 + 0x80) --enable :
        write_7seg(0x04, current_time["min"]%10)
    
        last_minute = current_time["min"];
    
        --Adjust display brightness based on time of day
        if current_time["hour"] > 7 and current_time["hour"] < 22 then
        write_7seg(0x10,0xFF) write_7seg(0x11,0xFF) --Max brightness
        else
        write_7seg(0x10,0x22) write_7seg(0x11,0x22) --Min brightness
        end

        --Fire the alarm if enabled and it's time to wake the user up
        if alarm_enabled == true and alarm_hour == current_time["hour"] and alarm_minute == current_time["min"] then
            fsm_main:fire("USER_ALARM")
            alarm_enabled=false
        end

        --Write icon indicating whether alarm is set
        if alarm_enabled == true then
            --Consider writing the time the alarm was set to. but would need to clear lcd prior
            lcd_write_centre(1,"\0\2")
        elseif alarm_enabled == false then
            if fsm_main:get() == "ui_user_alarm" then
                lcd_write_centre(1,"\0\1")
            else
                lcd_write_centre(1,"\0x")
            end
        end

        --Write icon indicating connection status
        lcd_seek(1,20)
        if wifi.sta.status() == wifi.STA_GOTIP then
            lcd_write("\3")
        else
            lcd_write("\4")
        end
    
    end

end

function display_connecting()
    local def_sta_config=wifi.sta.getconfig(true)
    lcd_clear()
    lcd_write_centre(1,"Connecting to")
    lcd_write_centre(2,def_sta_config.ssid)
    write_7seg(0x01, 0x4E) --C
    write_7seg(0x02, 0x1D) --o
    write_7seg(0x03, 0x15) --n
    write_7seg(0x04, 0x15) --n
end

function ui_cant_connect_options()
    wifi.sta.autoconnect(0)
    lcd_clear() lcd_write("Set")
    lcd_seek(1,10) lcd_write("Set")
    lcd_seek(1,18) lcd_write("Re-")
    lcd_seek(2,1)
    lcd_write("AP    Date&Time  Try")
    write_7seg(0x01, 0x00)
    write_7seg(0x02, 0x00)
    write_7seg(0x03, 0x00)
    write_7seg(0x04, 0x00)
end

function wifi_reconnect()
wifi.sta.autoconnect(1)
wifi.sta.connect()
end

function ui_conn_config()
    lcd_clear()
    write_7seg(0x01, 0x00)
    write_7seg(0x02, 0x00)
    write_7seg(0x03, 0x00)
    write_7seg(0x04, 0x00)
    
end

conn_err_reason = 0
function ui_conn_err()
    lcd_clear()
    lcd_write_centre(1,"Connection error")
    lcd_write_centre(2,conn_err_reason)
    write_7seg(0x01, 0x4F) --E
    write_7seg(0x02, 0x05) --r
    write_7seg(0x03, 0x05) --r
    write_7seg(0x04, 0x00)
    --This should display particular error to user using switch statement
    --but same button press will advance to ui_conn_config state
end
 
function ui_timesync_err()
    write_7seg(0x01, 0x4F) --E
    write_7seg(0x02, 0x05) --r
    write_7seg(0x03, 0x05) --r
    write_7seg(0x04, 0x00)
end


function ui_set_date_start()
	current_datedigit=4 --Ranges from 3 to 8, LtoR: YYMMDD
	set_year=2017
	set_month=01
	set_day=01
	
	require("ui_set_date").start()
end


function ui_set_time_start()
    current_digit=1 --Rightmost minute digit is 1; leftmost hour digit is 4
    set_minute=0
    set_hour=0

    package.loaded["ui_set_date"]=nil
    
    require("ui_set_time").start(fsm_main:get())
end

function set_selected_datetime()
    rtctime.set(require("ui_set_date").get_selected_unix_time(set_hour,set_minute),0)
    display_datetime()

    package.loaded["ui_set_time"]=nil
end


datetime_updater = tmr.create()
datetime_updater:register(1000, tmr.ALARM_AUTO, function() update_time(false) end)

function display_datetime()
    lcd_backlight_timedoff(15,0,0)
    update_time(true)
    datetime_updater:start()
end

function sync_time()
    lcd_clear()
    lcd_write_centre(1,"Connected!")
    lcd_write_centre(2,"Synchronizing...")
    -- "--:--"
    write_7seg(0x01, 0x01) write_7seg(0x02, 0x81) write_7seg(0x03, 0x81) write_7seg(0x04, 0x01)

    sntp.sync(nil,
      function(sec, usec, server, info) fsm_main:fire("TIMESYNC_SUCCESS") end,
      function(errorcode, info) fsm_main:fire("TIMESYNC_ERR") end    )
end

alarm_minute=0
alarm_hour=0
function ui_set_alarm()
    datetime_updater:stop()
    --Load last set alarm time and days for user to adjust
    current_digit=1
    set_minute=alarm_minute
    set_hour=alarm_hour
    require("ui_set_time").start(fsm_main:get())
    
    lcd_backlight_rgb(15,0,0)
    lcd_write_centre(2,"Set alarm")
end

function ui_set_alarm_confirm()
    alarm_hour=set_hour
    alarm_minute=set_minute
    alarm_enabled=true
    
    lcd_clear()
    lcd_write_centre(1,"^Continue^")
    lcd_write_centre(2,"Alarm now set for:")
    
    if alarm_hour<10 then write_7seg(0x01,0x0F) end
    write_7seg(0x0A,0xFF)

    --Consider making a general timeout timer that can be disabled when appropriate button is pressed
    tmr.create():alarm(5000, tmr.ALARM_SINGLE, function() fsm_main:fire("TIMEOUT") end)

    package.loaded["ui_set_time"]=nil
end


last_r=15
last_g=0
last_b=0
function colorwheel_update()
    lcd_backlight_rgb(last_r,last_g,last_b)

    if last_r == 15 and last_g < 15 and last_b == 0 then
        last_g = last_g+1
    elseif last_r > 0 and last_g == 15 and last_b == 0 then
        last_r = last_r-1
    elseif last_r == 0 and last_g == 15 and last_b < 15 then
        last_b = last_b+1
    elseif last_r == 0 and last_g > 0 and last_b == 15 then
        last_g = last_g-1
    elseif last_r < 15 and last_g == 0 and last_b == 15 then
        last_r = last_r+1
    elseif last_r == 15 and last_g == 0 and last_b > 0 then
        last_b = last_b-1
    end    
end

colorwheel_tmr = tmr.create()
colorwheel_tmr:register(75, tmr.ALARM_AUTO, function() colorwheel_update() end)

function ui_user_alarm()
    colorwheel_tmr:start()
end

function ui_user_alarm_ack()
    colorwheel_tmr:stop()
    display_datetime()
end


--Load fsm.lua library
--fsm = require "fsm"
dofile("state_transition_table.lc")

wifi.sta.eventMonReg(wifi.STA_CONNECTING, function() fsm_main:fire("BEGIN_CONNECTING") end)
wifi.sta.eventMonReg(wifi.STA_WRONGPWD, function() conn_err_reason = "Wrong password" fsm_main:fire("CONN_ERR") end)
wifi.sta.eventMonReg(wifi.STA_APNOTFOUND, function() conn_err_reason = "AP not found" fsm_main:fire("CONN_ERR") end)
wifi.sta.eventMonReg(wifi.STA_GOTIP, function() fsm_main:fire("CONN_SUCCESS") end)

--Start Wi-Fi event monitor to enable above defined functions to be called upon state change
wifi.sta.eventMonStart()

wifi.sta.connect()

dofile("button_interrupt_handler.lc")

