-- Include everything
include("shared.lua")
 
MsgN("_-_-_-_- Flood Client Side -_-_-_-_")
MsgN("Loading Clientside Files")
for _, file in pairs(file.Find("cnflood/gamemode/client/*.lua", "LUA")) do
	MsgN("-> "..file)
	include("cnflood/gamemode/client/"..file)
end

MsgN("Loading Clientside VGUI Files")
for _, file in pairs(file.Find("cnflood/gamemode/client/vgui/*.lua", "LUA")) do
	MsgN("-> "..file)
	include("cnflood/gamemode/client/vgui/"..file)
end

function GM:SpawnMenuOpen(ply)
	return false
end

function GM:ContextMenuOpen(ply)
	return false
end

function GM:CanProperty(ply, property, ent)
	return false
end