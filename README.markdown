# usage

```lua
local equal = require("equal")

-- case 1: primitive types
assert(equal(1, 1))
assert(equal(nil, nil))
assert(equal(true, true))
assert(equal(false, false))
assert(equal("1", "1"))

-- case 2: list of primitive types
assert(equal({1, 2}, {1, 2}))

-- case 3: dictionary of primitive types
assert(equal({a = 1, b = 2}, {a = 1, b = 2}))

-- case 4: deeper list
assert(equal({{1, 2}, {3, 4}}, {{1, 2}, {3, 4}}))

-- case 5: deeper dictionary
assert(equal({a = {b = 2, c = 3}}, {a = {b = 2, c = 3}}))

print("All tests passed.")
```

# license

MIT
