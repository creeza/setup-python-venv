class Vector(object):
    def __init__(self, x = 0, y = 0):
        self.x = x
        self.y = y
    def __str__(self) -> str:
        return f'Vector({self.x}, {self.y})'
    def __add__(self, other):
        return Vector(self.x + other.x, self.y + other.y)
    def __eq__(self, other) -> bool:
        return (self.x == other.x) and (self.y == other.y)
    def __mul__(self, other):
        return self.x * other.x + self.y * other.y