# Write your solutions to the exercises in this file.

from typing import Tuple

def change(amount: int) -> Tuple[int, int, int, int]:
    if not isinstance(amount, int):
        raise TypeError('amount must be an integer')
    if amount < 0:
        raise ValueError('amount cannot be negative')
    change_counts = []
    for denomination in (25, 10, 5, 1):
        coins, amount = divmod(amount, denomination)
        change_counts.append(coins)
    return tuple(change_counts)
