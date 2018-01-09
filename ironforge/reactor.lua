local component = require("component")
local event = require("event")
local redstone = component.redstone
local reactor = component.br_reactor

local shouldQuit = false


-- key_up(keyboardAddress: string, char: number, code: number, playerName: string)
function OnKeyUp(eventName, keyboardAddress, char, code, playerName)
    shouldQuit = true
end

function GetCapacitySignal()
    return redstone.getInput(1)
end

function IsCapacityLow()
    return GetCapacitySignal() > 0
end

function IsReactorOn()
    return reactor.getActive()
end

function EnableReactor()
    local capsig = GetCapacitySignal()
    print("Current signal from energy monitor: ", capsig)

    print("Activating Reactory")
    reactor.setActive(true)
    redstone.setOutput(4, 255)
end

function DisableReactor()
    local capsig = GetCapacitySignal()
    print("Current signal from energy monitor: ", capsig)

    print("Deactivating Reactory")
    reactor.setActive(false)
    redstone.setOutput(4, 0)
end

function Setup()
    event.listen("key_up", OnKeyUp)
end

function MainLoop()
    print("Listening")

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
