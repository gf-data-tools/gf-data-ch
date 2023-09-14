local util = require 'xlua.util'
xlua.private_accessible(CS.CommonVehicleComponentListController)

local OnClickIntelligentConfirm_New = function(self,starType)
	local chooseRank
	if starType == 0 then
		chooseRank = 3
	else
		chooseRank = 4
	end

	local listNewFood = CS.System.Collections.Generic.List(CS.VehicleComponent)()

	for i=0, self.listFilteredComponent.Count - 1 do
		local currentComponent = self.listFilteredComponent[i]
        if currentComponent.info.rank == chooseRank and currentComponent.level == 0 
            and self.listSelectedComponent:Contains(self.listFilteredComponent[i]) == false then
            
            listNewFood:Add(self.listFilteredComponent[i])
        end
	end

	self:CheckStrengthenFood(listNewFood)
    self:RefreshList()
    self:RefreshAllLabelSelection()
end


util.hotfix_ex(CS.CommonVehicleComponentListController,'OnClickIntelligentConfirm',OnClickIntelligentConfirm_New)

