import math
import os
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
    def sayHelper(otherInputString: str = None) -> str:
        if otherInputString == None:
            return inputString 
        else:
            return say(f'{inputString} {otherInputString}')
    return sayHelper

# Write your line count function here
def meaningful_line_count(filePath: str) -> int:
    if not os.path.exists(filePath):
        raise FileNotFoundError("No such file")
    
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
@dataclass(frozen=True)
class Quaternion:
    a: float
    b: float
    c: float
    d: float
    
    def __str__(self) -> str:
        quatString = ""
        
        if self.a != 0: quatString = f"{self.a}"
        
        if self.b == 1 and len(quatString) == 0: quatString = f"{quatString}i"
        elif self.b == 1: quatString = f"{quatString}+i"
        elif self.b == -1: quatString = f"{quatString}-i"
        elif self.b > 0: quatString = f"{quatString}+{self.b}i"
        elif self.b < 0: quatString = f"{quatString}{self.b}i"
        
        if self.c == 1 and len(quatString) == 0: quatString = f"{quatString}j"
        elif self.c == 1: quatString = f"{quatString}+j"
        elif self.c == -1: quatString = f"{quatString}-j"
        elif self.c > 0: quatString = f"{quatString}+{self.c}j"
        elif self.c < 0: quatString = f"{quatString}{self.c}j"
        
        if self.d == 1 and len(quatString) == 0: quatString = f"{quatString}k"
        elif self.d == 1: quatString = f"{quatString}+k"
        elif self.d == -1: quatString = f"{quatString}-k"
        elif self.d > 0: quatString = f"{quatString}+{self.d}k"
        elif self.d < 0: quatString = f"{quatString}{self.d}k"
        
        if len(quatString) == 0: quatString = "0"
        
        return quatString
    
    def __mul__(self, a: object) -> object:
        productQuaternion = Quaternion((self.a * a.a) - (self.b * a.b) - (self.c * a.c) - (self.d * a.d),
                                       (self.a * a.b) + (self.b * a.a) + (self.c * a.d) - (self.d * a.c),
                                       (self.a * a.c) - (self.b * a.d) + (self.c * a.a) + (self.d * a.b),
                                       (self.a * a.d) + (self.b * a.c) - (self.c * a.b) + (self.d * a.a))
        return productQuaternion
    
    def __add__(self, a: object) -> object:
        sumQuaternion = Quaternion(self.a + a.a, self.b + a.b, self.c + a.c, self.d + a.d)
        return sumQuaternion
    
    def __eq__(self, a: object) -> bool:
        return self.a == a.a and self.b == a.b and self.c == a.c and self.d == a.d
    
    @property
    def coefficients(self) -> object:
        return (self.a, self.b, self.c, self.d)
    
    @property
    def conjugate(self) -> object:
        return Quaternion(self.a, -self.b, -self.c, -self.d)