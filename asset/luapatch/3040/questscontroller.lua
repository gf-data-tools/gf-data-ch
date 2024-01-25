local util = require 'xlua.util'
xlua.private_accessible(CS.QuestsController)
xlua.private_accessible(CS.DailyWeekQuestCtrl)

local ShowUI = function(self)
	self:ShowUI();
	CS.DailyWeekQuestCtrl.Instance.hasLoadPic = false;
	CS.DailyWeekQuestCtrl.Instance:InitKalina();
	CS.DailyWeekQuestCtrl.Instance:LoadRewardBox();
end
local Start = function(self)
	
end
util.hotfix_ex(CS.QuestsController,'ShowUI',ShowUI)
util.hotfix_ex(CS.DailyWeekQuestCtrl,'Start',Start)