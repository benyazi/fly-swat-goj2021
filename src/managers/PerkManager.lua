local PerkManager = {}
local currentActivePerk = nil 

local perks = {}

function PerkManager.init()	
	perks[1] = {
		name = 'push_increase',
		color = vmath.vector4(0.7,0,0,1)
	}
	perks[2] = {
		name = 'push_decrease',
		color = vmath.vector4(1,0,0,1)
	}
	perks[3] = {
		name = 'line_speed_increase',
		color = vmath.vector4(0,0.7,0,1)
	}
	perks[4] = {
		name = 'line_speed_decrease',
		color = vmath.vector4(0,1,0,1)
	}
	perks[5] = {
		name = 'freeze',
		color = vmath.vector4(0,0,1,1)
	}
end

function PerkManager.getPerks()
	return perks
end	

function PerkManager.revertActivePerk()
	if currentActivePerk.name == 'push_increase' then 
		msg.post('/FlySwapPush', 'NORMAL_SCALE')
		msg.post('/FlySwapTarget', 'NORMAL_SCALE')
	end
	if currentActivePerk.name == 'push_decrease' then 
		msg.post('/FlySwapPush', 'NORMAL_SCALE')
		msg.post('/FlySwapTarget', 'NORMAL_SCALE')
	end
	if currentActivePerk.name == 'line_speed_increase' then 
		DataManager.setLineSpeed(50)
	end
	if currentActivePerk.name == 'line_speed_decrease' then 
		DataManager.setLineSpeed(50)
	end
	if currentActivePerk.name == 'freeze' then 
		DataManager.setFlySpeed(1)
	end
	currentActivePerk = nil 
end

function PerkManager.setActivePerk(perk)
	if currentActivePerk ~= nil then 
		PerkManager.revertActivePerk()
	end
	currentActivePerk = perk
	if perk.name == 'push_increase' then 
		msg.post('/FlySwapPush', 'INCREASE')
		msg.post('/FlySwapTarget', 'INCREASE')
	end
	if perk.name == 'push_decrease' then 
		msg.post('/FlySwapPush', 'DECREASE')
		msg.post('/FlySwapTarget', 'DECREASE')
	end
	if perk.name == 'line_speed_increase' then 
		DataManager.setLineSpeed(150)
	end
	if perk.name == 'line_speed_decrease' then 
		DataManager.setLineSpeed(25)
	end
	if perk.name == 'freeze' then 
		DataManager.setFlySpeed(10)
	end
end

return PerkManager