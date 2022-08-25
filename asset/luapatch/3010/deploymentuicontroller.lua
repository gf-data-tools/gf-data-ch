local util = require 'xlua.util'
xlua.private_accessible(CS.DeploymentUIController)

local OnClickEndTurn = function(self)
	if CS.DeploymentController.playAniming then
		return;
	end
	self:OnClickEndTurn();
end

util.hotfix_ex(CS.DeploymentUIController,'OnClickEndTurn',OnClickEndTurn)



