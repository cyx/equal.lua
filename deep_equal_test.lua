local deep_equal = require("deep_equal")

-- case 1: primitive types
assert(deep_equal(1, 1))
assert(deep_equal(nil, nil))
assert(deep_equal(true, true))
assert(deep_equal(false, false))
assert(deep_equal("1", "1"))

-- case 2: list of primitive types
assert(deep_equal({1, 2}, {1, 2}))

-- case 3: dictionary of primitive types
assert(deep_equal({a = 1, b = 2}, {a = 1, b = 2}))

-- case 4: deeper list
assert(deep_equal({{1, 2}, {3, 4}}, {{1, 2}, {3, 4}}))

-- case 5: deeper dictionary
assert(deep_equal({a = {b = 2, c = 3}}, {a = {b = 2, c = 3}}))

print("All tests passed.")
