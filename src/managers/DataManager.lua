local DataManager = {}

local current_scene = nil
local points = 0
local line_speed = 50
local fly_speed_diff = 1

function DataManager.getLineSpeed()
	return line_speed
end

function DataManager.setLineSpeed(speed)
	line_speed = speed
end

function DataManager.getFlySpeed()
	return fly_speed_diff
end

function DataManager.setFlySpeed(speed)
	fly_speed_diff = speed
end

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