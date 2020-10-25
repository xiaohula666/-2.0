-- Give Cash
local function Flood_GiveCash(ply, txt)
	local command = string.Explode(" ", txt)
	if command[1] == "!1242246" then
		local ct = ChatText()
		local ct2 = ChatText()
		if ply:IsAdmin() then
			local target_player = FindPlayer(ply, command[2])
			local target_amount = command[3]
			local commandname = command[1]
			if CheckInput(ply, target_amount, commandname) then
				if IsValid(target_player) then	
					target_player:AddCash(command[3])

					ct:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct:AddText("你赐给 "..target_player:Nick().." $"..target_amount..".")
					ct:Send(ply)

					ct2:AddText("[洪水模式] ", Color(132, 199, 29, 255))					
					ct2:AddText("你收到了 $"..target_amount.." 财主 "..ply:Nick()..".")
					ct2:Send(target_player)
				else
					ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
					ct:AddText("未发现该玩家.")
					ct:Send(ply)
				end
			end
		else
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("你不配.")
			ct:Send(ply)
		end
	end
end
hook.Add("PlayerSay", "Flood_GiveCash", Flood_GiveCash)

-- Check Cash
local function Flood_CheckCash(ply, txt)
	local command = string.Explode(" ", txt)
	if command[1] == "!checkcash" then
		local ct = ChatText()
		if ply:IsAdmin() then
			local target_player = FindPlayer(ply, command[2])
			if IsValid(target_player) then	
				ct:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
				ct:AddText(target_player:Nick().." 拥有 $"..target_player:GetCash()..".")
				ct:Send(ply)
			else
				ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
				ct:AddText("未发现该玩家.")
				ct:Send(ply)
			end
		else
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("你不配.")
			ct:Send(ply)
		end
	end
end
hook.Add("PlayerSay", "Flood_CheckCash", Flood_CheckCash)

-- Set Cash
local function Flood_SetCash(ply, txt)
	local command = string.Explode(" ", txt)
	if command[1] == "awsdasdaf" then
		local ct = ChatText()
		local ct2 = ChatText()
		if ply:IsAdmin() then
			local target_player = FindPlayer(ply, command[2])
			local target_amount = command[3]
			local commandname = command[1]
			if CheckInput(ply, target_amount, commandname) then
				if IsValid(target_player) then
					target_player:SetCash(target_amount)

					ct:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct:AddText("你将 "..target_player:Nick().." 的钱包设置为 $"..target_amount..".")
					ct:Send(ply)

					ct2:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct2:AddText("你的钱包被设置为 $"..target_amount.." 来自 "..ply:Nick()..".")
					ct2:Send(target_player)
				else
					ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
					ct:AddText("未发现该玩家.")
					ct:Send(ply)
				end
			end
		else
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("你不配.")
			ct:Send(ply)
		end
	end
end
hook.Add("PlayerSay", "Flood_SetCash", Flood_SetCash)

-- Take Cash
local function Flood_TakeCash(ply, txt)
	local command = string.Explode(" ", txt)
	if command[1] == "取走" then
		local ct = ChatText()
		local ct2 = ChatText()
		if ply:IsAdmin() then
			local target_player = FindPlayer(ply, command[2])
			local target_amount = command[3]
			local commandname = command[1]
			if CheckInput(ply, target_amount, commandname) then
				if IsValid(target_player) then	
					target_player:SubCash(target_amount)	

					ct:AddText("[洪水模式] ", Color(132, 199, 29, 255))					
					ct:AddText("你取走了 $"..target_amount.." 失主 "..target_player:Nick().." .")
					ct:Send(ply)

					ct2:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct2:AddText("你钱包少了 $"..target_amount.." 小偷是 "..ply:Nick()..".")
					ct2:Send(target_player)
				else
					ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
					ct:AddText("未发现该玩家.")
					ct:Send(ply)
				end
			end
		else
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("你不配.")
			ct:Send(ply)
		end
	end
end
hook.Add("PlayerSay", "Flood_TakeCash", Flood_TakeCash)

-- Set Time
local function Flood_SetTime(ply, txt)
	local command = string.Explode(" ", txt)
	if command[1] == "设置时间" then
		local ct = ChatText()
		if ply:IsAdmin() then
			if command[2] == "造船时间" then
				if Flood_buildTime then
					Flood_buildTime = tonumber(command[3])

					ct:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct:AddText("你将建造船时间设置为 "..command[3])
					ct:Send(ply)
				else
					ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
					ct:AddText("发生故障.")
					ct:Send(ply)
				end
			elseif command[2] == "涨潮时间" then
				if Flood_floodTime then
					Flood_floodTime = tonumber(command[3])
					ct:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct:AddText("你已将本轮的洪水时间设置为 "..command[3])
					ct:Send(ply)
				else
					ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
					ct:AddText("发生故障.")
					ct:Send(ply)
				end
			elseif command[2] == "战斗时间" then
				if Flood_fightTime then
					Flood_fightTime = tonumber(command[3])
					ct:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct:AddText("你已将本轮的战斗时间设置为 "..command[3])
					ct:Send(ply)
				else
					ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
					ct:AddText("发生故障.")
					ct:Send(ply)
				end
			elseif command[2] == "重置时间" then
				if Flood_resetTime then
					Flood_resetTime = tonumber(command[3])
					ct:AddText("[洪水2.0] ", Color(132, 199, 29, 255))					
					ct:AddText("您已将本轮的重置回合时间设置为 "..command[3])
					ct:Send(ply)
				else
					ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
					ct:AddText("发生故障.")
					ct:Send(ply)
				end
			end			
		else
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("你不配.")
			ct:Send(ply)
		end
	end
end
hook.Add("PlayerSay", "Flood_SetTime", Flood_SetTime)

-- Returns string
function FindPlayer(ply, target)
	name = string.lower(target)
	for _,v in ipairs(player.GetHumans()) do
		if(string.find(string.lower(v:Name()), name, 1, true) != nil) then 
			return v
		end
	end
end

-- Returns boolean
function CheckInput(ply, num, commandname)
	local numeric_num = tonumber(num)
	local string_num = tostring(num)
	local commandname = tostring(commandname)
	local ct = ChatText()

	if numeric_num or string_num then
		if string_num == "nan" or string_num == "inf" then 
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("尝试将非法字符作为命令参数传递.")
			ct:Send(ply)
			return false
		elseif numeric_num == nil or string_num == nil then 
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("指定的参数无效.")
			ct:Send(ply)
			return false
		elseif numeric_num < 0 then
			ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
			ct:AddText("指定的数字无效,数字不允许是负数!")
			ct:Send(ply)
			return false
		else 
			return true
		end
	elseif commandname then
		ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
		ct:AddText("指定的数字无效.\n指令: "..commandname)
		ct:Send(ply)
		return false
	else
		ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
		ct:AddText("指定的数字无效.")
		ct:Send(ply)
		return false
	end
end