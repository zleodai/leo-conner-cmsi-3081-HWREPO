require "exercises"

print("Testing change()")
assert(change(0) == 0, 0, 0, 0)
_, error = pcall(change, -50)
assert(string.match(error, "Amount must be positive"))
assert(change(1) == 0, 0, 0, 1)
assert(change(99) == 3, 2, 0, 4)
assert(change(42) == 1, 1, 1, 2)
assert(change(33.375) == 1, 0, 1, 3.375)
assert(change(100000000037) == 4000000001, 1, 0, 2)
assert(change(10000000000005) == 400000000000, 0, 1, 0)

print("All tests pass")
