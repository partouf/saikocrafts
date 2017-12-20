local component = require("component")
local modem = component.modem

function Go()
    modem.broadcast(33, "kitchen")
end

Go()
