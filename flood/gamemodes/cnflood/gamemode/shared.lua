DeriveGamemode("sandbox")

GM.Name 	= "洪水模式2.0(汉化版)"
GM.Author 	= "Mythikos & Freezebug/Xbox & %nm柠檬"
GM.Version  = "2.0.0"
GM.Email 	= "n/a"
GM.Website 	= "n/a"

-- Include Shared files
for _, file in pairs (file.Find("cnflood/gamemode/shared/*.lua", "LUA")) do
   include("cnflood/gamemode/shared/"..file); 
end

TEAM_PLAYER = 2

team.SetUp(TEAM_PLAYER, "Player", Color(16, 153, 156))

-- Format coloring because garry likes vectors for playermodels
function GM:FormatColor(col)
	col = Color(col.r * 255, col.g * 255, col.b * 255)
	return col
end