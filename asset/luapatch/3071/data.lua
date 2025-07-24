local util = require 'xlua.util'
xlua.private_accessible(CS.Data)
xlua.private_accessible(CS.Friend)

local EnterIntoList = function(self,friendType)
	self.friendStatus = friendType;
	local id = self:GetID();
	if friendType == CS.FriendType.Friend then
		if not CS.GameData.listFriend:ContainsKey(id) then
			CS.GameData.listFriend:Add(self);
		end
	elseif friendType == CS.FriendType.BlackList then
		if not CS.GameData.listBlackList:ContainsKey(id) then
			CS.GameData.listBlackList:Add(self);
		end
	elseif friendType == CS.FriendType.RandomStranger then
		if not CS.GameData.listRandomFriend:ContainsKey(id) then
			CS.GameData.listRandomFriend:Add(self);
		end
	elseif friendType == CS.FriendType.BeAppliedStranger then
		if not CS.GameData.listFriendApplied:ContainsKey(id) then
			CS.GameData.listFriendApplied:Add(self);
		end
	elseif friendType == CS.FriendType.ApplyingStranger then
		if not CS.GameData.listFriendApplying:ContainsKey(id) then
			CS.GameData.listFriendApplying:Add(self);
		end
	elseif friendType == CS.FriendType.SearchList then
		if not CS.GameData.listSearchFriend:ContainsKey(id) then
			CS.GameData.listSearchFriend:Add(self);
		end
	end
end

util.hotfix_ex(CS.Friend,'EnterIntoList',EnterIntoList)
