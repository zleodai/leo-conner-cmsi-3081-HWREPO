require "exercises"

print("Testing change()")
assert(change(0) == 0, 0, 0, 0)
_, err = pcall(change, 3.5)
assert(string.match(err, "Amount must be an integer"))
_, err = pcall(change, -50)
assert(string.match(err, "Amount cannot be negative"))
assert(change(1) == 0, 0, 0, 1)
assert(change(99) == 3, 2, 0, 4)
assert(change(42) == 1, 1, 1, 2)
assert(change(100000000037) == 4000000001, 1, 0, 2)
assert(change(10000000000005) == 400000000000, 0, 1, 0)

-- Uncomment the following tests as you complete the exercises
-- and remove this comment that tells you to uncomment!

-- print("Testing stretched()")
-- assert(stretched("") == "")
-- assert(stretched("  ") == "")
-- assert(stretched("  \t\n  \t") == "")
-- assert(stretched("  Hi  hi  ") == "Hiihhhiiii")
-- assert(stretched("😁😂😱") == "😁😂😂😱😱😱")
-- assert(stretched("hello world") ==
--     "heelllllllooooowwwwwwooooooorrrrrrrrllllllllldddddddddd")

-- print("Testing powers()")
-- TODO

-- print("Testing say()")
-- assert(say() == "")
-- assert(say("hi")() == "hi")
-- assert(say("hi")("there")() == "hi there")
-- assert(say("hello")("my")("name")("is")("Colette")() == "hello my name is Colette")
-- assert(say("h i")() == "h i")
-- assert(say("hi ")("   there")() == "hi     there")
-- assert(say("")("")("dog")("")("go")(), "  dog  go")
-- assert(say("😄🤗")("💀👊🏾")() == "😄🤗 💀👊🏾")

-- print("Testing misc_file_stats()")
-- TODO

-- print("Testing Quaternion")
-- q1 = Quaternion.new(8, 5, -3, 1)
-- assert(table.concat(q1:coefficients(), ",") == "8,5,-3,1")
-- q2 = Quaternion.new(0, 0, 0, 0)
-- assert(table.concat(q2:coefficients(), ",") == "0,0,0,0")
-- q3 = Quaternion.new(13, 21, -5, -21)
-- q4 = Quaternion.new(2, -1, -55, 2.5)
-- assert(table.concat((q3 + q4):coefficients(), ",") == "15,20,-60,-18.5")
-- q5 = Quaternion.new(3, -5, 1, -8)
-- q6 = Quaternion.new(2, -13, -2, 3)
-- assert(table.concat((q5 * q6):coefficients(), ",") == "-33,-62,115,16")

print("All tests pass")
