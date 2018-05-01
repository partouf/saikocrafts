local component = require("component")
local event = require("event")
local redstone = component.redstone
local term = require("term")

local shouldQuit = false

function rsChanged(eventname, address, side, oldValue, newValue, color)
    print("rsChanged Event!")
    if (side == 1) and (newValue > 0) then
        TurnReactorOff()
    elseif (side == 1) and (newValue == 0) then
        TurnReactorOn()
    end
end

function IsCool()
    local val = redstone.getInput(1)
    print("Reactor heat status is " .. val)
    return (redstone.getInput(1) == 0)
end

function IsReactorOff()
    return (redstone.getInput(4) == 0)
end

function TurnReactorOn()
    print("Turning the reactor ON")
    return redstone.setInput(4, 15)
end

function TurnReactorOff()
    print("Turning the reactor OFF")
    return redstone.setInput(4, 0)
end

function Setup()
    term.clear()

    print("Setup")
    if event.listen("redstone_changed", rsChanged) == false then
        print("Error registering event");
    end
end

function MainLoop()
    print("Listening")

    if IsCool() then
        if IsReactorOff() then
            TurnReactorOn()
        end
    else
        TurnReactorOff()
    end

    while not shouldQuit do
        os.sleep(5)
    end

    print("Quit")
end

Setup()
MainLoop()
