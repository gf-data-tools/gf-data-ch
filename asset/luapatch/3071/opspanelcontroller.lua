local util = require 'xlua.util'
xlua.private_accessible(CS.OPSPanelController)

local CheckSpineMove = function(self)
	self:CheckSpineMove();
	if self.moveSpots.Count == 0 then
		self:CheckDiskMission();
	end
end

local Start = function(self)
	self:Start();
	CS.ImageBufferBlurRefraction.depthonlyCamain.cullingMask = 1 << 18;
end
util.hotfix_ex(CS.OPSPanelController,'CheckSpineMove',CheckSpineMove)
util.hotfix_ex(CS.OPSPanelController,'Start',Start)

