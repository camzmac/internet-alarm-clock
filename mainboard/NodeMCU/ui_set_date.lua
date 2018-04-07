local ui_set_date = {}

function ui_set_date.is_leap_year(year)
    if year%4==0 then
        if year%100==0 then
            if year%400==0 then
                return true
            else
                return false
            end
        else
            return true
        end
    else
        return false
    end
end

function ui_set_date.num_days_in_month(month,year)
--Thirty days hath september, april, june, and november
    if month==9 or month==4 or month==6 or month==11 then
        return 30
    end
    if month~=2 then
        return 31
    end
    --Otherwise for february, determine if it's a leap year
    if ui_set_date.is_leap_year(year) then
        return 29
    else
        return 28
    end
end


function ui_set_date.changedigit()
    if current_datedigit>=1 and current_datedigit<=4 then
        lcd_seek(2,current_datedigit+5)
    elseif current_datedigit==5 or current_datedigit==6 then
        lcd_seek(2,current_datedigit+1+5)
    elseif current_datedigit==7 or current_datedigit==8 then
        lcd_seek(2,current_datedigit+2+5)
    end
end
function ui_set_date.start()
    --Clear 7 seg
    write_7seg(0x01,0) write_7seg(0x02,0) write_7seg(0x03,0) write_7seg(0x04,0)
    lcd_clear()
    lcd_write_centre(1,"^Done^")
    lcd_seek(2,6)
    lcd_write(string.format("%04d/%02d/%02d",set_year,set_month,set_day))
    ui_set_date.changedigit()
    lcd_writecmd(0x0E) --cursor on
    
        fsm_main:add({{"ui_set_date", "PRESS_LEFT", "ui_set_date", function() require("ui_set_date").left() end },
        {"ui_set_date", "PRESS_RIGHT", "ui_set_date", function() require("ui_set_date").right() end},
        {"ui_set_date", "PRESS_UP", "ui_set_date", function() require("ui_set_date").up() end},
        {"ui_set_date", "PRESS_DOWN", "ui_set_date", function() require("ui_set_date").down() end},
        {"ui_set_date", "PRESS_TIME", "ui_set_time", function() require("ui_set_date").set_time() end }
        })
end
function ui_set_date.left()
    if current_datedigit>3 then
        current_datedigit=current_datedigit-1
    end
    ui_set_date.changedigit()
end
function ui_set_date.right()
    if current_datedigit<8 then
        current_datedigit=current_datedigit+1
    end
    ui_set_date.changedigit()
end
function ui_set_date.up()
    lcd_writecmd(0x0C) --cursor off
    if current_datedigit==3 or current_datedigit==4 then
        if current_datedigit==3 then
            set_year=set_year+10
            if set_year>2038 then set_year=set_year-10 end
        elseif current_datedigit==4 then
            set_year=set_year+1
            if set_year>2038 then set_year=set_year-1 end
        end
        lcd_seek(2,3+5)
        lcd_write(string.format("%02d",set_year-2000))
    elseif current_datedigit==5 or current_datedigit==6 then
        if current_datedigit==5 then
            set_month=set_month+10
            if set_month>12 then set_month=set_month-10 end
        elseif current_datedigit==6 then
            set_month=set_month+1
            if set_month>12 then set_month=1 end
        end
        lcd_seek(2,6+5)
        lcd_write(string.format("%02d",set_month))
    elseif current_datedigit==7 or current_datedigit==8 then
        if current_datedigit==7 then
            set_day=set_day+10
            if set_day>ui_set_date.num_days_in_month(set_month,set_year) then set_day=set_day-10 end
        elseif current_datedigit==8 then
            set_day=set_day+1
            if set_day>ui_set_date.num_days_in_month(set_month,set_year) then set_day=1 end
        end
        lcd_seek(2,9+5)
        lcd_write(string.format("%02d",set_day))
    end
    ui_set_date.changedigit()
    lcd_writecmd(0x0E) --cursor on
end
function ui_set_date.down()
    lcd_writecmd(0x0C) --cursor off
    if current_datedigit==3 or current_datedigit==4 then
        if current_datedigit==3 then
            set_year=set_year-10
            if set_year<2000 then set_year=set_year+10 end
        elseif current_datedigit==4 then
            set_year=set_year-1
            if set_year<2000 then set_year=set_year+1 end
        end
        lcd_seek(2,3+5)
        lcd_write(string.format("%02d",set_year-2000))
    elseif current_datedigit==5 or current_datedigit==6 then
        if current_datedigit==5 then
            set_month=set_month-10
            if set_month<1 then set_month=set_month+10 end
        elseif current_datedigit==6 then
            set_month=set_month-1
            if set_month<1 then set_month=12 end
        end
        lcd_seek(2,6+5)
        lcd_write(string.format("%02d",set_month))
    elseif current_datedigit==7 or current_datedigit==8 then
        if current_datedigit==7 then
            set_day=set_day-10
            if set_day<1 then set_day=set_day+10 end
        elseif current_datedigit==8 then
            set_day=set_day-1
            if set_day<1 then set_day=ui_set_date.num_days_in_month(set_month,set_year) end
        end
        lcd_seek(2,9+5)
        lcd_write(string.format("%02d",set_day))
    end
    ui_set_date.changedigit()
    lcd_writecmd(0x0E) --cursor on
end

function ui_set_date.set_time()
ui_set_time_start()
lcd_write_centre(2,"Set clock time below")
end

function ui_set_date.get_selected_unix_time(set_hour,set_minute)
    local unix_time_to_last_midnight=0
    for year=1970,(set_year-1) do
        if ui_set_date.is_leap_year(year) then
            unix_time_to_last_midnight = unix_time_to_last_midnight + 366*24*60*60
        else
            unix_time_to_last_midnight = unix_time_to_last_midnight + 365*24*60*60
        end
    end
    if set_month>1 then
        for month=1,(set_month-1) do
            unix_time_to_last_midnight = unix_time_to_last_midnight + ui_set_date.num_days_in_month(month,set_year)*24*60*60
        end
    end
    if set_day>1 then
        if set_day > ui_set_date.num_days_in_month(set_month,set_year) then
            set_day = ui_set_date.num_days_in_month(set_month,set_year)
            end
        for day=1,(set_day-1) do
            unix_time_to_last_midnight = unix_time_to_last_midnight + 24*60*60
        end
    end
    return unix_time_to_last_midnight + (set_hour - timezone_adjustment)*60*60 + set_minute*60
end

return ui_set_date
