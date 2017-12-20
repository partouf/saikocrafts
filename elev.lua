local shell = require("shell")
local component = require("component")
local modem = component.modem
local event = require("event")

function GoKitchen()
    modem.broadcast(33, "elevator->kitchen")
end

function GoGroundfloor()
    modem.broadcast(33, "elevator->groundfloor")
end

function GoDiningroom()
    modem.broadcast(33, "elevator->diningroom")
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
