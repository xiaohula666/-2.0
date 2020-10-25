-----------------------------------------------------------------------------------------------
----                                 Constraint Block                                      ----
-----------------------------------------------------------------------------------------------
local cents = {
	"prop_physics",
	"prop_physics_multiplayer",
	"func_physbox",
	"func_breakable",
	"class C_BaseEntity",
	"func_door"


}

local function isConstraintableEntity(ent)
	return table.HasValue(cents,ent:GetClass())
end 

timer.Create("NConstraint",0.3,0,function()
	for _,ent in pairs(ents.GetAll()) do
		if isConstraintableEntity(ent) then 
			local ctab = constraint.GetTable(ent)
			for _,cdata in pairs(ctab) do
				local own = cdata.Owner 
				for _,conent in pairs(cdata.Entity) do
					if conent.Entity == game.GetWorld() then 
						cdata.Constraint:Remove()
						ent:EmitSound("buttons/button2.wav")
						if own then 
							own:ChatPrint("您的 " .. cdata.Type .. " 限制已被删除 " .. tostring(ent) .. " 因为它已限制在全局设置中.")
						end

					end
				end
			end
		end
	end
end)

-----------------------------------------------------------------------------------------------
----                                 Can Tool                                              ----
-----------------------------------------------------------------------------------------------
function GM:CanTool(ply, tr, tool)
	if ply:IsAdmin() then return true end
	for _, tools in pairs(self:CompileToolTable()) do
		if tostring(tools[1]) == tostring(tool) and tobool(tools[3]) == true then
			if tr.Entity:IsWorld() then
				return false
			elseif not tr.Entity:IsValid() then
				return false
			else
				if tobool(tools[2]) == true then
					if ply:IsAdmin() or ply:IsDonator()then
						return true
					else
						local ct = ChatText()
						ct:AddText("[洪水2.0] ", Color(158, 49, 49, 255))
						ct:AddText(tool.." 仅vip玩家可用!")
						ct:Send(ply)
						return false
					end
				else
					return true
				end
			end
		end
	end
end