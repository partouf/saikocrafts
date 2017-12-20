
local wget = loadfile("/bin/wget.lua")

function DownloadFile(url, path)
    return wget("-fq",url,path)
end

function UpdateCastle()
    local oppmLibUrl = "https://raw.githubusercontent.com/partouf/saikocrafts/master/castle/elevator.lua"
    DownloadFile(oppmLibUrl, "/usr/castle/elevator.lua")
end

function OnStartup()
    UpdateCastle()

    dofile("/usr/castle/elevator.lua")
end

OnStartup()
