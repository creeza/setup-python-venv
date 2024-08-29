class Complex(object):
    def __init__(self, real = 0, imag = 0):
        self.real = real
        self.imag = imag

    def __str__(self) -> str:
        return f'Complex({self.real}, {self.imag})'
    
    def __add__(self, other):
        if isinstance(other, Complex):
            return Complex(self.real + other.real, self.imag + other.imag)
        else:
            raise TypeError('Unsupported operand type for + !!!')

    def __eq__(self, other) -> bool:
        return (self.real == other.real) and (self.real == other.imag)
    
    def conjugate(self):
        return Complex(self.real, -self.imag)
