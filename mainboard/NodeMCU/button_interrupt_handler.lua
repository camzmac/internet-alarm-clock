--Button interrupt handling code

--Store last state of buttons
--1 = currently open (not pressed); 0 = currently closed (pressed down)
btn_TIME=1
btn_WEATHER=1
btn_TRANSIT=1
btn_UP=1
btn_DOWN=1
btn_LEFT=1
btn_RIGHT=1
state_KEYA = 255
state_KEYB = 255

function process_button_interrupt()
--Sate of scanning matrix, which includes the buttons, has changed,
--so read in the updated state.
i2c.start(0)
i2c.address(0,0x00,i2c.TRANSMITTER)
i2c.write(0,0x1C) --KEYA register
i2c.stop(0)
i2c.start(0)
i2c.address(0,0x00,i2c.RECEIVER)
btn_str = i2c.read(0, 2) --Read in KEYA and KEYB registers
i2c.stop(0)

local oldstate_KEYA = state_KEYA
local oldstate_KEYB = state_KEYB
state_KEYA = string.byte(btn_str,1) --KEYA contains time, weather, transit buttons
state_KEYB = string.byte(btn_str,2) --KEYB contains directional buttons
local nonshift_state_KEYA = state_KEYA
local nonshift_state_KEYB = state_KEYB

state_KEYA = math.floor(state_KEYA/2) --Right bit shift 4x
state_KEYA = math.floor(state_KEYA/2)
state_KEYA = math.floor(state_KEYA/2)
state_KEYA = math.floor(state_KEYA/2)
transition_retval=nil
if btn_TRANSIT == 1 and state_KEYA % 2 == 0 then print("TRANSIT") transition_retval=fsm_main:fire("PRESS_TRANSIT") end
btn_TRANSIT = state_KEYA % 2
state_KEYA = math.floor(state_KEYA/2)
if btn_TIME == 1 and state_KEYA % 2 == 0 then print("TIME") transition_retval=fsm_main:fire("PRESS_TIME") end
btn_TIME = state_KEYA % 2
state_KEYA = math.floor(state_KEYA/2)
if btn_WEATHER == 1 and state_KEYA % 2 == 0 then print("WEATHER") transition_retval=fsm_main:fire("PRESS_WEATHER") end
btn_WEATHER = state_KEYA % 2

state_KEYB = math.floor(state_KEYB/2) --Right bit shift 3x
state_KEYB = math.floor(state_KEYB/2)
state_KEYB = math.floor(state_KEYB/2)
if btn_RIGHT == 1 and state_KEYB % 2 == 0 then print("RIGHT") transition_retval=fsm_main:fire("PRESS_RIGHT") end
btn_RIGHT = state_KEYB % 2
state_KEYB = math.floor(state_KEYB/2)
if btn_DOWN == 1 and state_KEYB % 2 == 0 then print("DOWN") transition_retval=fsm_main:fire("PRESS_DOWN") end
btn_DOWN = state_KEYB % 2
state_KEYB = math.floor(state_KEYB/2)
if btn_UP == 1 and state_KEYB % 2 == 0 then print("UP") transition_retval=fsm_main:fire("PRESS_UP") end
btn_UP = state_KEYB % 2
state_KEYB = math.floor(state_KEYB/2)
if btn_LEFT == 1 and state_KEYB % 2 == 0 then print("LEFT") transition_retval=fsm_main:fire("PRESS_LEFT") end
btn_LEFT = state_KEYB % 2

if oldstate_KEYA ~= nonshift_state_KEYA or oldstate_KEYB ~= nonshift_state_KEYB then fsm_main:fire("PRESS_ANY") end

end

gpio.trig(7, "low", function() process_button_interrupt() end)

