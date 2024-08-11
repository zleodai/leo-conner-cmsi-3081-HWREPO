require "exercises"

--------------------------------------------------------------------------------
passed, failed = 0, 0

function suite(name)
  io.write("\nTesting " .. name)
end

function expect(condition)
  if condition then passed = passed + 1 else failed = failed + 1 end
  io.write(condition and " ." or " F")
end

function expect_array_equals(a1, a2)
  if #a1 ~= #a2 then expect(false); return end
  for i = 1, #a1 do
    if a1[i] ~= a2[i] then expect(false); return end
  end
  expect(true)
end

function expect_hash_equals(h1, h2)
  for k, v in pairs(h1) do
    if h2[k] ~= v then expect(false); return end
  end
  for k, v in pairs(h2) do
    if h1[k] ~= v then expect(false); return end
  end
  expect(true)
end

function expect_error(text, fun, arg)
  local success, err = pcall(fun, arg)
  expect(not success and string.match(err, text) ~= nil)
end
--------------------------------------------------------------------------------

suite("change")
expect_error("Amount must be an integer", change, 33.375)
expect_error("Amount cannot be negative", change, -50)   
expect_hash_equals(change(0), {[25]=0, [10]=0, [5]=0, [1]=0})
expect_hash_equals(change(1), {[25]=0, [10]=0, [5]=0, [1]=1})
expect_hash_equals(change(8), {[25]=0, [10]=0, [5]=1, [1]=3})
expect_hash_equals(change(42), {[25]=1, [10]=1, [5]=1, [1]=2})
expect_hash_equals(change(99), {[25]=3, [10]=2, [5]=0, [1]=4})
expect_hash_equals(change(144), {[25]=5, [10]=1, [5]=1, [1]=4})
expect_hash_equals(change(250), {[25]=10, [10]=0, [5]=0, [1]=0})
expect_hash_equals(change(100000000037), {[25]=4000000001, [10]=1, [5]=0, [1]=2})
expect_hash_equals(change(10000000000005), {[25]=400000000000, [10]=0, [5]=1, [1]=0})

-- Uncomment the following tests as you complete the exercises

-- suite("first_then_lower_case")
-- function nonEmpty(s) return s ~= "" end
-- function lengthGreaterThan3(s) return #s > 3 end
-- expect(first_then_lower_case({}, nonEmpty) == nil)
-- expect(first_then_lower_case({"", "A", "B"}, nonEmpty) == "a")
-- expect(first_then_lower_case({"", "A", "ABC"}, lengthGreaterThan3) == nil)
-- expect(first_then_lower_case({"ABC", "ABCD", "ABCDE"}, lengthGreaterThan3) == "abcd")

-- suite("powers_generator")
-- gen = powers_generator(3, 100)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- expect(status == "suspended" and success and power == 1)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- expect(status == "suspended" and success and power == 3)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- expect(status == "suspended" and success and power == 9)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- expect(status == "suspended" and success and power == 27)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- expect(status == "suspended" and success and power == 81)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- expect(status == "suspended" and success and power == nil)
-- status = coroutine.status(gen)
-- success, power = coroutine.resume(gen)
-- expect(status == "dead" and not success)

-- suite("say")
-- expect(say() == "")
-- expect(say("hi")() == "hi")
-- expect(say("hi")("there")() == "hi there")
-- expect(say("hello")("my")("name")("is")("Colette")() == "hello my name is Colette")
-- expect(say("h i")() == "h i")
-- expect(say("hi ")("   there")() == "hi     there")
-- expect(say("")("")("dog")("")("go")() == "  dog  go")
-- expect(say("😄🤗")("💀👊🏾")() == "😄🤗 💀👊🏾")

-- suite("meaningful_line_count")
-- expect_error("No such file", meaningful_line_count, "no-such-file.txt")
-- expect(meaningful_line_count("../test-for-line-count.txt") == 5)

-- suite("Quaternion")
-- q1 = Quaternion.new(8, 5, -3, 1)
-- expect(q1 == Quaternion.new(8, 5, -3, 1))
-- expect_array_equals(q1:coefficients(), {8, 5,- 3, 1})
-- expect_array_equals(q1:conjugate():coefficients(), {8, -5, 3, -1})
-- expect(q1:conjugate():conjugate() == q1)
-- expect(q1:conjugate() == Quaternion.new(8, -5, 3, -1))
-- expect(tostring(q1) == "8+5i-3j+k")
-- expect(tostring(q1:conjugate()) == "8-5i+3j-k")
-- q2 = Quaternion.new(0, 0, 0, 0)
-- expect_array_equals(q2:coefficients(), {0, 0, 0, 0})
-- expect_array_equals(q2:conjugate():coefficients(), {0, 0, 0, 0})
-- expect(q2:conjugate() == Quaternion.new(0, 0, 0, 0))
-- expect(tostring(q2) == "0")
-- q3 = Quaternion.new(13, 21, -5, -21)
-- q4 = Quaternion.new(2, -1, -55, 2.5)
-- expect_array_equals((q3 + q4):coefficients(), {15, 20, -60, -18.5})
-- expect(tostring(q3 + q4) == "15+20i-60j-18.5k")
-- q5 = Quaternion.new(3, -5, 1, -8)
-- q6 = Quaternion.new(2, -13, -2, 3)
-- expect_array_equals((q5 * q6):coefficients(), {-33,-62, 115, 16})
-- expect_array_equals((q5 * q6):conjugate():coefficients(), {-33, 62, -115, -16})
-- expect((q5 * q6):conjugate() == Quaternion.new(-33, 62, -115, -16))
-- expect(tostring(Quaternion.new(0, 1, 0, 0)) == "i")
-- expect(tostring(Quaternion.new(0, 1, 0, -1)) == "i-k")
-- expect(tostring(Quaternion.new(0, -1, 5, -1)) == "-i+5j-k")

print(string.format("\n%d passed, %d failed", passed, failed))
