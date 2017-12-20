local component = require("component")
local rs = component.redstone
local event = require("event")
local modem = component.modem

local shouldQuit = false

function Setup()
    event.listen("modem_message", OnReceiveMessage)
    modem.open(33)
end

function ResetAllOutput()
    for side = 0,5,1 do
        rs.setOutput(side, 0)
    end
end

function SendInfo(address)
    modem.send(address, 77, "elevator=" .. modem.address)
end

function OnReceiveMessage(eventName, receiverAddress, senderAddress, port, distance, payload)
    print("Someone sent a message to us: " .. payload .. "\n")

    if payload == "info" then
        SendInfo(senderAddress)
    else
        ResetAllOutput()

        if payload == "elevator->kitchen" then
            rs.setOutput(0, 255)
        elseif payload == "elevator->groundfloor" then
            rs.setOutput(1, 255)
        elseif payload == "elevator->diningroom" then
            rs.setOutput(2, 255)
        end
    end
end

function MainLoop()
    print("Elevator program online\n\n")

    while not shouldQuit do
        os.sleep(5)
    end
end


Setup()
MainLoop()
