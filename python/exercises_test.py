from exercises import (
    # first_then_lower_case,
    # say,
    # powers_generator,
    # file_stats,
    # Quaternion,
    change)


counts = {True: 0, False: 0}
def suite(title):
    print(f"\nTesting {title}", end="")
def check(condition):
    counts[condition] += 1
    print(" ." if condition else ". F", end="")
def check_error(error_type, text, fun, *args):
    try:
        fun(*args)
        check(False)
    except Exception as e:
        check(isinstance(e, error_type))
        if text is not None:
            check(text in str(e))

suite("change")
check_error(TypeError, "Amount must be an integer", change, 3.5)
check_error(ValueError, "Amount cannot be negative", change, -50)
check(change(0) == {25: 0, 10: 0, 5: 0, 1: 0})
check(change(99) == {25: 3, 10: 2, 5: 0, 1: 4})
check(change(8) == {25: 0, 10: 0, 5: 1, 1: 3})
check(change(42) == {25: 1, 10: 1, 5: 1, 1: 2})
check(change(250) == {25: 10, 10: 0, 5: 0, 1: 0})
check(change(144) == {25: 5, 10: 1, 5: 1, 1: 4})
check(change(97) == {25: 3, 10: 2, 5: 0, 1: 2})
check(change(100000000037) == {25: 4000000001, 10: 1, 5: 0, 1: 2})
check(change(10000000000005) == {25: 400000000000, 10: 0, 5: 1, 1: 0})

# Uncomment the following tests as you complete the exercises
# and remove this comment that tells you to uncomment!

# suite("first_then_lower_case")
# def nonempty(s): return s != ""
# def length_greater_than_3(s): return len(s) > 3
# check(first_then_lower_case([], nonempty) is None)
# check(first_then_lower_case(["", "A", "B"], nonempty) == "a")
# check(first_then_lower_case(["", "A", "ABC"], length_greater_than_3) is None)
# check(first_then_lower_case(["ABC", "ABCD", "ABCDE"], length_greater_than_3) == "abcd")

# suite("say")
# check(say() == "")
# check(say("hi")() == "hi")
# check(say("hi")("there")() == "hi there")
# check(say("hello")("my")("name")("is")("Colette")() == "hello my name is Colette")
# check(say("h i")() == "h i")
# check(say("hi ")("   there")() == "hi     there")
# check(say("")("")("dog")("")("go")() == "  dog  go")
# check(say("😄🤗")("💀👊🏾")() == "😄🤗 💀👊🏾")

# suite("powers_generator")
# g1 = powers_generator(base=2, limit=1)
# check(next(g1) == 1)
# check_error(StopIteration, None, next, g1)
# g2 = powers_generator(base=3, limit=100)
# check(next(g2) == 1)
# check(next(g2) == 3)
# check(next(g2) == 9)
# check(next(g2) == 27)
# check(next(g2) == 81)
# check_error(StopIteration, None, next, g2)
# check(list(powers_generator(base=3, limit=27)) == [1, 3, 9, 27])

# suite("file_stats")
# check_error(FileNotFoundError, 'No such file', file_stats, "NoSuchFile.txt")
# check(file_stats("../test-for-line-count.txt") == {
#     "lineCount": 13, "blankLineCount": 7, "hashedLineCount": 2})

# suite("Quaternion")
# q1 = Quaternion(8, 5, -3, 1)
# check(q1.coefficients == (8, 5, -3, 1))
# check(q1 == Quaternion(8, 5, -3, 1))
# check(q1.conjugate == Quaternion(8, -5, 3, -1))
# q2 = Quaternion(0, 0, 0, 0)
# check(q2.coefficients == (0, 0, 0, 0))
# check(q2.conjugate == Quaternion(0, 0, 0, 0))
# q3 = Quaternion(13, 21, -5, -21)
# q4 = Quaternion(2, -1, -55, 2.5)
# check((q3 + q4).coefficients == (15, 20, -60, -18.5))
# check((q3 + q4).conjugate == Quaternion(15, -20, 60, 18.5))
# q5 = Quaternion(3, -5, 1, -8)
# q6 = Quaternion(2, -13, -2, 3)
# check((q5 * q6).coefficients == (-33, -62, 115, 16))
# check((q5 * q6).conjugate == Quaternion(-33, 62, -115, -16))

print(f"\n{counts[True]} passed, {counts[False]} failed")
