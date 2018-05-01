
local wget = loadfile("/bin/wget.lua")

function DownloadFile(url, path)
    return wget("-fq",url,path)
end

function Update()
    local url = "https://raw.githubusercontent.com/partouf/saikocrafts/master/meltdownplaza/reactor.lua"
    DownloadFile(url, "/usr/meltdownplaza/reactor.lua")
end

function OnStartup()
    Update()

    dofile("/usr/meltdownplaza/reactor.lua")
end

OnStartup()
