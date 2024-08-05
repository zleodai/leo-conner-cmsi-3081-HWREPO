import unittest
from exercises import (
    # stretched,
    # say,
    # powers_generator,
    # misc_file_stats,
    # Quaternion,
    change)


class TestExercises(unittest.TestCase):

    def test_change(self):
        self.assertEqual(change(0), (0, 0, 0, 0))
        self.assertEqual(change(99), (3, 2, 0, 4))
        self.assertEqual(change(8), (0, 0, 1, 3))
        self.assertEqual(change(42), (1, 1, 1, 2))
        self.assertEqual(change(250), (10, 0, 0, 0))
        self.assertEqual(change(144), (5, 1, 1, 4))
        self.assertEqual(change(97), (3, 2, 0, 2))
        self.assertEqual(change(100000000037), (4000000001, 1, 0, 2))
        self.assertEqual(change(10000000000005), (400000000000, 0, 1, 0))
        with self.assertRaisesRegex(TypeError, "Amount must be an integer"):
            change(988.25)
        with self.assertRaisesRegex(ValueError, "Amount cannot be negative"):
            change(-50)

    # Uncomment the following tests as you complete the exercises
    # and remove this comment that tells you to uncomment!

    # def test_stretched(self):
    #     self.assertEqual(stretched(""), "")
    #     self.assertEqual(stretched("  "), "")
    #     self.assertEqual(stretched("  \t\n  \t"), "")
    #     self.assertEqual(stretched("  Hi  hi  "), "Hiihhhiiii")
    #     self.assertEqual(stretched("a        π§"), "aππ§§§")
    #     self.assertEqual(stretched("😁😂😱"), "😁😂😂😱😱😱")
    #     self.assertEqual(stretched(" 😄   🤗 💀  "), "😄🤗🤗💀💀💀")
    #     self.assertEqual(
    #         stretched("hello world"),
    #         "heelllllllooooowwwwwwooooooorrrrrrrrllllllllldddddddddd"
    #     )

    # def test_say(self):
    #     self.assertEqual(say(), "")
    #     self.assertEqual(say("hi")(), "hi")
    #     self.assertEqual(say("hi")("there")(), "hi there")
    #     self.assertEqual(
    #         say("hello")("my")("name")("is")("Colette")(),
    #         "hello my name is Colette"
    #     )
    #     self.assertEqual(say("h i")(), "h i")
    #     self.assertEqual(say("hi ")("   there")(), "hi     there")
    #     self.assertEqual(say("")("")("dog")("")("go")(), "  dog  go")
    #     self.assertEqual(say("😄🤗")("💀👊🏾")(), "😄🤗 💀👊🏾")

    # def test_powers_generator(self):
    #     g1 = powers_generator(base=2, limit=1)
    #     self.assertEqual(next(g1), 1)
    #     with self.assertRaises(StopIteration):
    #         next(g1)
    #     g2 = powers_generator(base=3, limit=100)
    #     self.assertEqual(next(g2), 1)
    #     self.assertEqual(next(g2), 3)
    #     self.assertEqual(next(g2), 9)
    #     self.assertEqual(next(g2), 27)
    #     self.assertEqual(next(g2), 81)
    #     with self.assertRaises(StopIteration):
    #         next(g2)
    #     self.assertEqual(list(powers_generator(base=3, limit=27)), [1, 3, 9, 27])

    # def test_misc_file_stats(self):
    #     self.assertEqual(
    #         misc_file_stats("NoSuchFile.txt"),
    #         {"error": "No such file"})
    #     self.assertEqual(
    #         misc_file_stats("../test-for-line-count.txt"),
    #         {"lineCount": 13, "blankLineCount": 7, "hashedLineCount": 2})

    # def test_Quaternion(self):
    #     q1 = Quaternion(8, 5, -3, 1)
    #     self.assertEqual(q1.coefficients, (8, 5, -3, 1))
    #     q2 = Quaternion(0, 0, 0, 0)
    #     self.assertEqual(q2.coefficients, (0, 0, 0, 0))
    #     q3 = Quaternion(13, 21, -5, -21)
    #     q4 = Quaternion(2, -1, -55, 2.5)
    #     self.assertEqual((q3 + q4).coefficients, (15, 20, -60, -18.5))
    #     q5 = Quaternion(3, -5, 1, -8)
    #     q6 = Quaternion(2, -13, -2, 3)
    #     self.assertEqual((q5 * q6).coefficients, (-33, -62, 115, 16))


if __name__ == '__main__':
    unittest.main()
