local util = require 'xlua.util'
xlua.private_accessible(CS.DeploymentUIController)

local RefreshItemUI = function(self)
	if self.itemObj == nil or self.itemObj:isNull() then
		return;
	end
	self.itemObj:SetActive(not CS.DeploymentController.isDeplyment);
	local name = self.itemObj.name;
	if name == "2023Se_Buff_Theater(Clone)" or name == "2023Se_Buff_Arms(Clone)" or name == "2023Se_Buff_PA(Clone)" then
		local itemid = self.config.showItemIds[0];
		local itemnum = CS.GameData.GetItem(itemid);
		local child = self.itemObj.transform;
		for i=0,4 do
			child:GetChild(i).gameObject:SetActive(false);
		end
		if itemnum >= 8 then
			child:GetChild(4).gameObject:SetActive(true);
		elseif itemnum>=6 then
			child:GetChild(3).gameObject:SetActive(true);
		elseif itemnum>=4 then
			child:GetChild(2).gameObject:SetActive(true);
		elseif itemnum>=2 then
			child:GetChild(1).gameObject:SetActive(true);
		else
			child:GetChild(0).gameObject:SetActive(true);
		end
		local txtNum = child:Find("Tex_Num"):GetComponent(typeof(CS.ExText));
		txtNum.text =tostring(itemnum);
		local btnInfo = child:Find("TipsButton").gameObject:GetComponent(typeof(CS.ExButton));
		local url = child:Find("TipsButton/URL"):GetComponent(typeof(CS.ExText)).text;
		btnInfo.onClick:RemoveAllListeners();
		btnInfo:AddOnClick(function()
				CS.OPSWebWindows.Show(url);
			end);
	elseif name == "2023Se_All(Clone)" then
		for i=0,self.config.showItemIds.Count-1 do
			local itemid = self.config.showItemIds[i];
			local num = CS.GameData.GetItem(itemid);
			local child = self.itemObj.transform:GetChild(0):GetChild(i);
			for j=0,4 do
				child:GetChild(j).gameObject:SetActive(false);
			end
			if num >= 8 then
				child:GetChild(4).gameObject:SetActive(true);
			elseif num>=6 then
				child:GetChild(3).gameObject:SetActive(true);
			elseif num>=4 then
				child:GetChild(2).gameObject:SetActive(true);
			elseif num>=2 then
				child:GetChild(1).gameObject:SetActive(true);
			else
				child:GetChild(0).gameObject:SetActive(true);
			end
			local txtNum = child:Find("Tex_Num"):GetComponent(typeof(CS.ExText));
			txtNum.text =tostring(num);
			local btnInfo = child:Find("TipsButton").gameObject:GetComponent(typeof(CS.ExButton));
			local url = child:Find("TipsButton/URL"):GetComponent(typeof(CS.ExText)).text;
			btnInfo.onClick:RemoveAllListeners();
			btnInfo:AddOnClick(function()
					CS.OPSWebWindows.Show(url);
				end);
		end
	else
		self:RefreshItemUI();
	end
end

util.hotfix_ex(CS.DeploymentUIController,'RefreshItemUI',RefreshItemUI)


