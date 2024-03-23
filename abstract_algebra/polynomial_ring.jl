using AbstractAlgebra


R, (x, y, z) = polynomial_ring(ZZ, ["x", "y", "z"])

f = x + y + z + 1;

p = f^20;

@time q = p * (p + 1)
