require "exercises"

total_count, failed_count = 0, 0
function check(condition)
    total_count = total_count + 1
    if condition then
        io.write('.')
    else
        failed_count = failed_count + 1
        io.write('X')
    end
end

io.write("\nTesting change()")
check(change(0) == 0, 0, 0, 0)
_, err = pcall(change, 3.5)
check(string.match(err, "Amount must be an integer"))
_, err = pcall(change, -50)
check(string.match(err, "Amount cannot be negative"))
check(change(1) == 0, 0, 0, 1)
check(change(99) == 3, 2, 0, 4)
check(change(42) == 1, 1, 1, 2)
check(change(100000000037) == 4000000001, 1, 0, 2)
check(change(10000000000005) == 400000000000, 0, 1, 0)

-- Uncomment the following tests as you complete the exercises
-- and remove this comment that tells you to uncomment!

-- io.write("\nTesting firstThenApply()")
-- function even(x) return x % 2 == 0 end
-- function double(x) return x * 2 end
-- check(firstThenApply({}, even, double) == nil)
-- check(firstThenApply({1, 3, 5, 7, 9}, even, double) == nil)
-- check(firstThenApply({1, 3, 5, 7, 9, 10}, even, double) == 20)
-- check(firstThenApply({1, 3, 5, 7, 9, 10, 11}, even, double) == 20)
-- check(firstThenApply({1, 3, 5, 7, 9, 10, 11, 12}, even, double) == 20)

-- io.write("\nTesting powers_generator()")
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

-- io.write("\nTesting say()")
-- check(say() == "")
-- check(say("hi")() == "hi")
-- check(say("hi")("there")() == "hi there")
-- check(say("hello")("my")("name")("is")("Colette")() == "hello my name is Colette")
-- check(say("h i")() == "h i")
-- check(say("hi ")("   there")() == "hi     there")
-- check(say("")("")("dog")("")("go")(), "  dog  go")
-- check(say("😄🤗")("💀👊🏾")() == "😄🤗 💀👊🏾")

-- io.write("\nTesting misc_file_stats()")
-- stats = misc_file_stats("NoSuchFile.txt")
-- check(stats.error == "No such file")
-- stats = misc_file_stats("../test-for-line-count.txt")
-- check(stats.lineCount == 13)
-- check(stats.blankLineCount == 7)
-- check(stats.hashedLineCount == 2)

-- io.write("\nTesting Quaternion")
-- q1 = Quaternion.new(8, 5, -3, 1)
-- check(table.concat(q1:coefficients(), ",") == "8,5,-3,1")
-- check(table.concat(q1:conjugate():coefficients(), ",") == "8,-5,3,-1")
-- q2 = Quaternion.new(0, 0, 0, 0)
-- check(table.concat(q2:coefficients(), ",") == "0,0,0,0")
-- q3 = Quaternion.new(13, 21, -5, -21)
-- q4 = Quaternion.new(2, -1, -55, 2.5)
-- check(table.concat((q3 + q4):coefficients(), ",") == "15,20,-60,-18.5")
-- q5 = Quaternion.new(3, -5, 1, -8)
-- q6 = Quaternion.new(2, -13, -2, 3)
-- check(table.concat((q5 * q6):coefficients(), ",") == "-33,-62,115,16")
-- check(table.concat((q5 * q6):conjugate():coefficients(), ",") == "-33,62,-115,-16")

print(string.format("\n\nTests passed: %d/%d", total_count - failed_count, total_count))
