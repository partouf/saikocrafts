local component = require("component")
local event = require("event")

local shouldQuit = false

-- address:string, relativeX:number, relativeY:number, relativeZ:number[, entityName:string]
function OnMotion(address, relativeX, relativeY, relativeZ, entityName)
    print("Motion detected\n");
    if (entityName) then
        print("It's " .. entityName .. "\n")
    end
end

function Setup()
    event.listen("motion", OnMotion)
end

function MainLoop()
    print("Listening\n");

    while not shouldQuit do
        os.sleep(5)
    end
end

Setup()
MainLoop()
