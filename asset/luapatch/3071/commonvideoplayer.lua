local util = require 'xlua.util'
xlua.private_accessible(CS.CommonVideoPlayer)
xlua.private_accessible(CS.CriWare.CriManaMovieControllerForUI)
local SetBattleMode = function(self, order)
	self.movieController.previousOnApplicationPauseStatus = true
	self:SetBattleMode(order)
end
util.hotfix_ex(CS.CommonVideoPlayer,'SetBattleMode',SetBattleMode)