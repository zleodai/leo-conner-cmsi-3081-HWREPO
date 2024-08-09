require "exercises"

counts = {[true] = 0, [false] = 0}
function suite(name)
  io.write("\nTesting " .. name)
end
function check(condition)
  counts[condition] = counts[condition] + 1
  io.write(condition and " . " or " F ")
end
function check_error(text, fun, arg)
  local success, err = pcall(fun, arg)
  check(not success and string.match(err, text) ~= nil)
end

suite("change")
check_error("Amount must be an integer", change, 3.5)
check_error("Amount cannot be negative", change, -50)   
check(change(0) == 0, 0, 0, 0)
check(change(1) == 0, 0, 0, 1)
check(change(99) == 3, 2, 0, 4)
check(change(42) == 1, 1, 1, 2)
check(change(100000000037) == 4000000001, 1, 0, 2)
check(change(10000000000005) == 400000000000, 0, 1, 0)

-- Uncomment the following tests as you complete the exercises
-- and remove this comment that tells you to uncomment!

-- suite("first_then_lower_case")
-- function nonEmpty(s) return s ~= "" end
-- function lengthGreaterThan3(s) return #s > 3 end
-- check(first_then_lower_case({}, nonEmpty, string.lower) == nil)
-- check(first_then_lower_case({"", "A", "B"}, nonEmpty, string.lower) == "a")
-- check(first_then_lower_case({"", "A", "ABC"}, lengthGreaterThan3, string.lower) == nil)
-- check(first_then_lower_case({"ABC", "ABCD", "ABCDE"}, lengthGreaterThan3, string.lower) == "abcd")

-- suite("powers_generator")
-- gen = powers_generator(3, 100)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- check(status == "suspended" and success and power == 1)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- check(status == "suspended" and success and power == 3)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- check(status == "suspended" and success and power == 9)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- check(status == "suspended" and success and power == 27)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- check(status == "suspended" and success and power == 81)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- check(status == "suspended" and success and power == nil)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- check(status == "dead" and not success)

-- suite("say")
-- check(say() == "")
-- check(say("hi")() == "hi")
-- check(say("hi")("there")() == "hi there")
-- check(say("hello")("my")("name")("is")("Colette")() == "hello my name is Colette")
-- check(say("h i")() == "h i")
-- check(say("hi ")("   there")() == "hi     there")
-- check(say("")("")("dog")("")("go")() == "  dog  go")
-- check(say("😄🤗")("💀👊🏾")() == "😄🤗 💀👊🏾")

-- suite("misc_file_stats")
-- stats = misc_file_stats("NoSuchFile.txt")
-- check(stats.error == "No such file")
-- stats = misc_file_stats("../test-for-line-count.txt")
-- check(stats.lineCount == 13)
-- check(stats.blankLineCount == 7)
-- check(stats.hashedLineCount == 2)

-- suite("Quaternion")
-- q1 = Quaternion.new(8, 5, -3, 1)
-- check(q1 == Quaternion.new(8, 5, -3, 1))
-- check(table.concat(q1:coefficients(), ",") == "8,5,-3,1")
-- check(table.concat(q1:conjugate():coefficients(), ",") == "8,-5,3,-1")
-- check(q1:conjugate():conjugate() == q1)
-- check(q1:conjugate() == Quaternion.new(8, -5, 3, -1))
-- q2 = Quaternion.new(0, 0, 0, 0)
-- check(table.concat(q2:coefficients(), ",") == "0,0,0,0")
-- check(table.concat(q2:conjugate():coefficients(), ",") == "0,0,0,0")
-- q3 = Quaternion.new(13, 21, -5, -21)
-- q4 = Quaternion.new(2, -1, -55, 2.5)
-- check(table.concat((q3 + q4):coefficients(), ",") == "15,20,-60,-18.5")
-- q5 = Quaternion.new(3, -5, 1, -8)
-- q6 = Quaternion.new(2, -13, -2, 3)
-- check(table.concat((q5 * q6):coefficients(), ",") == "-33,-62,115,16")
-- check(table.concat((q5 * q6):conjugate():coefficients(), ",") == "-33,62,-115,-16")
-- check((q5 * q6):conjugate() == Quaternion.new(-33, 62, -115, -16))

print(string.format("\n%d passed, %d failed", counts[true], counts[false]))
