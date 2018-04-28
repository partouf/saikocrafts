
local wget = loadfile("/bin/wget.lua")

function DownloadFile(url, path)
    return wget("-fq",url,path)
end

function Update()
    local url = "https://raw.githubusercontent.com/partouf/saikocrafts/master/subway/server1.lua"
    DownloadFile(url, "/usr/subway/server1.lua")
end

function OnStartup()
    Update()

    dofile("/usr/subway/server1.lua")
end

OnStartup()
