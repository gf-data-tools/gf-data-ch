local util = require 'xlua.util'
xlua.private_accessible(CS.MallController)
xlua.private_accessible(CS.VehicleGoodItemCtrl)

local _JumpToTab = function(self,jumpType)
	if jumpType == 3 then
		self:OnClickMilitary(true, CS.MallGoodClassification.Military);
	elseif jumpType == 6 then
		self:OnClickExchange(true, CS.MallGoodClassification.Exchange);
	elseif jumpType == 7 then
		self:OnClickSpecialSupply(false, CS.MallGoodClassification.SpecialSupply_MonthCard);
	elseif jumpType == 8 then
		self:OnClickSpecialSupply(false, CS.MallGoodClassification.SpecialSupply_Daily);
	elseif jumpType == 9 then
		self:OnClickSpecialSupply(false, CS.MallGoodClassification.SpecialSupply_Other);
	elseif jumpType == 10 then
		self:OnClickGiftPackage(false, CS.MallGoodClassification.Gift_Pass);
	end
	self:JumpToTab(jumpType);
end
local _InitSkinID = function(self)
	self:InitSkinID();

	if self.skin_info ~=nil then
		self.strTitle = self.skin_info.Name;
		self.strIntroduction = self.skin_info.Introduce;
	end
end
util.hotfix_ex(CS.MallController,'JumpToTab',_JumpToTab)
util.hotfix_ex(CS.VehicleGoodItemCtrl,'InitSkinID',_InitSkinID)