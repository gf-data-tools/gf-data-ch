local util = require 'xlua.util'
xlua.private_accessible(CS.DormUIController)
xlua.private_accessible(CS.DormFriendUIController)

local RequestGetFriendListHandler = function(self,result)
	self:RequestGetFriendListHandler(result);
	CS.DormUIController.Instance:InitFriendList();
end

util.hotfix_ex(CS.DormFriendUIController,'RequestGetFriendListHandler',RequestGetFriendListHandler)