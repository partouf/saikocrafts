local component = require("component")
local modem = component.modem
local event = require("event")

function Setup()
    modem.open(66)
    event.listen("modem_message", OnReceiveMessage)

    modem.broadcast(77, "Hello, world!")
end

function OnReceiveMessage(receiverAddress, senderAddress, port, distance, payload)
    print("Received data '" .. tostring(payload) .. "' from address " .. remoteAddress .. " on network card " .. localNetworkCard .. " on port " .. port .. ".")
    if distance > 0 then
        print("Message was sent from " .. distance .. " blocks away.")
    end
end

function MainLoop()
    print("Listening\n");

    while not shouldQuit do
        os.sleep(5)
    end
end

Setup()
MainLoop()
