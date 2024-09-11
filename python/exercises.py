import math
from dataclasses import dataclass
from collections.abc import Callable


def change(amount: int) -> dict[int, int]:
    if not isinstance(amount, int):
        raise TypeError('Amount must be an integer')
    if amount < 0:
        raise ValueError('Amount cannot be negative')
    counts, remaining = {}, amount
    for denomination in (25, 10, 5, 1):
        counts[denomination], remaining = divmod(remaining, denomination)
    return counts


# Write your first then lower case function here
def first_then_lower_case(strList: list[str], filterFunction: Callable[[str], bool]) -> str:
    for string in strList:
        if filterFunction(string):
            if len(string) != 0:
                return str.lower(string)
            return None
    return None
    
# Write your powers generator here
def powers_generator(base: int, limit: int) -> int:
    iterLimit = math.floor(math.log(limit)/math.log(base))
    for i in range(iterLimit +1): 
        yield(base**i)

# Write your say function here
def say(inputString: str = None) -> str:
  if inputString == None:
      return ""
  sayHelper = lambda otherInputString = None: inputString if inputString == None else say(inputString + " " + otherInputString)
  return sayHelper

# Write your line count function here


# Write your Quaternion class here
