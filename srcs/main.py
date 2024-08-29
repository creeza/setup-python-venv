from utils.complex import Complex
from utils.vector import Vector

if __name__ == '__main__':
    c1 = Complex(3,4)
    c2 = Complex(5,6)
    print(c1, c2)
    print(c1 == c2)
    print(c1 + c2)
    v1 = Vector(1,2)
    v2 = Vector(3,4)
    print(v1, v2)
    print(v1 == v2)
    print(v1 * v2)
