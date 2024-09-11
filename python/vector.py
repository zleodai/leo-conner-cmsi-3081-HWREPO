from dataclasses import dataclass
import math

#makes immutable
@dataclass(frozen = True)
class Vector:
    i: float
    j: float
    k: float
    
    def __str__(self) -> str:
        return f"<{self.i}i, {self.j}j, {self.k}k>"
        
    def magnitude(self) -> float:
        return math.hypot(self.i, self.j, self.k)

v = Vector(3, 4, 2)
print(v)
print(v.magnitude())
print(v.i, v.j, v.k)