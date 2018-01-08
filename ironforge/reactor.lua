local component = require("component")
local event = require("event")
local modem = component.modem
local redstone = component.redstone
local reactor = component.br_reactor

local shouldQuit = false


-- key_up(keyboardAddress: string, char: number, code: number, playerName: string)
function OnKeyUp(eventName, keyboardAddress, char, code, playerName)
    shouldQuit = true
end

function IsCapacityLow()
    return redstone.getInput(1) > 0
end

function IsReactorOn()
    return reactor.getActive()
end

function EnableReactor()
    reactor.setActive(true)
end

function DisableReactor()
    reactor.setActive(false)
end

function Setup()
    event.listen("key_up", OnKeyUp)
end

function MainLoop()
    print("Listening\n")

    while not shouldQuit do
        if IsCapacityLow() then
            if not IsReactorOn() then
                EnableReactor()
            end
        else
            if IsReactorOn() then
                DisableReactor()
            end
        end

        os.sleep(5)
    end

    print("Quit")
end

Setup()
MainLoop()
