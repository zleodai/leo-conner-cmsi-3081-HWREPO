require "exercises"

counts = {[true] = 0, [false] = 0}
function suite(name)
  io.write("\nTesting " .. name)
end
function check(condition)
  counts[condition] = counts[condition] + 1
  io.write(condition and " . " or " F ")
end
function check_array_equals(a1, a2)
  if #a1 ~= #a2 then check(false); return end
  for i = 1, #a1 do
    if a1[i] ~= a2[i] then check(false); return end
  end
  check(true)
end
function check_hash_equals(h1, h2)
  for k, v in pairs(h1) do
    if h2[k] ~= v then check(false); return end
  end
  for k, v in pairs(h2) do
    if h1[k] ~= v then check(false); return end
  end
  check(true)
end
function check_error(text, fun, arg)
  local success, err = pcall(fun, arg)
  check(not success and string.match(err, text) ~= nil)
end

suite("change")
check_error("Amount must be an integer", change, 3.5)
check_error("Amount cannot be negative", change, -50)   
check_hash_equals(change(0), {[25]=0, [10]=0, [5]=0, [1]=0})
check_hash_equals(change(1), {[25]=0, [10]=0, [5]=0, [1]=1})
check_hash_equals(change(99), {[25]=3, [10]=2, [5]=0, [1]=4})
check_hash_equals(change(42), {[25]=1, [10]=1, [5]=1, [1]=2})
check_hash_equals(change(100000000037), {[25]=4000000001, [10]=1, [5]=0, [1]=2})
check_hash_equals(change(10000000000005), {[25]=400000000000, [10]=0, [5]=1, [1]=0})

-- Uncomment the following tests as you complete the exercises
-- and remove this comment that tells you to uncomment!

-- suite("first_then_lower_case")
-- function nonEmpty(s) return s ~= "" end
-- function lengthGreaterThan3(s) return #s > 3 end
-- check(first_then_lower_case({}, nonEmpty) == nil)
-- check(first_then_lower_case({"", "A", "B"}, nonEmpty) == "a")
-- check(first_then_lower_case({"", "A", "ABC"}, lengthGreaterThan3) == nil)
-- check(first_then_lower_case({"ABC", "ABCD", "ABCDE"}, lengthGreaterThan3) == "abcd")

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

-- suite("meaningful_line_count")
-- check_error("No such file", meaningful_line_count, "no-such-file.txt")
-- check(meaningful_line_count("../test-for-line-count.txt") == 5)

-- suite("Quaternion")
-- q1 = Quaternion.new(8, 5, -3, 1)
-- check(q1 == Quaternion.new(8, 5, -3, 1))
-- check_array_equals(q1:coefficients(), {8, 5,- 3, 1})
-- check_array_equals(q1:conjugate():coefficients(), {8, -5, 3, -1})
-- check(q1:conjugate():conjugate() == q1)
-- check(q1:conjugate() == Quaternion.new(8, -5, 3, -1))
-- q2 = Quaternion.new(0, 0, 0, 0)
-- check_array_equals(q2:coefficients(), {0, 0, 0, 0})
-- check_array_equals(q2:conjugate():coefficients(), {0, 0, 0, 0})
-- q3 = Quaternion.new(13, 21, -5, -21)
-- q4 = Quaternion.new(2, -1, -55, 2.5)
-- check_array_equals((q3 + q4):coefficients(), {15, 20, -60, -18.5})
-- q5 = Quaternion.new(3, -5, 1, -8)
-- q6 = Quaternion.new(2, -13, -2, 3)
-- check_array_equals((q5 * q6):coefficients(), {-33,-62, 115, 16})
-- check_array_equals((q5 * q6):conjugate():coefficients(), {-33, 62, -115, -16})
-- check((q5 * q6):conjugate() == Quaternion.new(-33, 62, -115, -16))

print(string.format("\n%d passed, %d failed", counts[true], counts[false]))
