local util = require 'xlua.util'
xlua.private_accessible(CS.ResearchController)
local InitUIElements = function(self)
	self:InitUIElements();
	if CS.HotUpdateController.instance.mUsePlatform ~= CS.HotUpdateController.EUsePlatform.ePlatform_Normal then
		local obj1 = CS.ResManager.GetObjectByPath("AtlasClips3030/组件强化");
		if obj1 ~= nil then
			self.toggleComponentStrengthen.image.sprite = obj1:GetComponent(typeof(CS.UnityEngine.UI.Image)).sprite;
		end
	end
end
util.hotfix_ex(CS.ResearchController,'InitUIElements',InitUIElements)
