local function vapeGithubRequest(scripturl)
	if not isfile("vape/"..scripturl) then
		local suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/Subbico/Subbico/"..readfile("vape/commithash.txt").."/"..scripturl, true) end)
		if not suc or res == "404: Not Found" then return nil end
		if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
		writefile("vape/"..scripturl, res)
	end
	return readfile("vape/"..scripturl)
end

shared.CustomSaveVape = 292439477
if pcall(function() readfile("vape/CustomModules/292439477.lua") end) then
	loadstring(readfile("vape/CustomModules/292439477.lua"))()
else
	local publicrepo = vapeGithubRequest("CustomModules/292439477.lua")
	if publicrepo then
		loadstring(publicrepo)()
	end
end