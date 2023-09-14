local util = require 'xlua.util'
xlua.private_accessible(CS.DeploymentController)

local RequestEndAllFriendTurnHandle = function(self,data)
	if data.jsonData:Contains("spot_trans") then
		local json = data.jsonData:GetValue("spot_trans");
		CS.GameData.missionAction:LoadSpotTransData(json);
	end
	self:RequestEndAllFriendTurnHandle(data);
end
util.hotfix_ex(CS.DeploymentController,'RequestEndAllFriendTurnHandle',RequestEndAllFriendTurnHandle)

