from exercises import (
    # first_then_lower_case,
    # say,
    # powers_generator,
    # meaningful_line_count,
    # Quaternion,
    change)


counts = {True: 0, False: 0}
def suite(name):
    print(f"\nTesting {name}", end="")
def expect(condition):
    counts[condition] += 1
    print(" ." if condition else " F", end="")
def expect_error(error_type, text, fun, *args):
    try:
        fun(*args)
        expect(False)
    except Exception as e:
        expect(isinstance(e, error_type))
        if text is not None:
            expect(text in str(e))

suite("change")
expect_error(TypeError, "Amount must be an integer", change, 33.375)
expect_error(ValueError, "Amount cannot be negative", change, -50)
expect(change(0) == {25: 0, 10: 0, 5: 0, 1: 0})
expect(change(1) == {25: 0, 10: 0, 5: 0, 1: 1})
expect(change(8) == {25: 0, 10: 0, 5: 1, 1: 3})
expect(change(42) == {25: 1, 10: 1, 5: 1, 1: 2})
expect(change(99) == {25: 3, 10: 2, 5: 0, 1: 4})
expect(change(144) == {25: 5, 10: 1, 5: 1, 1: 4})
expect(change(250) == {25: 10, 10: 0, 5: 0, 1: 0})
expect(change(100000000037) == {25: 4000000001, 10: 1, 5: 0, 1: 2})
expect(change(10000000000005) == {25: 400000000000, 10: 0, 5: 1, 1: 0})

# Uncomment the following tests as you complete the exercises
# and remove this comment that tells you to uncomment!

# suite("first_then_lower_case")
# def nonempty(s): return s != ""
# def length_greater_than_3(s): return len(s) > 3
# expect(first_then_lower_case([], nonempty) is None)
# expect(first_then_lower_case(["", "A", "B"], nonempty) == "a")
# expect(first_then_lower_case(["", "A", "ABC"], length_greater_than_3) is None)
# expect(first_then_lower_case(["ABC", "ABCD", "ABCDE"], length_greater_than_3) == "abcd")

# suite("say")
# expect(say() == "")
# expect(say("hi")() == "hi")
# expect(say("hi")("there")() == "hi there")
# expect(say("hello")("my")("name")("is")("Colette")() == "hello my name is Colette")
# expect(say("h i")() == "h i")
# expect(say("hi ")("   there")() == "hi     there")
# expect(say("")("")("dog")("")("go")() == "  dog  go")
# expect(say("😄🤗")("💀👊🏾")() == "😄🤗 💀👊🏾")

# suite("powers_generator")
# g1 = powers_generator(base=2, limit=1)
# expect(next(g1) == 1)
# expect_error(StopIteration, None, next, g1)
# g2 = powers_generator(base=3, limit=100)
# expect(next(g2) == 1)
# expect(next(g2) == 3)
# expect(next(g2) == 9)
# expect(next(g2) == 27)
# expect(next(g2) == 81)
# expect_error(StopIteration, None, next, g2)
# expect(list(powers_generator(base=3, limit=27)) == [1, 3, 9, 27])

# suite("meaningful_line_count")
# expect_error(FileNotFoundError, 'No such file', meaningful_line_count, "no-such-file.txt")
# expect(meaningful_line_count("../test-for-line-count.txt") == 5)

# suite("Quaternion")
# q1 = Quaternion(8, 5, -3, 1)
# expect(q1.coefficients == (8, 5, -3, 1))
# expect(q1 == Quaternion(8, 5, -3, 1))
# expect(q1.conjugate == Quaternion(8, -5, 3, -1))
# q2 = Quaternion(0, 0, 0, 0)
# expect(q2.coefficients == (0, 0, 0, 0))
# expect(q2.conjugate == Quaternion(0, 0, 0, 0))
# q3 = Quaternion(13, 21, -5, -21)
# q4 = Quaternion(2, -1, -55, 2.5)
# expect((q3 + q4).coefficients == (15, 20, -60, -18.5))
# expect((q3 + q4).conjugate == Quaternion(15, -20, 60, 18.5))
# q5 = Quaternion(3, -5, 1, -8)
# q6 = Quaternion(2, -13, -2, 3)
# expect((q5 * q6).coefficients == (-33, -62, 115, 16))
# expect((q5 * q6).conjugate == Quaternion(-33, 62, -115, -16))

print(f"\n{counts[True]} passed, {counts[False]} failed")
