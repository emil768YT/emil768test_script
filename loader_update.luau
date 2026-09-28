local key = getgenv().HIDE_LAT_KEY or ""
local hwid = (gethwid and gethwid()) or "unknown"
local url = "https://hide.lat/v1/load/670298c8-c4e7-4baa-a1f7-47e3b14e630b"
local send = request or http_request or (syn and syn.request)
if not send then error("A header-capable HTTP request function is required") end
local result = send({Url=url, Method="GET", Headers={ ["X-Hide-Key"]=key, ["X-HWID"]=hwid }})
if not result or not result.Body or (result.StatusCode and (result.StatusCode < 200 or result.StatusCode >= 300)) then error("hide.lat authorization failed: " .. tostring(result and result.StatusCode)) end
local chunk, err = loadstring(result.Body)
if not chunk then error(err) end
return chunk()
