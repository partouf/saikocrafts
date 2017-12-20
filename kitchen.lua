local component = require("component")
local modem = component.modem

local elevatorAddress = "ccdd7295-2905-4a41-846b01f622b339d4f"


function Go()
    modem.send(elevatorAddress, 33, "kitchen")
end

Go()
