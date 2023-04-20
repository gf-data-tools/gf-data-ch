local util = require 'xlua.util'
xlua.private_accessible(CS.DeploymentAllyTeamFloatingInfo)

local UpdateInfo = function(self)
	self:UpdateInfo();
	if self.allyTeamController ~= nil and not self.allyTeamController.currentSpot.Show then
		if self.canvasGroup.alpha>0 then
			self.canvasGroup:DOFade(0,0.5);
		end
	end
end
util.hotfix_ex(CS.DeploymentAllyTeamFloatingInfo,'UpdateInfo',UpdateInfo)