import math
from typing import Generator
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
def powers_generator(base: int, limit: int) -> Generator[int, None, None]:
    iterLimit = math.floor(math.log(limit)/math.log(base))
    for i in range(iterLimit +1): 
        yield(base**i)

# Write your say function here
def say(inputString: str = None) -> str:
    if inputString == None:
        return ""
    def sayHelper(otherInputString: str = None, originalString: str = inputString) -> str:
        if otherInputString == None:
            return inputString 
        else:
            return say(f'{originalString} {otherInputString}')
    return sayHelper

# Write your line count function here
def meaningful_line_count(filePath: str) -> int:
    file = open(filePath, "r", encoding="utf8")
    lineCount = 0
    for line in file:
        firstChar = ""
        firstCharFound = False
        for char in line:
            if char != ' ' and char != '	' and char != ' ' and char != "\n" and not firstCharFound:
                firstChar = char
                firstCharFound = True
        if firstChar != "#" and firstCharFound:
            lineCount += 1
    file.close()
    return lineCount
        

# Write your Quaternion class here
