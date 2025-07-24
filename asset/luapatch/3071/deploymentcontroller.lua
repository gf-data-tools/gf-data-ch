local util = require 'xlua.util'
xlua.private_accessible(CS.DeploymentBuildingController)

local InitCode = function(self,code)
	self:InitCode(code);
	if self.spineHolder ~= nil then
		local pos = self.spineHolder.transform.localPosition;
		self.spineHolder.transform.localPosition = CS.UnityEngine.Vector3(pos.x,pos.y,80);
	end
end

util.hotfix_ex(CS.DeploymentBuildingController,'InitCode',InitCode)
