local function deep_equal(x, y)
	local t1, t2 = type(x), type(y)

	-- shortcircuit if types not equal
	if t1 ~= t2 then return false end

	-- for primitive types, direct comparison works
	if t1 ~= 'table' and t2 ~= 'table' then return x == y end

	for k,v in pairs(x) do
		if not deep_equal(v, y[k]) then
			return false
		end
	end

	return true
end

return deep_equal
