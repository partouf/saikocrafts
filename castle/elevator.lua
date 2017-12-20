local component = require("component")
local event = require("event")
local modem = component.modem

local shouldQuit = false

function Setup()
    event.listen("modem_message", OnReceiveMessage)
    modem.open(33)
end

function OnReceiveMessage(eventName, receiverAddress, senderAddress, port, distance, payload)
    print("Someone sent a message to us: " .. payload)
end

function MainLoop()
    print("Hello, World!\n")
    print("Modem address is: " .. modem.address .. "\n")
    while not shouldQuit do
        os.sleep(5)
    end
end


Setup()
MainLoop()
