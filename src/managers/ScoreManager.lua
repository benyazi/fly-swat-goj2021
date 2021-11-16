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

function ScoreManager.clear()
	points = 0
	kills = 0
	dkills = 0
	tkills = 0
	mcombo = 0
	comboLevel = 0
end

function ScoreManager.addPoints(pnts)
	pprint(pnts)
	points = points + pnts
	pprint(points)
end

function ScoreManager.addKill()
	print('ADD KILL')
	kills = kills + 1
	ScoreManager.addPoints(KILL_RATE * (comboLevel+1))
end

function ScoreManager.addDKill()
	dkills = dkills + 1
	ScoreManager.addPoints(DKILL_RATE)
end

function ScoreManager.addTKill()
	tkills = tkills + 1
	ScoreManager.addPoints(TKILL_RATE)
end

function ScoreManager.setMCombo(combo)
	if combo > mcombo then 
		mcombo = combo
	end
end

function ScoreManager.setComboLevel(comboLevel)
	comboLevel = comboLevel
end

function ScoreManager.getStat()
	local stat = {}
	stat['points'] = points
	stat['kills'] = kills
	stat['dkills'] = dkills
	stat['tkills'] = tkills
	stat['mcombo'] = mcombo
	return stat
end

return ScoreManager