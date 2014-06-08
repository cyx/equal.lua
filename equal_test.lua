local equal = require("equal")

-- case 1: primitive types
assert(equal(1, 1))
assert(equal(nil, nil))
assert(equal(true, true))
assert(equal(false, false))
assert(equal("1", "1"))

assert(false == equal(1, 2))

-- case 2: list of primitive types
assert(equal({1, 2}, {1, 2}))
assert(false == equal({1, 2}, {2, 1}))

-- case 3: dictionary of primitive types
assert(equal({a = 1, b = 2}, {a = 1, b = 2}))
assert(false == equal({a = 2, b = 2}, {a = 1, b = 2}))

-- case 4: deeper list
assert(equal({{1, 2}, {3, 4}}, {{1, 2}, {3, 4}}))
assert(false == equal({{1, 2}, {3, 3}}, {{1, 2}, {3, 4}}))

-- case 5: deeper dictionary
assert(equal({a = {b = 2, c = 3}}, {a = {b = 2, c = 3}}))
assert(false == equal({a = {b = 2, c = 4}}, {a = {b = 2, c = 3}}))

-- case 6: equal at first, except second param is longer
assert(false == equal({1, 2, 3}, {1, 2, 3, 4}))

-- case 7: equal at first, except second param is longer
assert(false == equal({a = 1}, {a = 1, b = 2}))

-- case 8: custom __eq on metatable

local always_true = { __eq = function(a, b) return true end }
local always_false = { __eq = function(a, b) return false end }

assert(true == equal(setmetatable({}, always_true),
		     setmetatable({}, always_true)))

assert(false == equal(setmetatable({}, always_false),
		      setmetatable({}, always_false)))

print("All tests passed.")
