
local wget = loadfile("/bin/wget.lua")

function DownloadFile(url, path)
    return wget("-fq",url,path)
end

function UpdateIronforge()
    local url = "https://raw.githubusercontent.com/partouf/saikocrafts/master/ironforge/reactor.lua"
    DownloadFile(url, "/usr/ironforge/reactor.lua")
end

function OnStartup()
    UpdateIronforge()

    dofile("/usr/ironforge/reactor.lua")
end

OnStartup()
