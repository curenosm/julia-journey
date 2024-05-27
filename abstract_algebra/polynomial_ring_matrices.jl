using AbstractAlgebra


R, x = polynomial_ring(ZZ, "x")

S = matrix_space(R, 10, 10)

M = rand(S, 0:3, -10:10);

@time det(M)
