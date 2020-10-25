local PANEL = {}
function PANEL:Init()
	self.FloodPropIconList = {}
	self.FloodPropIconList_Collapse = {}

	self.TabList = vgui.Create("DPanelList", self)
	self.TabList:Dock(FILL)
	self.TabList:EnableVerticalScrollbar(true)

	if PropCategories then
		for k,v in pairs (PropCategories) do
			self.FloodPropIconList[k] = vgui.Create("DPanelList", self)
			self.FloodPropIconList[k]:SetAutoSize(true) 
		 	self.FloodPropIconList[k]:EnableHorizontal(true) 
		 	self.FloodPropIconList[k]:SetPadding(4) 
			self.FloodPropIconList[k]:SetVisible(true) 
			self.FloodPropIconList[k].OnMouseWheeled = nil
			
			self.FloodPropIconList_Collapse[k] = vgui.Create("DCollapsibleCategory", self)
			self.FloodPropIconList_Collapse[k]:SizeToContents()
			self.FloodPropIconList_Collapse[k]:SetLabel(v) 
			self.FloodPropIconList_Collapse[k]:SetVisible(true) 
			self.FloodPropIconList_Collapse[k]:SetContents(self.FloodPropIconList[k])
			self.FloodPropIconList_Collapse[k].Paint = function(self, w, h) 
				draw.RoundedBox(0, 0, 1, w, h, Color(0, 0, 0, 0)) 
				draw.RoundedBox(0, 0, 0, w, self.Header:GetTall(), Color(24, 24, 24, 255)) 
			end

			self.TabList:AddItem(self.FloodPropIconList_Collapse[k])
		end
	else
		LocalPlayer():ChatPrint([[无法加载道具类别表--请通知服务器管理员!]])
	end

	if Props then
		for k, v in pairs(Props) do	
			local ItemIcon = vgui.Create("SpawnIcon", self)
			ItemIcon:SetModel(v.Model)
			ItemIcon:SetSize(55,55)
			ItemIcon.DoClick = function() 
				RunConsoleCommand("FloodPurchaseProp", k)
				surface.PlaySound("ui/buttonclick.wav")		
			end

			if v.Description and v.Health and v.Price then ItemIcon:SetToolTip(Format("%s", "名称: "..v.Description.."\n耐久度: "..v.Health.."\n价格: $"..v.Price)) 
			else ItemIcon:SetToolTip(Format("%s", "无法加载工具:缺少字符--请通知服务器管理员!")) end

			if v.Group then self.FloodPropIconList[v.Group]:AddItem(ItemIcon) end
			ItemIcon:InvalidateLayout(true) 
		end
	else
		LocalPlayer():ChatPrint([[无法加载道具类别表--请通知服务器管理员!]])
	end
end
vgui.Register("Flood_ShopMenu_Props", PANEL)