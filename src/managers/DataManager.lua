local DataManager = {}

local current_scene = nil
local points = 0

function DataManager.setCurrentScene(sceneName)
	current_scene = sceneName
end

local EATER_RATE = 0.5
local STATE_RATE = 20
local FAIL_RATE = -200

function DataManager.foodDone(foodData)
	local diff = 0

	if foodData.state > 5 or foodData.eaterLevel <= 0 then 
		diff = FAIL_RATE
	else
		diff = diff + (6 - foodData.state) * STATE_RATE
		diff = diff + foodData.eaterLevel * EATER_RATE

		diff = math.floor(diff)
	end
	points = points + diff
	msg.post('/swatGui#Swat', 'UPDATE_POINTS', {points = points})
end

return DataManager