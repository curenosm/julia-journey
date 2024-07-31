using AbstractAlgebra

R = GF(7)

S, y = polynomial_ring(R, "y")
T, = residue_ring(S, y^3 + 3y + 1)

U, z = polynomial_ring(T, "z")

f = (3y^2 + y + 2) * z^2 + (2 * y^2 + 1) * z + 4y + 3;

g = (7y^2 - y + 7) * z^2 + (3y^2 + 1) * z + 2y + 1;

s = f^4;

t = (s + g)^4;

@time resultant(s, t)
