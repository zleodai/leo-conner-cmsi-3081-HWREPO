import unittest
from exercises import change


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
        with self.assertRaisesRegex(TypeError, "amount must be an integer"):
            change(988.25)
        with self.assertRaisesRegex(ValueError, "amount cannot be negative"):
            change(-50)


if __name__ == '__main__':
    print('GOOOOOOOOOOOO')
    unittest.main()
