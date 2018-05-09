local component = require("component")
local event = require("event")
local redstone = component.redstone
local term = require("term")

local shouldQuit = false

local sideElectromagnets = 0
local sideFusionOutput = 2
local sideFusionKickstart = 3
local sideFusionFeedback = 4
local sideHome = 5

local isOnElectromagnets = false
local isOnFusionOutput = false
local isOnFusionKickstart = false
local isOnFusionFeedback = false
local isOnHome = false
 
function unknownEvent()
  -- do nothing if the event wasn't relevant
end
 
local myEventHandlers = setmetatable({}, { __index = function() return unknownEvent end })
 
function myEventHandlers.key_up(adress, char, code, playerName)
    print("Pressed:"..char)
    if (char == string.byte("1")) then
        ToggleElectromagnets()
    elseif (char == string.byte("2")) then
        ToggleFusionOutput()
    elseif (char == string.byte("3")) then
        ToggleFusionKickstart()
    elseif (char == string.byte("4")) then
        ToggleFusionFeedback()
    elseif (char == string.byte("5")) then
        ToggleHome()
    end
end
 
function handleEvent(eventID, ...)
    if (eventID) then
        myEventHandlers[eventID](...)
    end
end
 
function ToggleElectromagnets()
    if isOnElectromagnets then
        redstone.setOutput(sideElectromagnets, 0)
    else
        redstone.setOutput(sideElectromagnets, 255)
    end
end

function ToggleFusionOutput()
    if isOnFusionOutput then
        redstone.setOutput(sideFusionOutput, 0)
    else
        redstone.setOutput(sideFusionOutput, 255)
    end
end

function ToggleFusionKickstart()
    if isOnFusionKickstart then
        redstone.setOutput(sideFusionKickstart, 0)
    else
        redstone.setOutput(sideFusionKickstart, 255)
    end
end

function ToggleFusionFeedback()
    if isOnFusionFeedback then
        redstone.setOutput(sideFusionFeedback, 0)
    else
        redstone.setOutput(sideFusionFeedback, 255)
    end
end

function ToggleHome()
    if isOnHome then
        redstone.setOutput(sideHome, 0)
    else
        redstone.setOutput(sideHome, 255)
    end
end

function ShowMenu()
    term.clear()
    print("Hello, Menu")
    print("===============")
    print("")

    if isOnElectromagnets then
        print("<1>- Cut power to Electromagnets")
    else
        print(" 1 - Activate Electromagnets")
    end

    if isOnFusionOutput then
        print("<2>- Disable Fusion power output")
    else
        print(" 2 - Enable Fusion power output")
    end

    if isOnFusionKickstart then
        print("<3>- Disable Fusion kickstarter")
    else
        print(" 3 - Feed Fusion kickstarter")
    end

    if isOnFusionFeedback then
        print("<4>- Disable Fusion feedbackloop")
    else
        print(" 4 - Enable Fusion feeddbackloop")
    end
    
    if isOnHome then
        print("<5>- Cut power to Homebase")
    else
        print(" 5 - Power Homebase")
    end

    print("")
end

function Setup()

end

function MainLoop()
    while not shouldQuit do
        ShowMenu()        

        handleEvent(event.pull())
    end
end

Setup()
MainLoop()
