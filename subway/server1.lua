local component = require("component")
local event = require("event")
local term = require("term")
local redstone = component.redstone

local shouldQuit = false

local inputSandyPlazaCart = 4
local inputHomeStationCart = 2
local outputSandyPlazaStoplight = 3
local outputHomeStationStoplight = 5

local timerSandyPlazaStoplight = -1
local timerHomeStationStoplight = -1

function rsChanged(address, side, oldValue, newValue, color)
    print("rsChanged Event!")
    if (side == inputSandyPlazaCart) and (newValue > 0) then
        AlertSandyPlazaCart()
    elseif (side == inputHomeStationCart) and (newValue > 0) then
        AlertHomeStationCart()
    end
end

function AlertSandyPlazaCart()
    if timerHomeStationStoplight == -1 then
        TurnOnHomeStationStopLight()
    end
end

function AlertHomeStationCart()
    if timerSandyPlazaStoplight == -1 then
        TurnOnSandyPlazaStopLight()
    end
end

function GetSandyPlazaCartActivity()
    return redstone.getInput(inputSandyPlazaCart) > 0
end

function GetHomeStationCartActivity()
    return redstone.getInput(inputHomeStationCart) > 0
end

function TurnOnHomeStationStopLight()
    print("TurnOnHomeStationStopLight")
    redstone.setOutput(outputHomeStationStoplight, 255)
    event.timer(30, TurnOffHomeStationStopLight)
end

function TurnOffHomeStationStopLight()
    print("TurnOffHomeStationStopLight")
    redstone.setOutput(outputHomeStationStoplight, 0)
    timer = -1
end

function TurnOnSandyPlazaStopLight()
    print("TurnOnSandyPlazaStopLight")
    redstone.setOutput(outputSandyPlazaStoplight, 255)
    event.timer(30, TurnOffSandyPlazaStopLight)
end

function TurnOffSandyPlazaStopLight()
    print("TurnOffSandyPlazaStopLight")
    redstone.setOutput(outputSandyPlazaStoplight, 0)
    timer = -1
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

    while not shouldQuit do
        os.sleep(5)
    end

    print("Quit")
end

Setup()
MainLoop()
