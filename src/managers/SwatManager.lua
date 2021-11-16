local SwatManager = {}

function SwatManager.calculatePosition(pos, angle, dist)
	angle = angle + math.rad(90)
	dist = dist * 5
	local vec = vmath.vector3(dist, 0, 0)
	local rot = vmath.quat_rotation_z(angle)
	local vec2 = vmath.rotate(rot, vec)
	pos = pos + vec2
	pos.z = 0.15
	return pos
end

function SwatManager.calculateRotation(angle)
	return vmath.quat_rotation_z(angle)
end

function SwatManager.calculateRunAway(pos)
	local minX, maxX, minY, maxY = DataManager.getBorders()
	
	local dist = 800
	local pushPos = go.get_position('/FlySwapPush')
	
	if random then 
		dist = 400
		rnd.seed()
		pushPos.x = rnd.double_range(minX, maxX)
		pushPos.y = rnd.double_range(minY, maxY)
	end

	local angle = math.atan2(pos.x - pushPos.x, pushPos.y - pos.y)
	local dx = pushPos.x - pos.x
	local dy = pushPos.y - pos.y

	angle = angle - math.rad(90)
	local vec = vmath.vector3(dist, 0, 0)
	local rot = vmath.quat_rotation_z(angle)
	local vec2 = vmath.rotate(rot, vec)
	pos = pos + vec2
	if pos.x > maxX then 
		pos.x = maxX
	elseif pos.x < minX then 
		pos.x = minX
	end
	if pos.y > maxY then 
		pos.y = maxY
	elseif pos.y < minY then 
		pos.y = minY
	end
	return pos 
end

return SwatManager