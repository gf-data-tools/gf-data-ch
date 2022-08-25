local util = require 'xlua.util'
xlua.private_accessible(CS.GuideDeploymentController)
--修正显示层级
local get_Instance = function()
	local instance = CS.GuideDeploymentController.Instance;
	local canvas = instance.gameObject:GetComponent(typeof(CS.UnityEngine.Canvas));
	canvas.sortingOrder = 35;
	return  instance;
end
--修正下一步提前触发导致的问题
local TriggerStep = function()
	CS.GuideDeploymentController.TriggerStepData();
end
local RequestMissionGuideStepHandle = function(self,request)
	CS.DeploymentController.AddAction(TriggerStep,0.2);
end

util.hotfix_ex(CS.GuideDeploymentController,'get_Instance',get_Instance)
util.hotfix_ex(CS.GuideDeploymentController,'RequestMissionGuideStepHandle',RequestMissionGuideStepHandle)


