-- The MIT License (MIT)
-- 
-- Copyright (c) 2014, Cyril David <cyx@cyx.is>
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

local function equal(x, y)
	-- Compare by primitive equality first.
	if x == y then return true end

	-- If a custom __eq has been defined, trust == even
	-- for tables.
	local mtx, mty = getmetatable(x), getmetatable(y)
	if (mtx and mtx.__eq) or (mty and mty.__eq) then return false end

	-- If one of the values isn't a table, and the identity
	-- is not the same, they are not equal.
	local t1, t2 = type(x), type(y)

	if t1 ~= 'table' or t2 ~= 'table' then return false end

	-- Since we have two tables, make sure both have the same
	-- length so we can avoid looping over different length arrays.
	if #x ~= #y then return false end

	-- Case 1: check over all keys of x
	for k,v in pairs(x) do
		if not equal(v, y[k]) then return false end
	end

	-- Case 2: check over `y` this time.
	for k,v in pairs(y) do
		if not equal(v, x[k]) then return false end
	end

	return true
end

return equal
