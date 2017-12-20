local shell = require("shell")
local component = require("component")
local modem = component.modem

local elevatorAddress = "ccdd7295-2905-4a41-846b01f622b339d4f"

function GoKitchen()
    modem.send(elevatorAddress, 33, "kitchen")
end

function GoGroundfloor()
    modem.send(elevatorAddress, 33, "groundfloor")
end

function GoDiningroom()
    modem.send(elevatorAddress, 33, "diningroom")
end


local args, options = shell.parse(...)

if args[1] == "kitchen" then
    GoKitchen()
elseif args[1] == "groundfloor" then
    GoGroundfloor()
elseif args[1] == "diningroom" then
    GoDiningroom()
else
    print("Usage: elev kitchen/groundfloor/diningroom")
end
