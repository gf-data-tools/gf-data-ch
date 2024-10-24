local util = require 'xlua.util'
xlua.private_accessible(CS.BreakoutPhaseMissionFinishController)
xlua.private_accessible(CS.BreakoutPhaseBattleFinishController)
xlua.private_accessible(CS.GriffinEntryMessageBoxController)

local mShowBattleResult = function(self)
	self:ShowBattleResult();
	if CS.GF.Tarkov.GameDataCache.I.playerData.nextPhaseInfo == nil then
		if CS.GF.Tarkov.GameDataCache.I.playerData.phaseInfo.order == self.bagData.organizePackageOrder then
			self.textPhaseName.text = CS.GF.Tarkov.GameDataCache.I.playerData.phaseInfo.name;
		end	
	end

	if CS.GF.Tarkov.GameDataCache.I.playerData.intelliPoint ~=nil and CS.GF.Tarkov.GameDataCache.I.playerData.intelliPoint.Count>0 then
		CS.CommonController.ShowItemListRewardBox(CS.GameDataCache.I.playerData.intelliPoint, nil, CS.Data.GetLang(1284));
	end

	local cache = CS.Data.GetPlayerPrefString(tostring(CS.GameData.userInfo.userId), "isFirstBreakoutPayoff");
	 
	if CS.System.String.IsNullOrEmpty(cache)  then
		CS.CommonGuideController.OpenGuideBox("isFirstBreakoutPayoff");

		CS.Data.SetPlayerPrefString(tostring(CS.GameData.userInfo.userId), "isFirstBreakoutPayoff", "hasGuid");
	end
end
local mInitMainBagView = function(self)
	self:InitMainBagView();
	local itemCount = self.bagData.listItemMain.Count;
	local price=0;
	if itemCount>0 then
		for i=0,itemCount-1 do
			local itemID = self.bagData.listItemMain[i];
			local itemInfo = CS.GF.Tarkov.GameDataCache.I.listItemInfo:GetDataById(itemID);
			if itemInfo ~= nil then
				price=price+itemInfo.PartBySold;
			end
		end
	end
	print(price) 
end
local mCheckIntelligencePoint = function(self)
	return;
end
util.hotfix_ex(CS.BreakoutPhaseBattleFinishController,'ShowBattleResult',mShowBattleResult)

--util.hotfix_ex(CS.BreakoutPhaseBattleFinishController,'InitMainBagView',mInitMainBagView)
util.hotfix_ex(CS.BreakoutPhaseMissionFinishController,'CheckIntelligencePoint',mCheckIntelligencePoint)
