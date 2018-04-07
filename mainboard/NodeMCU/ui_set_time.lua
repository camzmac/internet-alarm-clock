local ui_set_time = {}


function ui_set_time.changedigit(current_digit)
    write_7seg(0x11, 0x22) write_7seg(0x10, 0x22) --Set low background intensity
    if current_digit == 1 then
    write_7seg(0x11, 0xF2)
    elseif current_digit == 2 then
    write_7seg(0x11,0x2F)
    elseif current_digit == 3 then
    write_7seg(0x10, 0xF2)
    elseif current_digit == 4 then
    write_7seg(0x10, 0x2F)
    end
end
function ui_set_time.start(current_state)
    lcd_writecmd(0x0C) --cursor off
    lcd_clear()
    lcd_write_centre(1,"^Done^")
    --write_7seg(0x0C, 0x80) --Temporarily blank display
    write_7seg(0x09, 0x0F) --Enable digit decoding
    --Display 0:00 with rightmost digit brightened to indicate selection
    write_7seg(0x01, set_hour/10)
    write_7seg(0x02, set_hour%10 + 0x80)
    write_7seg(0x03, set_minute/10 + 0x80)
    write_7seg(0x04, set_minute%10)
    ui_set_time.changedigit(current_digit)
    --write_7seg(0x0C, 0x81) --Re-enable display

    fsm_main:add({{current_state, "PRESS_UP", current_state, function() require("ui_set_time").up() end },
    {current_state, "PRESS_DOWN", current_state, function() require("ui_set_time").down() end },
    {current_state, "PRESS_LEFT", current_state, function() require("ui_set_time").left() end },
    {current_state, "PRESS_RIGHT", current_state, function() require("ui_set_time").right() end }})
    
end
function ui_set_time.left()
    if current_digit < 4 and current_digit >= 1 then
        current_digit = current_digit + 1
    end
    ui_set_time.changedigit(current_digit)
end
function ui_set_time.right()
    if current_digit <= 4 and current_digit > 1 then
        current_digit = current_digit - 1
    end
    ui_set_time.changedigit(current_digit)
end
function ui_set_time.up()
    if current_digit == 1 or current_digit == 2 then
        if current_digit == 1 then
            set_minute = set_minute + 1
            if set_minute >= 60 then set_minute=0 end
        end
        if current_digit == 2 then
            set_minute = set_minute + 10
            if set_minute >= 60 then set_minute=set_minute-60 end
        end
        write_7seg(0x04, set_minute % 10)
        write_7seg(0x03, set_minute / 10 + 0x80)
    elseif current_digit == 3 or current_digit == 4 then
        if current_digit == 3 then
            set_hour = set_hour + 1
            if set_hour >= 24 then set_hour = 0 end
        end
        if current_digit == 4 and set_hour <= 13 then
            set_hour = set_hour + 10
        end
        write_7seg(0x02, set_hour % 10 + 0x80)
        write_7seg(0x01, set_hour / 10)
    end
end
function ui_set_time.down()
    if current_digit == 1 or current_digit == 2 then
        if current_digit == 1 then
            set_minute = set_minute - 1
            if set_minute < 0 then set_minute = 59 end
        end
        if current_digit == 2 then
            set_minute = set_minute - 10
            if set_minute < 0 then set_minute = set_minute+60 end
        end
        write_7seg(0x04, set_minute % 10)
        write_7seg(0x03, set_minute / 10 + 0x80)
    elseif current_digit == 3 or current_digit == 4 then
        if current_digit == 3 then
            set_hour = set_hour - 1
            if set_hour < 0 then set_hour = 23 end
        end
        if current_digit == 4 and set_hour >= 10 then
            set_hour = set_hour - 10
        end
        write_7seg(0x02, set_hour % 10 + 0x80)
        write_7seg(0x01, set_hour / 10)
    end
end

return ui_set_time
