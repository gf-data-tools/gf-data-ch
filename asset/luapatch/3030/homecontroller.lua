local util = require 'xlua.util'
xlua.private_accessible(CS.HomeController)
xlua.private_accessible(CS.GF.Common.ObjectPool)
xlua.private_accessible(CS.ResDownloadProcess)

local ResClean = function(deep)
	if CS.Utility.loadedLevelName ~= "Deployment" and CS.Utility.loadedLevelName ~= "Cutin" and CS.Utility.loadedLevelName ~= "Battle" then
		CS.DynamicDataCache.Instance.cacheDataMap:Clear();
		CS.SkeletonDataAsset.saveSkeletonDataTemp:Clear();
		local iter = CS.GF.Common.ObjectPool.Instance.sence2Prefab:GetEnumerator();
		while iter:MoveNext() do
			local name = iter.Current.Key;
			CS.GF.Common.ObjectPool.DestroyAll(name);
		end
		CS.GF.Common.ObjectPool.Instance.sence2Prefab:Clear();
		CS.GF.Common.ObjectPool.Instance.pathPrefabs:Clear();
		CS.GF.Common.ObjectPool.Instance.spawnedObjects:Clear();
		CS.GF.Common.ObjectPool.Instance.pooledObjects:Clear();
		CS.GF.Common.ObjectPool.tempList:Clear();
		print("ClearRes");
	end
	CS.ResManager.ResClean(deep);
end
local Recycle = function(obj,prefab)
	if not CS.GF.Common.ObjectPool.Instance.pooledObjects:ContainsKey(prefab) then
		CS.GF.Common.ObjectPool.Instance.pooledObjects:Add(prefab,CS.System.Collections.Generic.List(CS.UnityEngine.GameObject));
	end
	CS.CS.GF.Common.ObjectPool.Recycle(obj,prefab);
end
local Awake = function(self)
	self:Awake()
	util.hotfix_ex(CS.ResManager,'ResClean',ResClean)
end

local ShowDownLoadJPVoice = function(self)
	if self.resDownload ~= nil and self.resDownload.show then
		CS.CommonController.MessageBox(CS.Data.GetLang(52108));
		return;
	end
	self:ShowDownLoadJPVoice();
end

local ShowDownLoadAddData = function(self)
	if self.resDownload ~= nil and self.resDownload.show then
		CS.CommonController.MessageBox(CS.Data.GetLang(52108));
		return;
	end
	self:ShowDownLoadAddData();
end

local CheckDownloadInHome = function(self)
	if self.resDownload ~= nil and self.resDownload.show then		
		return;
	end
	self:CheckDownloadInHome();
end
util.hotfix_ex(CS.HomeController,'Awake',Awake)
util.hotfix_ex(CS.GF.Common.ObjectPool,'Recycle',Recycle)
util.hotfix_ex(CS.ResCenter,'ShowDownLoadJPVoice',ShowDownLoadJPVoice)
util.hotfix_ex(CS.ResCenter,'ShowDownLoadAddData',ShowDownLoadAddData)
util.hotfix_ex(CS.ResCenter,'CheckDownloadInHome',CheckDownloadInHome)