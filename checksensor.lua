local component = require("component")
local event = require("event")

local shouldQuit = false

-- address:string, relativeX:number, relativeY:number, relativeZ:number[, entityName:string]
function OnMotion(eventName, address, relativeX, relativeY, relativeZ, entityName)
    print("Motion detected\n");
    print("It's " .. address .. " @ " .. relativeX .. " x " .. relativeY .. " x " .. relativeZ .. " (" .. entityName .. ")\n")
end

-- key_up(keyboardAddress: string, char: number, code: number, playerName: string)
function OnKeyUp(eventName, keyboardAddress, char, code, playerName)
    if code == 46 then
        shouldQuit = true
    end
end

function Setup()
    event.listen("motion", OnMotion)
    event.listen("key_up", OnKeyUp)
end

function MainLoop()
    print("Listening\n");

    while not shouldQuit do
        os.sleep(5)
    end

    print("Quit");
end

Setup()
MainLoop()
