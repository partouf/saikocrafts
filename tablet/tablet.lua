
local wget = loadfile("/bin/wget.lua")

function DownloadFile(url, path)
    return wget("-fq",url,path)
end

function UpdateTablet()
    local url = "https://raw.githubusercontent.com/partouf/saikocrafts/master/tablet/elev.lua"
    DownloadFile(url, "/home/elev.lua")
end

UpdateTablet()
