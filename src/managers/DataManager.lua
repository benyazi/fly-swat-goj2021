local DataManager = {}

local current_scene = nil

function DataManager.setCurrentScene(sceneName)
	current_scene = sceneName
end

return DataManager