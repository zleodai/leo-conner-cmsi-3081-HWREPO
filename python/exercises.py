from typing import Tuple, List, Callable
from dataclasses import dataclass

def change(amount: int) -> Tuple[int, int, int, int]:
    if not isinstance(amount, int):
        raise TypeError('Amount must be an integer')
    if amount < 0:
        raise ValueError('Amount cannot be negative')
    change_counts = []
    for denomination in (25, 10, 5, 1):
        coins, amount = divmod(amount, denomination)
        change_counts.append(coins)
    return tuple(change_counts)

# Write your first then lower case function here

# Write your powers generator here

# Write your say function here

# Write your misc file stats function here

# Write your Quaternion class here
