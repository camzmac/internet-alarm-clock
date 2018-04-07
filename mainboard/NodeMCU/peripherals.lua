--Peripheral interface functions

function write_7seg(cmd,val)
i2c.start(0)
i2c.address(0,0x00,i2c.TRANSMITTER)
i2c.write(0,cmd)
i2c.write(0,val)
i2c.stop(0)
end

function initialize_7seg()
write_7seg(0x0C, 0x01) --Normal operation, reset feature register to default settings
write_7seg(0x0A, 0x0A) --set brightness
write_7seg(0x0B, 0x06) --set scan limit register
write_7seg(0x09, 0x00) --disable digit decoding
--Blank screen
write_7seg(0x01, 0x00)
write_7seg(0x02, 0x00)
write_7seg(0x03, 0x00)
write_7seg(0x04, 0x00)
end

function lcd_init()
i2c.start(0)
--Note that 0x78 address in datasheet needs to be rightshifted to work with this API, hence 0x3C given as address
i2c.address(0,0x3C,i2c.TRANSMITTER)
i2c.write(0,0x00)
i2c.write(0,0x38)
i2c.write(0,0x39)
i2c.write(0,0x14)
i2c.write(0,0x7F)
i2c.write(0,0x5D)
i2c.write(0,0x6D)
i2c.write(0,0x0C)
i2c.write(0,0x01)
i2c.write(0,0x06)
i2c.stop(0)
end

--row = 1 is first row; =2 is second row
--col = 1 is first col, etc.
function lcd_seek(row,col)
i2c.start(0)
i2c.address(0,0x3C,i2c.TRANSMITTER)
i2c.write(0,0x80)
if row == 1 then
    i2c.write(0, 0x80 + col - 1)
elseif row == 2 then
    i2c.write(0, 0xC0 + col - 1)
end
i2c.stop(0)
end

function lcd_write(str)
i2c.start(0)
i2c.address(0,0x3C,i2c.TRANSMITTER)
i2c.write(0,0x40)
for i = 1, #str do
    i2c.write(0, str:sub(i,i))
end
i2c.stop(0)
end

function lcd_write_centre(row,str)
local col = 10 - (str:len() - 1) / 2
if col < 1 then col=1 end
lcd_seek(row,col)
lcd_write(str)
end

function lcd_clear()
i2c.start(0)
i2c.address(0,0x3C,i2c.TRANSMITTER)
i2c.write(0,0x80)
i2c.write(0,0x01)
i2c.stop(0)
end

function lcd_writecmd(cmd)
i2c.start(0)
i2c.address(0,0x3C,i2c.TRANSMITTER)
i2c.write(0,0x80)
i2c.write(0,cmd)
i2c.stop(0)
end

function lcd_backlight_r(state)
    if state >= 1 then write_7seg(0x05,0x40) else write_7seg(0x05,0x00) end
end
function lcd_backlight_g(state)
    if state >= 1 then write_7seg(0x06,0x40) else write_7seg(0x06,0x00) end
end
function lcd_backlight_b(state)
    if state >= 1 then write_7seg(0x07,0x40) else write_7seg(0x07,0x00) end
end

backlight_tmr = tmr.create()
backlight_tmr:register(5000, tmr.ALARM_SEMI, function() lcd_backlight_rgb(0,0,0) end)
backlight_tmr:stop()

function lcd_backlight_rgb(r,g,b) --r, g, b set brightness. Max 15, min 0 (off)
    backlight_tmr:stop()
    write_7seg(0x12, g*16 + r)
    write_7seg(0x13,b)
    lcd_backlight_r(r) lcd_backlight_g(g) lcd_backlight_b(b)
end

function lcd_backlight_timedoff(r,g,b)
    lcd_backlight_rgb(r,g,b)
    backlight_tmr:start()
    backlight_tmr:interval(5000)
end



gpio.mode(7, gpio.INPUT, gpio.FLOAT)
i2c.setup(0, 1, 2, i2c.SLOW)
gpio.mode(7, gpio.INT, gpio.FLOAT)

initialize_7seg()
lcd_init()
require("custom_chars").load()
package.loaded["custom_chars"]=nil

lcd_backlight_rgb(15,15,15)
