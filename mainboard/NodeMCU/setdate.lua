current_datedigit=3 --Ranges from 1 to 8, LtoR: YYYYMMDD
set_year=2017
set_month=04
set_day=22
function ui_set_date_changedigit()
    if current_datedigit>=1 and current_datedigit<=4 then
        lcd_seek(2,current_datedigit)
    elseif current_datedigit==5 or current_datedigit==6 then
        lcd_seek(2,current_datedigit+1)
    elseif current_datedigit==7 or current_datedigit==8 then
        lcd_seek(2,current_datedigit+2)
    end
end
function ui_set_date()
    --Clear 7 seg
    write_7seg(0x01,0) write_7seg(0x02,0) write_7seg(0x03,0) write_7seg(0x04,0)
    lcd_clear()
    lcd_write("YYYY/MM/DD ^Done")
    lcd_seek(2,1)
    lcd_write(string.format("%04d/%02d/%02d",set_year,set_month,set_day))
    ui_set_date_changedigit()
    lcd_writecmd(0x0E) --cursor on
end
function ui_set_date_left()
    if current_datedigit>3 then
        current_datedigit=current_datedigit-1
    end
    ui_set_date_changedigit()
end
function ui_set_date_right()
    if current_datedigit<8 then
        current_datedigit=current_datedigit+1
    end
    ui_set_date_changedigit()
end
function ui_set_date_up()
    lcd_writecmd(0x0C) --cursor off
    if current_datedigit==3 or current_datedigit==4 then
        if current_datedigit==3 then
            set_year=set_year+10
            if set_year>2038 then set_year=set_year-10 end
        elseif current_datedigit==4 then
            set_year=set_year+1
            if set_year>2038 then set_year=set_year-1 end
        end
        lcd_seek(2,3)
        lcd_write(string.format("%02d",set_year-2000))
    elseif current_datedigit==5 or current_datedigit==6 then
        if current_datedigit==5 then
            set_month=set_month+10
            if set_month>12 then set_month=set_month-10 end
        elseif current_datedigit==6 then
            set_month=set_month+1
            if set_month>12 then set_month=1 end
        end
        lcd_seek(2,6)
        lcd_write(string.format("%02d",set_month))
    elseif current_datedigit==7 or current_datedigit==8 then
        if current_datedigit==7 then
            set_day=set_day+10
            if set_day>num_days_in_month(set_month,set_year) then set_day=set_day-10 end
        elseif current_datedigit==8 then
            set_day=set_day+1
            if set_day>num_days_in_month(set_month,set_year) then set_day=1 end
        end
        lcd_seek(2,9)
        lcd_write(string.format("%02d",set_day))
    end
    ui_set_date_changedigit()
    lcd_writecmd(0x0E) --cursor on
end
function ui_set_date_down()
    lcd_writecmd(0x0C) --cursor off
    if current_datedigit==3 or current_datedigit==4 then
        if current_datedigit==3 then
            set_year=set_year-10
            if set_year<2000 then set_year=set_year+10 end
        elseif current_datedigit==4 then
            set_year=set_year-1
            if set_year<2000 then set_year=set_year+1 end
        end
        lcd_seek(2,3)
        lcd_write(string.format("%02d",set_year-2000))
    elseif current_datedigit==5 or current_datedigit==6 then
        if current_datedigit==5 then
            set_month=set_month-10
            if set_month<1 then set_month=set_month+10 end
        elseif current_datedigit==6 then
            set_month=set_month-1
            if set_month<1 then set_month=12 end
        end
        lcd_seek(2,6)
        lcd_write(string.format("%02d",set_month))
    elseif current_datedigit==7 or current_datedigit==8 then
        if current_datedigit==7 then
            set_day=set_day-10
            if set_day<1 then set_day=set_day+10 end
        elseif current_datedigit==8 then
            set_day=set_day-1
            if set_day<1 then set_day=num_days_in_month(set_month,set_year) end
        end
        lcd_seek(2,9)
        lcd_write(string.format("%02d",set_day))
    end
    ui_set_date_changedigit()
    lcd_writecmd(0x0E) --cursor on
end

function destructor()
ui_set_date_changedigit=nil
ui_set_date=nil
ui_set_date_left=nil
ui_set_date_right=nil
ui_set_date_up=nil
ui_set_date_down=nil

current_datedigit=nil
set_year=nil
set_month=nil
set_day=nil
end