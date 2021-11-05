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

return SwatManager