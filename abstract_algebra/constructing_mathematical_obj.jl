using AbstractAlgebra


n = ZZ(12345678765456787654567890987654567898765678909876567890)


# Constructing parent objects

R, x = polynomial_ring(ZZ, :x)
f = x^3 + 3x + 1
g = R(12)


# Lista de constructores de Parent objects

R = ZZ  # Integers
R = QQ  # Rational numbers

p = 7  # Prime or prime power
R = GF(p)  # Finite field with 7 elements

R, = residue_ring(ZZ, 3)  # Integers modulo 3
S, x = polynomial_ring(R, :x)  # Polynomials in x with coefficients in R
