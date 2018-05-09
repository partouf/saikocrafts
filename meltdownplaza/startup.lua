
local wget = loadfile("/bin/wget.lua")

function DownloadFile(url, path)
    return wget("-fq",url,path)
end

function Update()
    local url = "https://raw.githubusercontent.com/partouf/saikocrafts/master/meltdownplaza/controlcenter.lua"
    DownloadFile(url, "/usr/meltdownplaza/controlcenter.lua")
end

function OnStartup()
    Update()

    dofile("/usr/meltdownplaza/controlcenter.lua")
end

OnStartup()
