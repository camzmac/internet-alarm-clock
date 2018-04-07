custom_chars = {}

function custom_chars.load()

i2c.start(0)
i2c.address(0,0x3C,i2c.TRANSMITTER)
i2c.write(0,0x80) --control byte
i2c.write(0,0x38) -- IS[2:1] = [0,0]
i2c.write(0,0x80) --control byte
i2c.write(0,0x40) --Set CGRAM to zero position
i2c.write(0,0x40) --control byte

--"\0": Horn
i2c.write(0,0x01)
i2c.write(0,0x03)
i2c.write(0,0x07)
i2c.write(0,0x1F)
i2c.write(0,0x1F)
i2c.write(0,0x07)
i2c.write(0,0x03)
i2c.write(0,0x01)

--"\1": Sound waves
i2c.write(0,0x00)
i2c.write(0,0x04)
i2c.write(0,0x02)
i2c.write(0,0x11)
i2c.write(0,0x11)
i2c.write(0,0x02)
i2c.write(0,0x04)
i2c.write(0,0x00)

--"\2": Check mark
i2c.write(0,0x00)
i2c.write(0,0x00)
i2c.write(0,0x01)
i2c.write(0,0x02)
i2c.write(0,0x14)
i2c.write(0,0x08)
i2c.write(0,0x00)
i2c.write(0,0x00)

--"\3": Full wifi strength
i2c.write(0,0x00)
i2c.write(0,0x00)
i2c.write(0,0x01)
i2c.write(0,0x01)
i2c.write(0,0x05)
i2c.write(0,0x05)
i2c.write(0,0x15)
i2c.write(0,0x15)

--"\4": Wifi disconnected
i2c.write(0,0x11)
i2c.write(0,0x0A)
i2c.write(0,0x04)
i2c.write(0,0x0A)
i2c.write(0,0x11)
i2c.write(0,0x01)
i2c.write(0,0x05)
i2c.write(0,0x15)

i2c.stop(0)

end

return custom_chars