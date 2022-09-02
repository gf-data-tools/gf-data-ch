local util = require 'xlua.util'

--修正梯队刷新只刷新Buff
local RefeshUI = function(self,delay)
	CS.CommonController.Invoke(function()
		if self.Team ~= nil then
			self.Team:RefeshBuffUI();
		end
		end,delay,CS.DeploymentController.Instance);
end

util.hotfix_ex(CS.BuffAction,'RefeshUI',RefeshUI)