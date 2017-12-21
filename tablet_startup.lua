
local wget = loadfile("/bin/wget.lua")

function DownloadFile(url, path)
    return wget("-fq",url,path)
end

function UpdateTablet()
    local url = "https://raw.githubusercontent.com/partouf/saikocrafts/master/tablet/tablet.lua"
    DownloadFile(url, "/usr/tablet/tablet.lua")
end

function OnStartup()
    UpdateTablet()

    dofile("/usr/tablet/tablet.lua")
end

OnStartup()
