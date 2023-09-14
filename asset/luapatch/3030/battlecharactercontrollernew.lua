local util = require 'xlua.util'
xlua.private_accessible(CS.GF.Battle.BattleCharacterControllerNew)
xlua.private_accessible(CS.GF.Battle.BattleCharacterData)
xlua.private_accessible(CS.GF.Battle.BattleDynamicData)
local FP = CS.TrueSync.FP
local Init = function(self,data)

	self:Init(data)
	if(data.isVehicleComponent and data.slotid > 0) then
		data.vehicleOffset = data.vehicleOffset + CS.TrueSync.TSVector(0.75,0,0)
		data.vehicleOffset = data.vehicleOffset * FP.FromFloat(self.spineScale)
		data.vehicleOffset = data.vehicleOffset - CS.TrueSync.TSVector(0.75,0,0)
	end
end
local AddEffectCollision = function(self)
	
	if CS.GF.Battle.BattleDynamicData.isVehicleBattle then
		self:AddEffectCollision()
	end
end
util.hotfix_ex(CS.GF.Battle.BattleCharacterControllerNew,'Init',Init)
util.hotfix_ex(CS.GF.Battle.BattleCharacterControllerNew,'AddEffectCollision',AddEffectCollision)