local ScoreManager = {}

local points = 0

local KILL_RATE = 10
local DKILL_RATE = 100
local TKILL_RATE = 400

local kills = 0
local dkills = 0
local tkills = 0
local mcombo = 0
local comboLevel = 0
local additionalTime = 0

function ScoreManager.clear()
	points = 0
	kills = 0
	dkills = 0
	tkills = 0
	mcombo = 0
	comboLevel = 0
	additionalTime = 0
end

function ScoreManager.addPoints(pnts)
	pprint(pnts)
	points = points + pnts
	-- pprint(points)
end

function ScoreManager.addKill()
	kills = kills + 1
	ScoreManager.addPoints(KILL_RATE * (comboLevel+1))
	if comboLevel > 4 then 
		ScoreManager.addTime(3)
	end
end

function ScoreManager.addDKill()
	dkills = dkills + 1
	ScoreManager.addPoints(DKILL_RATE)
	ScoreManager.addTime(3)
end

function ScoreManager.addTKill()
	tkills = tkills + 1
	ScoreManager.addPoints(TKILL_RATE)
	ScoreManager.addTime(5)
end

function ScoreManager.addTime(time)
	additionalTime = additionalTime + time
	msg.post('/DeathMatchManager#DeathMatchCtrl', 'ADD_TIME', {time = time})
end

function ScoreManager.setMCombo(combo)
	if combo > mcombo then 
		mcombo = combo
	end
end

function ScoreManager.setComboLevel(level)
	comboLevel = level
end

function ScoreManager.getStat()
	local stat = {}
	stat['points'] = points
	stat['kills'] = kills
	stat['dkills'] = dkills
	stat['tkills'] = tkills
	stat['mcombo'] = mcombo
	stat['atime'] = additionalTime
	return stat
end

return ScoreManager