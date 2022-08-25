local util = require 'xlua.util'
xlua.private_accessible(CS.FriendCosmeticIconController)

--暂时关闭头像框购买标签
local Init = function(self,info)
	if info.source ~= nil then
		self:Init(info);
	else
		self:Init(info);
		if info.type == CS.CosmeticType.headFrame then
			if info.specialCode == "jump" then
				self.goBuyMore:SetActive(false);
				self.imageSelect.gameObject:SetActive(false);
			end
		end
	end
end

util.hotfix_ex(CS.FriendCosmeticIconController,'Init',Init)