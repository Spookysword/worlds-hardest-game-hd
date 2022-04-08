function ToDec(color)
    return { color[1]/255,color[2]/255,color[3]/255 }
end

function Round(num)
    return math.floor(num * 1 + 0.5) / 1
end

function AABB(x1, y1, w1, h1, x2, y2, w2, h2)
	if x1 < x2 + w2 and x1 + w1 > x2 and y1 < y2 + h2 and y1 + h1 > y2 then
		return true
	end
	return false
end
